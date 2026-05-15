---@class x11.Enums
local x11 = {}

---@enum x11.EventType
x11.EventType = {
	None = 0,
	ClientMessage = 33,
	Expose = 12,
	KeyPress = 2,
	KeyRelease = 3,
	ButtonPress = 4,
	ButtonRelease = 5,
	MotionNotify = 6,
	FocusIn = 9,
	FocusOut = 10,
	UnmapNotify = 18,
	MapNotify = 19,
	ConfigureNotify = 22,
	DestroyNotify = 17,
	CreateNotify = 16,
	GenericEvent = 35
}

---@enum x11.WindowClass
x11.WindowClass = {
	CopyFromParent = 0,
	InputOutput = 1,
	InputOnly = 2
}

x11.False = 0
x11.True = 1

---@enum x11.EventMaskBits
x11.EventMaskBits = {
	KeyPress = 0x00000001,
	KeyRelease = 0x00000002,
	ButtonPress = 0x00000004,
	ButtonRelease = 0x00000008,
	PointerMotion = 0x00000040,
	Exposure = 0x00008000,
	FocusChange = 0x00200000,
	StructureNotify = 0x00020000,
	SubstructureNotify = 0x00080000,
	SubstructureRedirect = 0x00100000
}

---@enum x11.ModifierMaskBits
x11.ModifierMaskBits = {
	Shift = 0x0001,
	Lock = 0x0002,
	Control = 0x0004,
	Mod1 = 0x0008, -- Alt
	Mod2 = 0x0010, -- NumLock
	Mod3 = 0x0020,
	Mod4 = 0x0040, -- Super/Win
	Mod5 = 0x0080
}

---@enum x11.GrabMode
x11.GrabMode = {
	Sync = 0,
	Async = 1
}

---@enum x11.GrabStatus
x11.GrabStatus = {
	Success = 0,
	AlreadyGrabbed = 1,
	InvalidTime = 2,
	NotViewable = 3,
	Frozen = 4
}

---@enum x11.GCBits
x11.GCBits = {
	Function = 0x00000001,
	PlaneMask = 0x00000002,
	Foreground = 0x00000004,
	Background = 0x00000008,
	LineWidth = 0x00000010,
	LineStyle = 0x00000020,
	CapStyle = 0x00000040,
	JoinStyle = 0x00000080,
	FillStyle = 0x00000100,
	FillRule = 0x00000200,
	Tile = 0x00000400,
	Stipple = 0x00000800,
	TileStipXOrigin = 0x00001000,
	TileStipYOrigin = 0x00002000,
	Font = 0x00004000,
	SubwindowMode = 0x00008000,
	GraphicsExposures = 0x00010000,
	ClipXOrigin = 0x00020000,
	ClipYOrigin = 0x00040000,
	ClipMask = 0x00080000,
	DashOffset = 0x00100000,
	DashList = 0x00200000,
	ArcMode = 0x00400000
}

---@enum x11.LineStyle
x11.LineStyle = {
	Solid = 0,
	OnOffDash = 1,
	DoubleDash = 2
}

---@enum x11.CapStyle
x11.CapStyle = {
	NotLast = 0,
	Butt = 1,
	Round = 2,
	Projecting = 3
}

---@enum x11.JoinStyle
x11.JoinStyle = {
	Miter = 0,
	Round = 1,
	Bevel = 2
}

---@enum x11.FillStyle
x11.FillStyle = {
	Solid = 0,
	Tiled = 1,
	Stippled = 2,
	OpaqueStippled = 3
}

---@enum x11.ArcMode
x11.ArcMode = {
	Chord = 0,
	PieSlice = 1
}

---@enum x11.GXFunction
x11.GXFunction = {
	Clear = 0x0,
	And = 0x1,
	AndReverse = 0x2,
	Copy = 0x3,
	AndInverted = 0x4,
	Noop = 0x5,
	Xor = 0x6,
	Or = 0x7,
	Nor = 0x8,
	Equiv = 0x9,
	Invert = 0xA,
	OrReverse = 0xB,
	CopyInverted = 0xC,
	OrInverted = 0xD,
	Nand = 0xE,
	Set = 0xF
}

---@enum x11.FillRule
x11.FillRule = {
	EvenOdd = 0,
	Winding = 1
}

---@enum x11.CoordMode
x11.CoordMode = {
	Origin = 0,
	Previous = 1
}

---@enum x11.PolygonShape
x11.PolygonShape = {
	Complex = 0,
	Nonconvex = 1,
	Convex = 2
}

---@enum x11.ImageFormat
x11.ImageFormat = {
	XYBitmap = 0,
	XYPixmap = 1,
	ZPixmap = 2
}

---@enum x11.Icon
x11.Icon = {
	Arrow = 2,
	BasedArrowDown = 4,
	BasedArrowUp = 6,
	Boat = 8,
	Bogosity = 10,
	BottomLeftCorner = 12,
	BottomRightCorner = 14,
	BottomSide = 16,
	BottomTee = 18,
	BoxSpiral = 20,
	CenterPtr = 22,
	Circle = 24,
	Clock = 26,
	CoffeeMug = 28,
	Cross = 30,
	CrossReverse = 32,
	Crosshair = 34,
	DiamondCross = 36,
	Dot = 38,
	Dotbox = 40,
	DoubleArrow = 42,
	DraftLarge = 44,
	DraftSmall = 46,
	DrapedBox = 48,
	Exchange = 50,
	Fleur = 52,
	Gobbler = 54,
	Gumby = 56,
	Hand1 = 58,
	Hand2 = 60,
	Heart = 62,
	Icon = 64,
	IronCross = 66,
	LeftPtr = 68,
	LeftSide = 70,
	LeftTee = 72,
	Leftbutton = 74,
	LlAngle = 76,
	LrAngle = 78,
	Man = 80,
	Middlebutton = 82,
	Mouse = 84,
	Pencil = 86,
	Pirate = 88,
	Plus = 90,
	QuestionArrow = 92,
	RightPtr = 94,
	RightSide = 96,
	RightTee = 98,
	Rightbutton = 100,
	RtlLogo = 102,
	Sailboat = 104,
	SbDownArrow = 106,
	SbHDoubleArrow = 108,
	SbLeftArrow = 110,
	SbRightArrow = 112,
	SbUpArrow = 114,
	SbVDoubleArrow = 116,
	Shuttle = 118,
	Sizing = 120,
	Spider = 122,
	Spraycan = 124,
	Star = 126,
	Target = 128,
	Tcross = 130,
	TopLeftArrow = 132,
	TopLeftCorner = 134,
	TopRightCorner = 136,
	TopSide = 138,
	TopTee = 140,
	Trek = 142,
	UlAngle = 144,
	Umbrella = 146,
	UrAngle = 148,
	Watch = 150,
	Xterm = 152
}

return x11
