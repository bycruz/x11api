local ffi = require("ffi")

ffi.cdef([[#embed "x11/ffi/ffidefs.h"]])

---@class x11.Fns
---@field XOpenDisplay fun(display_name: string?): x11.ffi.Display?
---@field XCloseDisplay fun(display: x11.ffi.Display): number
---@field XDestroyWindow fun(display: x11.ffi.Display, window: number)
---@field XDefaultRootWindow fun(display: x11.ffi.Display): number
---@field XCreateSimpleWindow fun(display: x11.ffi.Display, parent: number, x: number, y: number, width: number, height: number, border_width: number, border: number, background: number): number
---@field XCreateWindow fun(display: x11.ffi.Display, parent: number, x: number, y: number, width: number, height: number, border_width: number, depth: number, class: number, visual: ffi.cdata*, valuemask: number, attributes: x11.ffi.SetWindowAttributes): number
---@field XMapWindow fun(display: x11.ffi.Display, w: number)
---@field XInternAtom fun(display: x11.ffi.Display, atom_name: string, only_if_exists: number): number
---@field XSetWMProtocols fun(display: x11.ffi.Display, window: number, protocols: number[], count: number): number
---@field XNextEvent fun(display: x11.ffi.Display, event_return: x11.ffi.Event)
---@field XPeekEvent fun(display: x11.ffi.Display, event_return: x11.ffi.Event)
---@field XDefaultScreen fun(display: x11.ffi.Display): number
---@field XPending fun(display: x11.ffi.Display): number
---@field XSelectInput fun(display: x11.ffi.Display, w: number, event_mask: number)
---@field XGetWindowAttributes fun(display: x11.ffi.Display, w: number, window_attributes_return: x11.ffi.WindowAttributes): number
---@field XCreateFontCursor fun(display: x11.ffi.Display, shape: number): number
---@field XDefineCursor fun(display: x11.ffi.Display, w: number, cursor: number)
---@field XUndefineCursor fun(display: x11.ffi.Display, w: number)
---@field XFreeCursor fun(display: x11.ffi.Display, cursor: number)
---@field XFlush fun(display: x11.ffi.Display)
---@field XChangeProperty fun(display: x11.ffi.Display, w: number, property: number, type: number, format: number, mode: number, data: string|ffi.cdata*, nelements: number)
---@field XSendEvent fun(display: x11.ffi.Display, w: number, propagate: number, event_mask: number, event_send: x11.ffi.Event): number
---@field XSync fun(display: x11.ffi.Display, discard: number)
---@field XKeycodeToKeysym fun(display: x11.ffi.Display, keycode: number, index: number): number
---@field XLookupString fun(event_struct: x11.ffi.Event, buffer_return: ffi.cdata*, bytes_buffer: number, keysym_return: ffi.cdata*, status_in_out: ffi.cdata*): number
---@field XWarpPointer fun(display: x11.ffi.Display, src_w: number, dest_w: number, src_x: number, src_y: number, src_width: number, src_height: number, dest_x: number, dest_y: number): number
---@field XQueryPointer fun(display: x11.ffi.Display, w: number, root_return: ffi.cdata*, child_return: ffi.cdata*, root_x_return: ffi.cdata*, root_y_return: ffi.cdata*, win_x_return: ffi.cdata*, win_y_return: ffi.cdata*, mask_return: ffi.cdata*): number
---@field XGrabPointer fun(display: x11.ffi.Display, grab_window: number, owner_events: number, event_mask: number, pointer_mode: number, keyboard_mode: number, confine_to: number, cursor: number, time: number): number
---@field XUngrabPointer fun(display: x11.ffi.Display, time: number): number
---@field XGrabKeyboard fun(display: x11.ffi.Display, grab_window: number, owner_events: number, pointer_mode: number, keyboard_mode: number, time: number): number
---@field XUngrabKeyboard fun(display: x11.ffi.Display, time: number): number
---@field XGetKeyboardMapping fun(display: x11.ffi.Display, first_keycode: number, keycode_count: number, keysyms_per_keycode_return: ffi.cdata*): ffi.cdata*
---@field XServerVendor fun(display: x11.ffi.Display): ffi.cdata*
---@field XResizeWindow fun(display: x11.ffi.Display, w: number, width: number, height: number): number
---@field XMoveWindow fun(display: x11.ffi.Display, w: number, x: number, y: number): number
---@field XStoreName fun(display: x11.ffi.Display, w: number, window_name: string): number
---@field XFetchName fun(display: x11.ffi.Display, w: number, window_name_return: ffi.cdata*): number
---@field XFree fun(data: ffi.cdata*)
---@field XGetEventData fun(display: x11.ffi.Display, cookie: x11.ffi.GenericEventCookie): boolean
---@field XFreeEventData fun(display: x11.ffi.Display, cookie: x11.ffi.GenericEventCookie)
---@field XCreatePixmapCursor fun(display: x11.ffi.Display, source: number, mask: number, foreground_color: x11.ffi.Color, background_color: x11.ffi.Color, x: number, y: number): number
---@field XCreatePixmap fun(display: x11.ffi.Display, d: number, width: number, height: number, depth: number): number
---@field XFreePixmap fun(display: x11.ffi.Display, pixmap: number)
---@field XSetWindowBackgroundPixmap fun(display: x11.ffi.Display, w: number, background_pixmap: number)
---@field XDefaultColormap fun(display: x11.ffi.Display, screen: number): number
---@field XCreateGC fun(display: x11.ffi.Display, d: number, valuemask: number, values: ffi.cdata*?): x11.ffi.GC
---@field XSetForeground fun(display: x11.ffi.Display, gc: x11.ffi.GC, foreground: number): number
---@field XSetBackground fun(display: x11.ffi.Display, gc: x11.ffi.GC, background: number): number
---@field XSetLineAttributes fun(display: x11.ffi.Display, gc: x11.ffi.GC, line_width: number, line_style: number, cap_style: number, join_style: number): number
---@field XFillRectangle fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number, width: number, height: number): number
---@field XDrawRectangle fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number, width: number, height: number): number
---@field XDrawLine fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x1: number, y1: number, x2: number, y2: number): number
---@field XDrawPoint fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number): number
---@field XDrawString fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number, string: string, length: number): number
---@field XFillArc fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number, width: number, height: number, angle1: number, angle2: number): number
---@field XDrawArc fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, x: number, y: number, width: number, height: number, angle1: number, angle2: number): number
---@field XClearWindow fun(display: x11.ffi.Display, w: number): number
---@field XClearArea fun(display: x11.ffi.Display, w: number, x: number, y: number, width: number, height: number, exposures: number): number
---@field XFreeGC fun(display: x11.ffi.Display, gc: x11.ffi.GC): number
---@field XSetFillStyle fun(display: x11.ffi.Display, gc: x11.ffi.GC, fill_style: number): number
---@field XSetFillRule fun(display: x11.ffi.Display, gc: x11.ffi.GC, fill_rule: number): number
---@field XSetArcMode fun(display: x11.ffi.Display, gc: x11.ffi.GC, arc_mode: number): number
---@field XSetFunction fun(display: x11.ffi.Display, gc: x11.ffi.GC, function: number): number
---@field XSetTile fun(display: x11.ffi.Display, gc: x11.ffi.GC, tile: number): number
---@field XSetStipple fun(display: x11.ffi.Display, gc: x11.ffi.GC, stipple: number): number
---@field XSetTSOrigin fun(display: x11.ffi.Display, gc: x11.ffi.GC, x: number, y: number): number
---@field XSetDashes fun(display: x11.ffi.Display, gc: x11.ffi.GC, dash_offset: number, dash_list: string, n: number): number
---@field XSetClipMask fun(display: x11.ffi.Display, gc: x11.ffi.GC, mask: number): number
---@field XSetClipOrigin fun(display: x11.ffi.Display, gc: x11.ffi.GC, x: number, y: number): number
---@field XFillPolygon fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, points: ffi.cdata*, npoints: number, shape: number, mode: number): number
---@field XDrawSegments fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, segments: ffi.cdata*, nsegments: number): number
---@field XDrawPoints fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, points: ffi.cdata*, npoints: number, mode: number): number
---@field XDrawRectangles fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, rectangles: ffi.cdata*, nrectangles: number): number
---@field XFillRectangles fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, rectangles: ffi.cdata*, nrectangles: number): number
---@field XDrawArcs fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, arcs: ffi.cdata*, narcs: number): number
---@field XFillArcs fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, arcs: ffi.cdata*, narcs: number): number
---@field XLoadFont fun(display: x11.ffi.Display, name: string): number
---@field XLoadQueryFont fun(display: x11.ffi.Display, name: string): x11.ffi.FontStruct?
---@field XQueryFont fun(display: x11.ffi.Display, font_id: number): ffi.cdata*
---@field XFreeFont fun(display: x11.ffi.Display, font_struct: x11.ffi.FontStruct): number
---@field XSetFont fun(display: x11.ffi.Display, gc: x11.ffi.GC, font: number): number
---@field XUnloadFont fun(display: x11.ffi.Display, font: number)
---@field XTextWidth fun(font_struct: x11.ffi.FontStruct, string: string, count: number): number
---@field XTextWidth16 fun(font_struct: x11.ffi.FontStruct, string: ffi.cdata*, count: number): number
---@field XTextExtents fun(font_struct: x11.ffi.FontStruct, string: string, nchars: number, direction_return: ffi.cdata*, font_ascent_return: ffi.cdata*, font_descent_return: ffi.cdata*, overall_return: ffi.cdata*)
---@field XListFonts fun(display: x11.ffi.Display, pattern: string, maxnames: number, actual_count_return: ffi.cdata*): ffi.cdata*
---@field XFreeFontNames fun(list: ffi.cdata*): number
---@field XGetFontProperty fun(font_struct: x11.ffi.FontStruct, atom: number, value_return: ffi.cdata*): number
---@field XAllocNamedColor fun(display: x11.ffi.Display, colormap: number, color_name: string, screen_color_return: x11.ffi.Color, exact_color_return: x11.ffi.Color): number
---@field XParseColor fun(display: x11.ffi.Display, colormap: number, cname: string, color_def_return: x11.ffi.Color): number
---@field XAllocColor fun(display: x11.ffi.Display, colormap: number, color_def_in_out: x11.ffi.Color): number
---@field XFreeColors fun(display: x11.ffi.Display, colormap: number, pixels: ffi.cdata*, npixels: number, planes: number): number
---@field XLookupColor fun(display: x11.ffi.Display, colormap: number, color_name: string, exact_def_return: x11.ffi.Color, screen_def_return: x11.ffi.Color): number
---@field XCopyArea fun(display: x11.ffi.Display, src: number, dest: number, gc: x11.ffi.GC, src_x: number, src_y: number, width: number, height: number, dest_x: number, dest_y: number): number
---@field XCopyPlane fun(display: x11.ffi.Display, src: number, dest: number, gc: x11.ffi.GC, src_x: number, src_y: number, width: number, height: number, dest_x: number, dest_y: number, plane: number): number
---@field XSetWindowBackground fun(display: x11.ffi.Display, w: number, background: number)
---@field XCreateImage fun(display: x11.ffi.Display, visual: ffi.cdata*, depth: number, format: number, offset: number, data: ffi.cdata*, width: number, height: number, bitmap_pad: number, bytes_per_line: number): x11.ffi.Image?
---@field XPutImage fun(display: x11.ffi.Display, d: number, gc: x11.ffi.GC, image: x11.ffi.Image, src_x: number, src_y: number, dest_x: number, dest_y: number, width: number, height: number): number
---@field XGetImage fun(display: x11.ffi.Display, d: number, x: number, y: number, width: number, height: number, plane_mask: number, format: number): x11.ffi.Image?
---@field XDestroyImage fun(image: x11.ffi.Image): number
local C = ffi.load("libX11.so.6")

-- XSync extension (libXext.so.6)
---@class x11.FnsXSync
---@field XSyncInitialize fun(display: x11.ffi.Display, major: ffi.cdata*, minor: ffi.cdata*, error: ffi.cdata*): number
---@field XSyncCreateCounter fun(display: x11.ffi.Display, initial_value: x11.ffi.SyncValue): number
---@field XSyncDestroyCounter fun(display: x11.ffi.Display, counter: number)
---@field XSyncQueryCounter fun(display: x11.ffi.Display, counter: number, value: x11.ffi.SyncValue): number
---@field XSyncSetCounter fun(display: x11.ffi.Display, counter: number, value: x11.ffi.SyncValue)
---@field XSyncMaxValue fun(pv: x11.ffi.SyncValue)
---@field XSyncMinValue fun(pv: x11.ffi.SyncValue)
local XExt = ffi.load("libXext.so.6")

---@class x11: x11.Enums
---@field Atom fun(): x11.ffi.Atom
---@field AtomArray fun(count: number): x11.ffi.Atom[]
---@field WindowAttributes fun(): x11.ffi.WindowAttributes
---@field WindowAttributesArray fun(count: number): x11.ffi.WindowAttributes[]
---@field Event fun(): x11.ffi.Event
---@field Color fun(): x11.ffi.Color
---@field ColorArray fun(count: number): x11.ffi.Color[]
---@field SetWindowAttributes fun(): x11.ffi.SetWindowAttributes
---@field SetWindowAttributesArray fun(count: number): x11.ffi.SetWindowAttributes[]
---@field SyncValue fun(): x11.ffi.SyncValue
---@field SyncValueArray fun(count: number): x11.ffi.SyncValue[]
---@field GC fun(): x11.ffi.GC
---@field GCArray fun(count: number): x11.ffi.GC[]
---@field KeySym fun(): number[]
local x11 = {}

local enums = require("x11api.x11.ffi.enums")
for k, v in pairs(enums) do
	x11[k] = v
end

---@param ffiName string
local function defType(ffiName)
	local cons = ffi.typeof("X" .. ffiName)
		or error("Failed to find FFI type for Vk" .. ffiName)

	local arrayCons = ffi.typeof("X" .. ffiName .. "[?]")

	x11[ffiName] = cons
	x11[ffiName .. "Array"] = arrayCons
end

defType("Atom")
defType("WindowAttributes")
defType("Event")
defType("Color")
defType("SetWindowAttributes")
defType("SyncValue")
defType("GC")

x11.KeySym = ffi.typeof("XKeySym[1]")

x11.openDisplay = C.XOpenDisplay
x11.closeDisplay = C.XCloseDisplay
x11.destroyWindow = C.XDestroyWindow
x11.defaultRootWindow = C.XDefaultRootWindow
x11.createSimpleWindow = C.XCreateSimpleWindow
x11.createWindow = C.XCreateWindow
x11.mapWindow = C.XMapWindow
x11.internAtom = C.XInternAtom
x11.nextEvent = C.XNextEvent
x11.peekEvent = C.XPeekEvent
x11.defaultScreen = C.XDefaultScreen
x11.defaultColormap = C.XDefaultColormap
x11.pending = C.XPending
x11.selectInput = C.XSelectInput
x11.createFontCursor = C.XCreateFontCursor
x11.defineCursor = C.XDefineCursor
x11.undefineCursor = C.XUndefineCursor
x11.freeCursor = C.XFreeCursor
x11.flush = C.XFlush
x11.sendEvent = C.XSendEvent
x11.sync = C.XSync
x11.keycodeToKeysym = C.XKeycodeToKeysym
x11.warpPointer = C.XWarpPointer
x11.grabPointer = C.XGrabPointer
x11.ungrabPointer = C.XUngrabPointer
x11.grabKeyboard = C.XGrabKeyboard
x11.ungrabKeyboard = C.XUngrabKeyboard
x11.getEventData = C.XGetEventData
x11.freeEventData = C.XFreeEventData
x11.createPixmapCursor = C.XCreatePixmapCursor
x11.createPixmap = C.XCreatePixmap
x11.freePixmap = C.XFreePixmap
x11.setWindowBackgroundPixmap = C.XSetWindowBackgroundPixmap

-- GC (Graphics Context) painting functions
x11.createGC = C.XCreateGC
x11.setForeground = C.XSetForeground
x11.setBackground = C.XSetBackground
x11.setLineAttributes = C.XSetLineAttributes
x11.fillRectangle = C.XFillRectangle
x11.drawRectangle = C.XDrawRectangle
x11.drawLine = C.XDrawLine
x11.drawPoint = C.XDrawPoint
x11.drawString = C.XDrawString
x11.fillArc = C.XFillArc
x11.drawArc = C.XDrawArc
x11.clearWindow = C.XClearWindow
x11.clearArea = C.XClearArea
x11.freeGC = C.XFreeGC
x11.setFillStyle = C.XSetFillStyle
x11.setFillRule = C.XSetFillRule
x11.setArcMode = C.XSetArcMode
x11.setFunction = C.XSetFunction
x11.setTile = C.XSetTile
x11.setStipple = C.XSetStipple
x11.setTSOrigin = C.XSetTSOrigin
x11.setDashes = C.XSetDashes
x11.setClipMask = C.XSetClipMask
x11.setClipOrigin = C.XSetClipOrigin
x11.fillPolygon = C.XFillPolygon
x11.drawSegments = C.XDrawSegments
x11.drawPoints = C.XDrawPoints
x11.drawRectangles = C.XDrawRectangles
x11.fillRectangles = C.XFillRectangles
x11.drawArcs = C.XDrawArcs
x11.fillArcs = C.XFillArcs

--- Convenience wrapper: draws a string at (x, y) without requiring an explicit length.
---@param display x11.ffi.Display
---@param d number
---@param gc x11.ffi.GC
---@param x number
---@param y number
---@param text string
function x11.drawString(display, d, gc, x, y, text)
	return C.XDrawString(display, d, gc, x, y, text, #text)
end

-- Font functions
x11.loadFont = C.XLoadFont
x11.loadQueryFont = C.XLoadQueryFont
x11.queryFont = C.XQueryFont
x11.freeFont = C.XFreeFont
x11.setFont = C.XSetFont
x11.unloadFont = C.XUnloadFont
x11.textWidth = C.XTextWidth
x11.textWidth16 = C.XTextWidth16
x11.textExtents = C.XTextExtents
x11.listFonts = C.XListFonts
x11.freeFontNames = C.XFreeFontNames
x11.getFontProperty = C.XGetFontProperty

--- Convenience: load a font and return the font struct, or nil on failure.
---@param display x11.ffi.Display
---@param name string
---@return x11.ffi.FontStruct?
function x11.loadQueryFont(display, name)
	local fs = C.XLoadQueryFont(display, name)
	if fs == nil then return nil end
	return fs
end

--- Convenience: list fonts matching a pattern, returns a Lua table of font name strings.
---@param display x11.ffi.Display
---@param pattern string
---@param maxnames number
---@return string[]
function x11.listFonts(display, pattern, maxnames)
	local count = ffi.new("int[1]")
	local list = C.XListFonts(display, pattern, maxnames, count)
	if list == nil then return {} end
	local n = count[0]
	local result = {}
	for i = 0, n - 1 do
		result[i + 1] = ffi.string(list[i])
	end
	C.XFreeFontNames(list)
	return result
end

--- Convenience: measure text width without passing an explicit length.
---@param font_struct x11.ffi.FontStruct
---@param text string
---@return number
function x11.textWidth(font_struct, text)
	return C.XTextWidth(font_struct, text, #text)
end

--- Convenience: get text extents for a Lua string.
--- Returns a table with direction, ascent, descent, lbearing, rbearing, width, or nil on failure.
---@param font_struct x11.ffi.FontStruct
---@param text string
---@return { direction: number, ascent: number, descent: number, lbearing: number, rbearing: number, width: number }?
function x11.textExtents(font_struct, text)
	local direction = ffi.new("int[1]")
	local ascent = ffi.new("int[1]")
	local descent = ffi.new("int[1]")
	local overall = ffi.new("XCharStruct[1]")
	C.XTextExtents(font_struct, text, #text, direction, ascent, descent, overall)
	return {
		direction = direction[0],
		ascent = ascent[0],
		descent = descent[0],
		lbearing = overall[0].lbearing,
		rbearing = overall[0].rbearing,
		width = overall[0].width
	}
end

-- Color allocation
x11.allocNamedColor = C.XAllocNamedColor
x11.parseColor = C.XParseColor
x11.allocColor = C.XAllocColor
x11.freeColors = C.XFreeColors
x11.lookupColor = C.XLookupColor

--- Convenience: allocate a color by name (e.g. "red", "#FF8800").
--- Returns screen_color and exact_color on success, or nil on failure.
---@param display x11.ffi.Display
---@param colormap number
---@param color_name string
---@return { screen: x11.ffi.Color, exact: x11.ffi.Color }?
function x11.allocNamedColor(display, colormap, color_name)
	local screen = x11.Color()
	local exact = x11.Color()
	local status = C.XAllocNamedColor(display, colormap, color_name, screen, exact)
	if status == 0 then return nil end
	return { screen = screen, exact = exact }
end

--- Convenience: parse a color name/hex into a color struct (no allocation).
---@param display x11.ffi.Display
---@param colormap number
---@param cname string
---@return x11.ffi.Color?
function x11.parseColor(display, colormap, cname)
	local color = x11.Color()
	local status = C.XParseColor(display, colormap, cname, color)
	if status == 0 then return nil end
	return color
end

--- Convenience: allocate a color from a color struct. Returns updated color with pixel set, or nil.
---@param display x11.ffi.Display
---@param colormap number
---@param color x11.ffi.Color
---@return boolean
function x11.allocColor(display, colormap, color)
	return C.XAllocColor(display, colormap, color) ~= 0
end

--- Convenience: look up a color name without allocating.
---@param display x11.ffi.Display
---@param colormap number
---@param color_name string
---@return { exact: x11.ffi.Color, screen: x11.ffi.Color }?
function x11.lookupColor(display, colormap, color_name)
	local exact = x11.Color()
	local screen = x11.Color()
	local status = C.XLookupColor(display, colormap, color_name, exact, screen)
	if status == 0 then return nil end
	return { exact = exact, screen = screen }
end

-- Blitting and pixel operations
x11.copyArea = C.XCopyArea
x11.copyPlane = C.XCopyPlane
x11.setWindowBackground = C.XSetWindowBackground

-- Image I/O
x11.createImage = C.XCreateImage
x11.putImage = C.XPutImage
x11.getImage = C.XGetImage
x11.destroyImage = C.XDestroyImage

--- Convenience: create an image from raw pixel data, returns Image or nil.
---@param display x11.ffi.Display
---@param visual ffi.cdata*
---@param depth number
---@param format number
---@param data ffi.cdata*
---@param width number
---@param height number
---@param bitmap_pad number
---@return x11.ffi.Image?
function x11.createImage(display, visual, depth, format, data, width, height, bitmap_pad)
	local img = C.XCreateImage(display, visual, depth, format, 0, data, width, height, bitmap_pad, 0)
	if img == nil then return nil end
	return img
end

---@param display x11.ffi.Display
---@return number? major, number? minor, number? error_base
function x11.syncInitialize(display)
	local major = ffi.new("int[1]")
	local minor = ffi.new("int[1]")
	local error = ffi.new("int[1]")
	local status = XExt.XSyncInitialize(display, major, minor, error)
	if status == 0 then
		return nil
	end
	return major[0], minor[0], error[0]
end

---@param display x11.ffi.Display
---@param initial_value integer
---@return number
function x11.syncCreateCounter(display, initial_value)
	local val = x11.SyncValue()
	val.lo = initial_value
	val.hi = (initial_value < 0) and -1 or 0
	return XExt.XSyncCreateCounter(display, val)
end

---@param display x11.ffi.Display
---@param counter number
function x11.syncDestroyCounter(display, counter)
	XExt.XSyncDestroyCounter(display, counter)
end

---@param display x11.ffi.Display
---@param counter number
---@return x11.ffi.SyncValue?
function x11.syncQueryCounter(display, counter)
	local val = x11.SyncValue()
	local status = XExt.XSyncQueryCounter(display, counter, val)
	if status == 0 then
		return nil
	end
	return val
end

---@param display x11.ffi.Display
---@param counter number
---@param value x11.ffi.SyncValue
function x11.syncSetCounter(display, counter, value)
	XExt.XSyncSetCounter(display, counter, value)
end

---@param lo integer
---@param hi integer
---@return x11.ffi.SyncValue
function x11.syncIntsToValue(lo, hi)
	local val = x11.SyncValue()
	val.lo = lo
	val.hi = hi
	return val
end

---@return x11.ffi.SyncValue
function x11.syncMaxValue()
	local val = x11.SyncValue()
	XExt.XSyncMaxValue(val)
	return val
end

---@return x11.ffi.SyncValue
function x11.syncMinValue()
	local val = x11.SyncValue()
	XExt.XSyncMinValue(val)
	return val
end

---@param display x11.ffi.Display
---@param first_keycode number
---@param keycode_count number
---@return number[] keysyms, number keysyms_per_keycode
function x11.getKeyboardMapping(display, first_keycode, keycode_count)
	local keysyms_per_kc = ffi.new("int[1]")
	local syms = C.XGetKeyboardMapping(display, first_keycode, keycode_count, keysyms_per_kc)
	local n = keysyms_per_kc[0]
	local result = {}
	for i = 0, keycode_count * n - 1 do
		result[i + 1] = tonumber(syms[i])
	end
	C.XFree(syms)
	return result, n
end

x11.resizeWindow = C.XResizeWindow
x11.moveWindow = C.XMoveWindow
x11.unmapWindow = C.XUnmapWindow
x11.raiseWindow = C.XRaiseWindow
x11.storeName = C.XStoreName

---@param display x11.ffi.Display
---@param window number
---@return string?
function x11.fetchName(display, window)
	local ptr = ffi.new("char*[1]")
	local status = C.XFetchName(display, window, ptr)
	if status == 0 or ptr[0] == nil then return nil end
	local name = ffi.string(ptr[0])
	C.XFree(ptr[0])
	return name
end

---@param display x11.ffi.Display
---@return string
function x11.serverVendor(display)
	return ffi.string(C.XServerVendor(display))
end

---@param display x11.ffi.Display
---@param window number
---@return number win_x, number win_y, number root_x, number root_y
function x11.queryPointer(display, window)
	local root = ffi.new("XWindow[1]")
	local child = ffi.new("XWindow[1]")
	local root_x = ffi.new("int[1]")
	local root_y = ffi.new("int[1]")
	local win_x = ffi.new("int[1]")
	local win_y = ffi.new("int[1]")
	local mask = ffi.new("unsigned int[1]")
	C.XQueryPointer(display, window, root, child, root_x, root_y, win_x, win_y, mask)
	return win_x[0], win_y[0], root_x[0], root_y[0]
end

---@param event x11.ffi.Event
---@return string char, number keysym
function x11.lookupString(event)
	local buf = ffi.new("char[32]")
	local keysym = x11.KeySym()
	local keyEvent = ffi.cast("XKeyEvent*", event)
	local len = C.XLookupString(keyEvent, buf, 32, keysym, nil)
	return ffi.string(buf, len), keysym[0]
end

---@param display x11.ffi.Display
---@param window number # Window id
---@param protocols string[]
function x11.setWMProtocols(display, window, protocols)
	local atoms = x11.AtomArray(#protocols)
	for i = 1, #protocols do
		atoms[i - 1] = C.XInternAtom(display, protocols[i], 0)
	end

	C.XSetWMProtocols(display, window, atoms, #protocols)
end

---@param display x11.ffi.Display
---@param window number # Window id
function x11.getWindowAttributes(display, window)
	local attrs = x11.WindowAttributes()

	local status = C.XGetWindowAttributes(display, window, attrs)
	if status == 0 then
		return nil
	end

	return attrs
end

---@param display x11.ffi.Display
---@param window number
---@param property string
---@param ty string
---@param format number
---@param mode number
---@param data ffi.cdata*
---@param nelements number
function x11.changeProperty(display, window, property, ty, format, mode, data, nelements)
	local propAtom = C.XInternAtom(display, property, 0)
	local typeAtom = C.XInternAtom(display, ty, 0)

	C.XChangeProperty(display, window, propAtom, typeAtom, format, mode, data, nelements)
end

return x11
