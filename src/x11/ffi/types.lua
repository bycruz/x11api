---@class x11.ffi.Display: ffi.cdata*
---@alias x11.ffi.Atom number

---@class x11.ffi.WindowAttributes: ffi.cdata*
---@field x number
---@field y number
---@field width number
---@field height number

---@class x11.ffi.Event: ffi.cdata*
---@field type number
---@field xclient { data: { l: number[] }, display: ffi.cdata*, window: number }
---@field xexpose { window: number }
---@field xany { window: number }
---@field xconfigure { window: number, x: number, y: number, width: number, height: number }
---@field xmotion { window: number, x: number, y: number }
---@field xbutton { x: number, y: number, button: number, state: number }
---@field xkey { window: number, root: number, time: number, x: number, y: number, x_root: number, y_root: number, state: number, keycode: number, same_screen: number }
---@field xcookie x11.ffi.GenericEventCookie

---@class x11.ffi.Color: ffi.cdata*
---@field pixel number
---@field red number
---@field green number
---@field blue number
---@field flags number
---@field pad number

---@class x11.ffi.GenericEventCookie: ffi.cdata*
---@field type number
---@field extension number
---@field evtype number
---@field cookie number
---@field data ffi.cdata*

---@class x11.ffi.GC: ffi.cdata*

---@alias x11.ffi.Colormap number

---@class x11.ffi.Point: ffi.cdata*
---@field x number
---@field y number

---@class x11.ffi.Rectangle: ffi.cdata*
---@field x number
---@field y number
---@field width number
---@field height number

---@class x11.ffi.Arc: ffi.cdata*
---@field x number
---@field y number
---@field width number
---@field height number
---@field angle1 number
---@field angle2 number

---@class x11.ffi.Segment: ffi.cdata*
---@field x1 number
---@field y1 number
---@field x2 number
---@field y2 number

---@class x11.ffi.Image: ffi.cdata*
---@field width number
---@field height number
---@field xoffset number
---@field format number
---@field data ffi.cdata*
---@field byte_order number
---@field bitmap_unit number
---@field bitmap_bit_order number
---@field bitmap_pad number
---@field depth number
---@field bytes_per_line number
---@field bits_per_pixel number
---@field red_mask number
---@field green_mask number
---@field blue_mask number

---@alias x11.ffi.Font number

---@class x11.ffi.FontStruct: ffi.cdata*
---@field fid number
---@field direction number
---@field min_char_or_byte2 number
---@field max_char_or_byte2 number
---@field min_byte1 number
---@field max_byte1 number
---@field all_chars_exist number
---@field default_char number
---@field n_properties number
---@field ascent number
---@field descent number
---@field min_bounds { lbearing: number, rbearing: number, width: number, ascent: number, descent: number }
---@field max_bounds { lbearing: number, rbearing: number, width: number, ascent: number, descent: number }

---@class x11.ffi.CharStruct: ffi.cdata*
---@field lbearing number
---@field rbearing number
---@field width number
---@field ascent number
---@field descent number
---@field attributes number

---@class x11.ffi.SyncValue: ffi.cdata*
---@field hi integer
---@field lo integer
