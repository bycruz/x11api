typedef void *XDisplay;
typedef unsigned long XWindow;
typedef unsigned long XAtom;
typedef int XBool;
typedef int XStatus;
typedef void *XVisual;
typedef unsigned long XColormap;
typedef void *XScreen;
typedef unsigned long XTime;
typedef unsigned long XCursor;
typedef unsigned long XPixmap;
typedef unsigned long XSyncCounter;
typedef void *XGC;
typedef unsigned long XFont;

typedef struct {
    XPixmap background_pixmap;
    unsigned long background_pixel;
    XPixmap border_pixmap;
    unsigned long border_pixel;
    int bit_gravity;
    int win_gravity;
    int backing_store;
    unsigned long backing_planes;
    unsigned long backing_pixel;
    XBool save_under;
    long event_mask;
    long do_not_propagate_mask;
    XBool override_redirect;
    XColormap colormap;
    XCursor cursor;
} XSetWindowAttributes;

typedef struct {
    short x, y;
} XPoint;

typedef struct {
    short x, y;
    unsigned short width, height;
} XRectangle;

typedef struct {
    short x, y;
    unsigned short width, height;
    short angle1, angle2;
} XArc;

typedef struct {
    short x1, y1, x2, y2;
} XSegment;

typedef struct {
    int width, height;
    int xoffset;
    int format;
    char *data;
    int byte_order;
    int bitmap_unit;
    int bitmap_bit_order;
    int bitmap_pad;
    int depth;
    int bytes_per_line;
    int bits_per_pixel;
    unsigned long red_mask;
    unsigned long green_mask;
    unsigned long blue_mask;
} XImage;

typedef struct {
    short lbearing;
    short rbearing;
    short width;
    short ascent;
    short descent;
    unsigned short attributes;
} XCharStruct;

typedef struct {
    XAtom name;
    unsigned long card32;
} XFontProp;

typedef struct {
    void *ext_data;
    XFont fid;
    unsigned direction;
    unsigned min_char_or_byte2;
    unsigned max_char_or_byte2;
    unsigned min_byte1;
    unsigned max_byte1;
    int all_chars_exist;
    unsigned default_char;
    int n_properties;
    XFontProp *properties;
    XCharStruct min_bounds;
    XCharStruct max_bounds;
    XCharStruct *per_char;
    int ascent;
    int descent;
} XFontStruct;

typedef struct {
    long hi;
    unsigned long lo;
} XSyncValue;

typedef struct {
  unsigned long pixel;
  unsigned short red, green, blue;
  char flags;
  char pad;
} XColor;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
  XAtom message_type;
  int format;
  union {
    char b[20];
    short s[10];
    long l[5];
  } data;
} XClientMessageEvent;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
  int x, y;
  int width, height;
  int count;
} XExposeEvent;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow event;
  XWindow window;
  int x, y;
  int width, height;
  int border_width;
  XWindow above;
  XBool override_redirect;
} XConfigureEvent;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
  XWindow root;
  XWindow subwindow;
  XTime time;
  int x, y;
  int x_root, y_root;
  unsigned int state;
  char is_hint;
  XBool same_screen;
} XMotionEvent;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
  XWindow root;
  XWindow subwindow;
  XTime time;
  int x, y;
  int x_root, y_root;
  unsigned int state;
  unsigned int button;
  XBool same_screen;
} XButtonEvent;

typedef unsigned long XKeySym;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
  XWindow root;
  XWindow subwindow;
  XTime time;
  int x, y;
  int x_root, y_root;
  unsigned int state;
  unsigned int keycode;
  XBool same_screen;
} XKeyEvent;

typedef struct {
  int type;
  unsigned long serial;
  XBool send_event;
  XDisplay display;
  XWindow window;
} XAnyEvent;

typedef struct {
  int type;
  unsigned long serial;
  int send_event;
  XDisplay display;
  int extension;
  int evtype;
  unsigned int cookie;
  void *data;
} XGenericEventCookie;

typedef union {
  int type;
  XAnyEvent xany;
  XClientMessageEvent xclient;
  XExposeEvent xexpose;
  XConfigureEvent xconfigure;
  XKeyEvent xkey;
  XMotionEvent xmotion;
  XButtonEvent xbutton;
  XGenericEventCookie xcookie;
  long pad[24];
} XEvent;

typedef struct {
  int x, y;
  int width, height;
  int border_width;
  int depth;
  XVisual visual;
  XWindow root;
  int class;
  int bit_gravity;
  int win_gravity;
  int backing_store;
  unsigned long backing_planes;
  unsigned long backing_pixel;
  XBool save_under;
  XColormap colormap;
  XBool map_installed;
  int map_state;
  long all_event_masks;
  long your_event_mask;
  long do_not_propagate_mask;
  XBool override_redirect;
  XScreen screen;
} XWindowAttributes;

XDisplay XOpenDisplay(const char *display_name);
int XCloseDisplay(XDisplay display);
void XDestroyWindow(XDisplay display, unsigned long window);
XWindow XDefaultRootWindow(XDisplay display);
XWindow XCreateSimpleWindow(XDisplay display, XWindow parent, int x, int y,
                            unsigned int width, unsigned int height,
                            unsigned int border_width, unsigned long border,
                            unsigned long background);
XWindow XCreateWindow(XDisplay display, XWindow parent, int x, int y,
                      unsigned int width, unsigned int height,
                      unsigned int border_width, int depth,
                      unsigned int class, XVisual visual,
                      unsigned long valuemask,
                      XSetWindowAttributes *attributes);
void XMapWindow(XDisplay display, XWindow w);
XAtom XInternAtom(XDisplay display, const char *atom_name,
                  XBool only_if_exists);
XStatus XSetWMProtocols(XDisplay display, XWindow w, XAtom *protocols,
                        int count);
void XNextEvent(XDisplay display, XEvent *event_return);
void XPeekEvent(XDisplay display, XEvent *event_return);
int XDefaultScreen(XDisplay display);
XColormap XDefaultColormap(XDisplay display, int screen);
int XPending(XDisplay display);
void XSelectInput(XDisplay display, XWindow w, long event_mask);
XStatus XGetWindowAttributes(XDisplay display, XWindow w,
                             XWindowAttributes *window_attributes_return);
XCursor XCreateFontCursor(XDisplay display, unsigned int shape);
void XDefineCursor(XDisplay display, XWindow w, XCursor cursor);
void XUndefineCursor(XDisplay display, XWindow w);
void XFreeCursor(XDisplay display, XCursor cursor);
void XFlush(XDisplay display);
void XChangeProperty(XDisplay display, XWindow w, XAtom property, XAtom type,
                     int format, int mode, const unsigned char *data,
                     int nelements);

XStatus XSendEvent(XDisplay display, XWindow w, XBool propagate,
                   long event_mask, XEvent *event_send);

void XSync(XDisplay display, XBool discard);

XKeySym XKeycodeToKeysym(XDisplay display, unsigned int keycode, int index);
int XLookupString(XKeyEvent *event_struct, char *buffer_return, int bytes_buffer,
                  XKeySym *keysym_return, void *status_in_out);

int XWarpPointer(XDisplay display, XWindow src_w, XWindow dest_w,
                 int src_x, int src_y, unsigned int src_width,
                 unsigned int src_height, int dest_x, int dest_y);

XBool XQueryPointer(XDisplay display, XWindow w, XWindow *root_return,
                    XWindow *child_return, int *root_x_return, int *root_y_return,
                    int *win_x_return, int *win_y_return,
                    unsigned int *mask_return);

int XGrabPointer(XDisplay display, XWindow grab_window, XBool owner_events,
                 unsigned int event_mask, int pointer_mode, int keyboard_mode,
                 XWindow confine_to, XCursor cursor, XTime time);

int XUngrabPointer(XDisplay display, XTime time);

int XGrabKeyboard(XDisplay display, XWindow grab_window, XBool owner_events,
                  int pointer_mode, int keyboard_mode, XTime time);

XKeySym *XGetKeyboardMapping(XDisplay display, unsigned int first_keycode,
                             int keycode_count, int *keysyms_per_keycode_return);

int XUngrabKeyboard(XDisplay display, XTime time);

char *XServerVendor(XDisplay display);

int XResizeWindow(XDisplay display, XWindow w, unsigned int width, unsigned int height);
int XMoveWindow(XDisplay display, XWindow w, int x, int y);
void XUnmapWindow(XDisplay display, XWindow w);
int XRaiseWindow(XDisplay display, XWindow w);

int XStoreName(XDisplay display, XWindow w, const char *window_name);
XStatus XFetchName(XDisplay display, XWindow w, char **window_name_return);
int XFree(void *data);

int XGetEventData(XDisplay display, XGenericEventCookie *cookie);
void XFreeEventData(XDisplay display, XGenericEventCookie *cookie);

XCursor XCreatePixmapCursor(XDisplay display, XPixmap source, XPixmap mask,
                             XColor *foreground_color, XColor *background_color,
                             unsigned int x, unsigned int y);

XPixmap XCreatePixmap(XDisplay display, XWindow d, unsigned int width,
                      unsigned int height, unsigned int depth);
void XFreePixmap(XDisplay display, XPixmap pixmap);
void XSetWindowBackgroundPixmap(XDisplay display, XWindow w, XPixmap background_pixmap);

/* GC (Graphics Context) painting functions */
XGC XCreateGC(XDisplay display, XWindow d, unsigned long valuemask, void *values);
int XSetForeground(XDisplay display, XGC gc, unsigned long foreground);
int XSetBackground(XDisplay display, XGC gc, unsigned long background);
int XSetLineAttributes(XDisplay display, XGC gc, unsigned int line_width,
                       int line_style, int cap_style, int join_style);
int XFillRectangle(XDisplay display, XWindow d, XGC gc,
                   int x, int y, unsigned int width, unsigned int height);
int XDrawRectangle(XDisplay display, XWindow d, XGC gc,
                   int x, int y, unsigned int width, unsigned int height);
int XDrawLine(XDisplay display, XWindow d, XGC gc,
              int x1, int y1, int x2, int y2);
int XDrawPoint(XDisplay display, XWindow d, XGC gc, int x, int y);
int XDrawString(XDisplay display, XWindow d, XGC gc,
                int x, int y, const char *string, int length);
int XFillArc(XDisplay display, XWindow d, XGC gc,
             int x, int y, unsigned int width, unsigned int height,
             int angle1, int angle2);
int XDrawArc(XDisplay display, XWindow d, XGC gc,
             int x, int y, unsigned int width, unsigned int height,
             int angle1, int angle2);
int XClearWindow(XDisplay display, XWindow w);
int XClearArea(XDisplay display, XWindow w, int x, int y,
               unsigned int width, unsigned int height, XBool exposures);
int XFreeGC(XDisplay display, XGC gc);

/* Font functions */
XFont XLoadFont(XDisplay display, const char *name);
XFontStruct *XLoadQueryFont(XDisplay display, const char *name);
XFontStruct *XQueryFont(XDisplay display, XFont font_id);
int XFreeFont(XDisplay display, XFontStruct *font_struct);
int XSetFont(XDisplay display, XGC gc, XFont font);
void XUnloadFont(XDisplay display, XFont font);
int XTextWidth(XFontStruct *font_struct, const char *string, int count);
int XTextWidth16(XFontStruct *font_struct, const unsigned short *string, int count);
void XTextExtents(XFontStruct *font_struct, const char *string, int nchars,
                  int *direction_return, int *font_ascent_return,
                  int *font_descent_return, XCharStruct *overall_return);
char **XListFonts(XDisplay display, const char *pattern, int maxnames,
                   int *actual_count_return);
int XFreeFontNames(char **list);
int XGetFontProperty(XFontStruct *font_struct, XAtom atom,
                     unsigned long *value_return);

/* Additional GC control */
int XSetFillStyle(XDisplay display, XGC gc, int fill_style);
int XSetFillRule(XDisplay display, XGC gc, int fill_rule);
int XSetArcMode(XDisplay display, XGC gc, int arc_mode);
int XSetFunction(XDisplay display, XGC gc, int function);
int XSetTile(XDisplay display, XGC gc, XPixmap tile);
int XSetStipple(XDisplay display, XGC gc, XPixmap stipple);
int XSetTSOrigin(XDisplay display, XGC gc, int x, int y);
int XSetDashes(XDisplay display, XGC gc, int dash_offset,
               const char *dash_list, int n);
int XSetClipMask(XDisplay display, XGC gc, XPixmap mask);
int XSetClipOrigin(XDisplay display, XGC gc, int x, int y);

/* More drawing primitives */
int XFillPolygon(XDisplay display, XWindow d, XGC gc, XPoint *points,
                 int npoints, int shape, int mode);
int XDrawSegments(XDisplay display, XWindow d, XGC gc,
                  XSegment *segments, int nsegments);
int XDrawPoints(XDisplay display, XWindow d, XGC gc,
                XPoint *points, int npoints, int mode);
int XDrawRectangles(XDisplay display, XWindow d, XGC gc,
                    XRectangle *rectangles, int nrectangles);
int XFillRectangles(XDisplay display, XWindow d, XGC gc,
                    XRectangle *rectangles, int nrectangles);
int XDrawArcs(XDisplay display, XWindow d, XGC gc,
              XArc *arcs, int narcs);
int XFillArcs(XDisplay display, XWindow d, XGC gc,
              XArc *arcs, int narcs);

/* Color allocation */
XStatus XAllocNamedColor(XDisplay display, XColormap colormap,
                         const char *color_name, XColor *screen_color_return,
                         XColor *exact_color_return);
XStatus XParseColor(XDisplay display, XColormap colormap,
                    const char *cname, XColor *color_def_return);
XStatus XAllocColor(XDisplay display, XColormap colormap,
                    XColor *color_def_in_out);
int XFreeColors(XDisplay display, XColormap colormap,
                unsigned long *pixels, int npixels, unsigned long planes);
XStatus XLookupColor(XDisplay display, XColormap colormap,
                     const char *color_name, XColor *exact_def_return,
                     XColor *screen_def_return);

/* Blitting and pixel operations */
int XCopyArea(XDisplay display, XWindow src, XWindow dest, XGC gc,
              int src_x, int src_y, unsigned int width, unsigned int height,
              int dest_x, int dest_y);
int XCopyPlane(XDisplay display, XWindow src, XWindow dest, XGC gc,
               int src_x, int src_y, unsigned int width, unsigned int height,
               int dest_x, int dest_y, unsigned long plane);
void XSetWindowBackground(XDisplay display, XWindow w, unsigned long background);

/* Image I/O */
XImage *XCreateImage(XDisplay display, XVisual visual, unsigned int depth,
                     int format, int offset, char *data,
                     unsigned int width, unsigned int height,
                     int bitmap_pad, int bytes_per_line);
int XPutImage(XDisplay display, XWindow d, XGC gc, XImage *image,
              int src_x, int src_y, int dest_x, int dest_y,
              unsigned int width, unsigned int height);
XImage *XGetImage(XDisplay display, XWindow d,
                  int x, int y, unsigned int width, unsigned int height,
                  unsigned long plane_mask, int format);
int XDestroyImage(XImage *image);

/* XSync extension (libXext.so.6) */
int XSyncInitialize(XDisplay display, int *major_version_return,
                    int *minor_version_return, int *error_base_return);
XSyncCounter XSyncCreateCounter(XDisplay display, XSyncValue initial_value);
void XSyncDestroyCounter(XDisplay display, XSyncCounter counter);
int XSyncQueryCounter(XDisplay display, XSyncCounter counter, XSyncValue *value);
void XSyncSetCounter(XDisplay display, XSyncCounter counter, XSyncValue value);
void XSyncMaxValue(XSyncValue *pv);
void XSyncMinValue(XSyncValue *pv);
