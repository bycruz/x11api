local ffi = require("ffi")

local test = require("lde-test")

local x11 = require("x11api")

-- CWOverrideRedirect, the XCreateWindow attribute mask that marks a window as one a
-- window manager has to leave alone.
local cwOverrideRedirect = 0x0200

-- Subscribe to StructureNotify, map the window, and drain events until MapNotify arrives.
-- This ensures the window is actually viewable before proceeding, on any display server.
local function mapWindowAndWait(display, window)
	x11.selectInput(display, window, x11.EventMaskBits.StructureNotify)
	x11.mapWindow(display, window)
	x11.flush(display)

	local event = x11.Event()
	repeat
		x11.nextEvent(display, event)
	until event.type == x11.EventType.MapNotify
end

local function createWindow(display, parent, x, y, width, height)
	local window = x11.createSimpleWindow(display, parent, x, y, width, height, 0, 0, 0)
	local attrs = x11.getWindowAttributes(display, window)
	test.notEqual(attrs, nil)

	return window
end

--- Reads the next event, giving up after a number of empty polls: an answer the display
--- never sends would otherwise hang the whole run instead of failing one test.
---@param display x11.ffi.Display
---@param polls number
---@return x11.ffi.Event?
local function nextEventWithin(display, polls)
	local event = x11.Event()

	local i = 0
	while x11.pending(display) == 0 do
		i = i + 1
		if i > polls then return nil end
	end

	x11.nextEvent(display, event)
	return event
end

test.it("should keep the event union at the size and layout Xlib uses", function()
	-- The union is padded to what Xlib's XEvent takes, so adding selection events to it
	-- must not change what a caller passes to XNextEvent.
	test.equal(ffi.sizeof("XEvent"), 192)
	test.equal(ffi.sizeof("XSelectionRequestEvent"), 80)
	test.equal(ffi.sizeof("XSelectionEvent"), 72)
	test.equal(ffi.sizeof("XSelectionClearEvent"), 56)
end)

test.it("should intern atoms in one call and reuse them by name", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local names = { "CLIPBOARD", "UTF8_STRING", "TARGETS" }
	local atoms = x11.internAtoms(display, names)

	test.equal(#atoms, #names)
	for i = 1, #names do
		test.greater(atoms[i], 0)
		-- The same name always names the same atom, whichever call interned it.
		test.equal(atoms[i], x11.internAtom(display, names[i], 0))
	end

	test.notEqual(atoms[1], atoms[2])
end)

test.it("should set a selection owner and let another window take over", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)
	local first = createWindow(display, root, 0, 0, 100, 100)
	local second = createWindow(display, root, 0, 0, 100, 100)

	-- A name of our own rather than one of the well known selections: a clipboard manager
	-- running on the display is free to own those, and this test is about what the two
	-- windows do.
	local selection = x11.internAtom(display, "X11API_TEST_OWNERSHIP", 0)

	-- No window of ours has claimed it.
	test.equal(x11.getSelectionOwner(display, selection), 0)

	x11.setSelectionOwner(display, selection, first, 0)
	x11.sync(display, x11.False)
	test.equal(x11.getSelectionOwner(display, selection), first)

	-- A second window claiming the same selection takes it from the first.
	x11.setSelectionOwner(display, selection, second, 0)
	x11.sync(display, x11.False)
	test.equal(x11.getSelectionOwner(display, selection), second)

	-- None gives the selection up again.
	x11.setSelectionOwner(display, selection, 0, 0)
	x11.sync(display, x11.False)
	test.equal(x11.getSelectionOwner(display, selection), 0)
end)

test.it("should tell the old owner when another client takes a selection", function()
	-- Two connections to the same display are two clients, and a window only hears that it
	-- lost a selection when the window taking it over belongs to somebody else.
	local ownerDisplay = x11.openDisplay(nil)
	test.notEqual(ownerDisplay, nil) ---@cast ownerDisplay -nil
	local otherDisplay = x11.openDisplay(nil)
	test.notEqual(otherDisplay, nil) ---@cast otherDisplay -nil

	local selection = x11.internAtom(ownerDisplay, "X11API_TEST_TAKEOVER", 0)
	local ownerWindow = createWindow(ownerDisplay, x11.defaultRootWindow(ownerDisplay), 0, 0, 100, 100)
	local takerWindow = createWindow(otherDisplay, x11.defaultRootWindow(otherDisplay), 0, 0, 100, 100)

	x11.setSelectionOwner(ownerDisplay, selection, ownerWindow, 0)
	x11.sync(ownerDisplay, x11.False)
	-- The other connection sees the owner this one claimed.
	test.equal(x11.getSelectionOwner(otherDisplay, selection), ownerWindow)

	x11.setSelectionOwner(otherDisplay, selection, takerWindow, 0)
	x11.sync(otherDisplay, x11.False)

	local lost = nextEventWithin(ownerDisplay, 5000000)
	test.notEqual(lost, nil, "the window that lost the selection was never told")
	---@cast lost -nil
	test.equal(lost.type, x11.EventType.SelectionClear)
	test.equal(lost.xselectionclear.owner, ownerWindow)
	test.equal(lost.xselectionclear.selection, selection)

	test.equal(x11.getSelectionOwner(ownerDisplay, selection), takerWindow)
end)

test.it("should round trip a 32-bit property and delete it", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)
	local window = createWindow(display, root, 0, 0, 100, 100)

	local atoms = x11.internAtoms(display, { "X11API_TEST_ATOMS", "ATOM" })
	local property, atomType = atoms[1], atoms[2]
	local values = { 0x1234, 42, 999999, 7 }

	test.equal(x11.getAtomProperty(display, window, property), nil)

	x11.setAtomProperty(display, window, property, atomType, values)
	x11.sync(display, x11.False)

	local read = x11.getAtomProperty(display, window, property)
	test.notEqual(read, nil) ---@cast read -nil
	test.deepEqual(read, values)

	-- A property that is not a 32-bit list is not one; and the other way round, an 8-bit
	-- string is not read back as atoms.
	local textProperty = x11.internAtom(display, "X11API_TEST_TEXT_FORMAT", 0)
	local text = "not atoms"
	x11.changeProperty(display, window, "X11API_TEST_TEXT_FORMAT", "STRING", 8, x11.PropMode.Replace, text, #text)
	x11.sync(display, x11.False)

	test.equal(x11.getAtomProperty(display, window, textProperty), nil)
	test.equal(x11.getProperty(display, window, property), nil)

	x11.deleteProperty(display, window, property)
	x11.sync(display, x11.False)
	test.equal(x11.getAtomProperty(display, window, property), nil)
end)

test.it("should read back an 8-bit property of any length", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)
	local window = createWindow(display, root, 0, 0, 100, 100)

	local shortProperty = x11.internAtom(display, "X11API_TEST_SHORT", 0)
	local longProperty = x11.internAtom(display, "X11API_TEST_LONG", 0)
	local missingProperty = x11.internAtom(display, "X11API_TEST_MISSING", 0)

	-- A property that was never set has no value at all, which is not the same as an
	-- empty one.
	test.equal(x11.getProperty(display, window, missingProperty), nil)

	local short = "clipboard"
	x11.changeProperty(display, window, "X11API_TEST_SHORT", "UTF8_STRING", 8, x11.PropMode.Replace, short, #short)

	-- Longer than one 32-bit word by a wide margin, so the words the offset is counted in
	-- cannot cover it by accident.
	local long = string.rep("selection->", 5000) .. "end"
	x11.changeProperty(display, window, "X11API_TEST_LONG", "UTF8_STRING", 8, x11.PropMode.Replace, long, #long)
	x11.sync(display, x11.False)

	test.equal(x11.getProperty(display, window, shortProperty), short)
	test.greater(#long, 4)
	test.equal(x11.getProperty(display, window, longProperty), long)

	-- Reading with delete takes the property away, so the next read finds nothing.
	test.equal(x11.getProperty(display, window, shortProperty, true), short)
	test.equal(x11.getProperty(display, window, shortProperty), nil)
end)

test.it("should name the type a property came back as, and write one from atoms", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)
	local window = createWindow(display, root, 0, 0, 100, 100)

	-- The atoms the protocol fixes, which a caller reads off the enum rather than interning:
	-- interning one of these names can only give the atom that was already there.
	test.equal(x11.XA.STRING, x11.internAtom(display, "STRING", 1))
	test.equal(x11.XA.ATOM, x11.internAtom(display, "ATOM", 1))
	test.equal(x11.XA.CARDINAL, x11.internAtom(display, "CARDINAL", 1))

	local textProperty = x11.internAtom(display, "X11API_TEST_TYPED_TEXT", 0)
	local atomListProperty = x11.internAtom(display, "X11API_TEST_TYPED_ATOMS", 0)

	local text = "typed payload"
	x11.setProperty(display, window, textProperty, x11.XA.STRING, 8, x11.PropMode.Replace, text, #text)
	x11.sync(display, x11.False)

	-- The bytes are what was written, and the type is what they were written as: a reader
	-- that has to know whether it is holding UTF-8 or Latin-1 has nowhere else to look.
	local read, storedAs = x11.getProperty(display, window, textProperty)
	test.equal(read, text)
	test.equal(storedAs, x11.XA.STRING)

	-- The same door writes a 32-bit list of atoms, which is what a window being told what a
	-- drag is carrying leaves behind.
	local values = { x11.XA.STRING, x11.XA.ATOM, x11.XA.CARDINAL }
	x11.setProperty(display, window, atomListProperty, x11.XA.ATOM, 32, x11.PropMode.Replace,
		ffi.new("long[3]", values), 3)
	x11.sync(display, x11.False)

	local atoms = x11.getAtomProperty(display, window, atomListProperty)
	test.notEqual(atoms, nil) ---@cast atoms -nil
	test.deepEqual(atoms, values)

	-- A property that was never set has no type either, which is what a caller reads as
	-- "there is nothing here".
	local missing, missingType = x11.getProperty(display, window,
		x11.internAtom(display, "X11API_TEST_TYPED_MISSING", 0))
	test.equal(missing, nil)
	test.equal(missingType, 0)
end)

test.it("should translate coordinates between the root and a window", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)

	-- The window is created override-redirect, which is what asks a window manager to
	-- leave it alone. A managed window is up for grabs -- reparented into a frame of the
	-- manager's own, moved where the manager wants it -- and then neither the offset it
	-- was created with nor the position its attributes report mean what they say, so the
	-- translation could only be compared against itself.
	-- A depth of zero and no visual are CopyFromParent, so the window looks like its
	-- parent in every way except for the one attribute that is being set.
	local attributes = x11.SetWindowAttributes()
	attributes.override_redirect = x11.True
	local window = x11.createWindow(display, root, 40, 60, 200, 150, 0, 0,
		x11.WindowClass.CopyFromParent, nil, cwOverrideRedirect, attributes)
	mapWindowAndWait(display, window)

	-- Where the window sits on the screen, and which child of the root holds it: nothing
	-- adopted it, so it is still where it was put, and the child is the window itself.
	local screenX, screenY, child = x11.translateCoordinates(display, window, root, 0, 0)
	test.equal(screenX, 40)
	test.equal(screenY, 60)
	test.equal(child, window)

	local attrs = x11.getWindowAttributes(display, window)
	test.notEqual(attrs, nil) ---@cast attrs -nil
	test.equal(screenX, attrs.x)
	test.equal(screenY, attrs.y)

	-- A point inside the window is the same point seen from either side of the walk.
	local x, y = x11.translateCoordinates(display, root, window, 40 + 7, 60 + 11)
	test.equal(x, 7)
	test.equal(y, 11)

	-- A window of our own inside it keeps the offset it was created with, whichever way a
	-- window manager placed its parent, and the translation names it as the child that
	-- holds the point.
	local innerWindow = createWindow(display, window, 25, 35, 50, 50)
	mapWindowAndWait(display, innerWindow)

	local innerX, innerY, innerChild = x11.translateCoordinates(display, innerWindow, window, 0, 0)
	test.equal(innerX, 25)
	test.equal(innerY, 35)
	test.equal(innerChild, innerWindow)

	local backX, backY = x11.translateCoordinates(display, window, innerWindow, 25 + 3, 35 + 4)
	test.equal(backX, 3)
	test.equal(backY, 4)
end)

test.it("should answer a selection request with a notify", function()
	local display = x11.openDisplay(nil)
	test.notEqual(display, nil) ---@cast display -nil

	local root = x11.defaultRootWindow(display)
	local ownerWindow = createWindow(display, root, 0, 0, 100, 100)
	local requestorWindow = createWindow(display, root, 0, 0, 100, 100)

	local atoms = x11.internAtoms(display, { "X11API_TEST_SELECTION", "UTF8_STRING" })
	local clipboard, utf8String = atoms[1], atoms[2]
	local dataProperty = x11.internAtom(display, "X11API_TEST_SELECTION_DATA", 0)

	x11.setSelectionOwner(display, clipboard, ownerWindow, 0)
	x11.sync(display, x11.False)
	test.equal(x11.getSelectionOwner(display, clipboard), ownerWindow)

	-- Asking for the selection turns into a SelectionRequest for the owner, which answers
	-- it by putting the data where it was asked to and notifying the requestor. Both
	-- windows belong to this process, so the whole exchange runs in this event loop.
	x11.convertSelection(display, clipboard, utf8String, dataProperty, requestorWindow, 0)
	x11.flush(display)

	local text = "selection exchange payload"

	local event = x11.Event()
	while true do
		local next = nextEventWithin(display, 5000000)
		test.notEqual(next, nil, "the display never answered the selection request")
		---@cast next -nil

		if next.type == x11.EventType.SelectionRequest then
			test.equal(next.xselectionrequest.owner, ownerWindow)
			test.equal(next.xselectionrequest.requestor, requestorWindow)
			test.equal(next.xselectionrequest.selection, clipboard)
			test.equal(next.xselectionrequest.target, utf8String)
			test.equal(next.xselectionrequest.property, dataProperty)

			x11.changeProperty(display, next.xselectionrequest.requestor, "X11API_TEST_SELECTION_DATA",
				"UTF8_STRING", 8, x11.PropMode.Replace, text, #text)

			local reply = x11.Event()
			reply.type = x11.EventType.SelectionNotify
			reply.xselection.requestor = next.xselectionrequest.requestor
			reply.xselection.selection = next.xselectionrequest.selection
			reply.xselection.target = next.xselectionrequest.target
			reply.xselection.property = next.xselectionrequest.property
			reply.xselection.time = next.xselectionrequest.time

			x11.sendEvent(display, next.xselectionrequest.requestor, x11.False, 0, reply)
			x11.flush(display)
		elseif next.type == x11.EventType.SelectionNotify then
			test.equal(next.xselection.requestor, requestorWindow)
			test.equal(next.xselection.selection, clipboard)
			test.equal(next.xselection.target, utf8String)
			test.equal(next.xselection.property, dataProperty)
			break
		end
	end

	test.equal(x11.getProperty(display, requestorWindow, dataProperty), text)
end)
