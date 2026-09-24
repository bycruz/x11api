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
---@field xselectionrequest { owner: number, requestor: number, selection: number, target: number, property: number, time: number }
---@field xselection { requestor: number, selection: number, target: number, property: number, time: number }
---@field xselectionclear { owner: number, selection: number, time: number }

---@class x11.ffi.SelectionRequestEvent: ffi.cdata*
---@field type number
---@field serial number
---@field send_event number
---@field display x11.ffi.Display
---@field owner number
---@field requestor number
---@field selection number
---@field target number
---@field property number
---@field time number

---@class x11.ffi.SelectionEvent: ffi.cdata*
---@field type number
---@field serial number
---@field send_event number
---@field display x11.ffi.Display
---@field requestor number
---@field selection number
---@field target number
---@field property number
---@field time number

---@class x11.ffi.SelectionClearEvent: ffi.cdata*
---@field type number
---@field serial number
---@field send_event number
---@field display x11.ffi.Display
---@field owner number
---@field selection number
---@field time number

---@class x11.ffi.Color: ffi.cdata*
---@field pixel number
---@field red number
---@field green number
---@field blue number
---@field flags number
---@field pad number

---@class x11.ffi.SetWindowAttributes: ffi.cdata*
---@field background_pixmap number
---@field background_pixel number
---@field border_pixmap number
---@field border_pixel number
---@field bit_gravity number
---@field win_gravity number
---@field backing_store number
---@field backing_planes number
---@field backing_pixel number
---@field save_under number
---@field event_mask number
---@field do_not_propagate_mask number
---@field override_redirect number
---@field colormap number
---@field cursor number

---@class x11.ffi.GenericEventCookie: ffi.cdata*
---@field type number
---@field extension number
---@field evtype number
---@field cookie number
---@field data ffi.cdata*

--- A C array of atoms, which is also what a 32-bit property holds: Xlib unpacks such
--- a property into longs and passes it back as bytes a caller reads through one.
---@class x11.ffi.AtomArray: ffi.cdata*
---@field [integer] number

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
