---@meta mimgui
---@diagnostic disable: missing-return

---@name Defenitions for the mimgui library (moonloader)
local imgui = {}

---@class ImGuiTexture
---@class ImDrawList
local ImDrawList = {}
---@class ImBuffer

---@class ImVec2
---@field x number
---@field y number
---@operator add(ImVec2): ImVec2
---@operator sub(ImVec2): ImVec2
---@operator mul(number): ImVec2

---@class ImVec4
---@field x number
---@field y number
---@field z number
---@field w number

---@class ImBool
local ImBool = {
	---@type boolean
	[0] = true,
}

---@class ImInt
local ImInt = {
	---@type number
	[0] = 1,
}

---@alias ImFloat table<number, number>

---@enum imgui.MouseButton
imgui.MouseButton = {
	Left = 0,
	Right = 1,
	Middle = 2,
	COUNT = 5,
}
---@enum imgui.WindowFlags
imgui.WindowFlags = {
	NoTitleBar = 1,
	NoResize = 2,
	NoMove = 4,
	NoScrollbar = 8,
	NoScrollWithMouse = 16,
	NoCollapse = 32,
	AlwaysAutoResize = 64,
	ShowBorders = 128,
	NoSavedSettings = 256,
	NoInputs = 512,
	MenuBar = 1024,
	HorizontalScrollbar = 2048,
	NoFocusOnAppearing = 4096,
	NoBringToFrontOnFocus = 8192,
	AlwaysVerticalScrollbar = 16384,
	AlwaysHorizontalScrollbar = 32768,
	AlwaysUseWindowPadding = 65536,
}

--- @enum imgui.InputTextFlags
imgui.InputTextFlags = {
	CharsDecimal = 1,
	CharsHexadecimal = 2,
	CharsUppercase = 4,
	CharsNoBlank = 8,
	AutoSelectAll = 16,
	EnterReturnsTrue = 32,
	CallbackCompletion = 64,
	CallbackHistory = 128,
	CallbackAlways = 256,
	CallbackCharFilter = 512,
	AllowTabInput = 1024,
	CtrlEnterForNewLine = 2048,
	NoHorizontalScroll = 4096,
	AlwaysInsertMode = 8192,
	ReadOnly = 16384,
	Password = 32768,
}

--- @enum imgui.TreeNodeFlags
imgui.TreeNodeFlags = {
	Selected = 1,
	Framed = 2,
	AllowOverlapMode = 4,
	NoTreePushOnOpen = 8,
	NoAutoOpenOnLog = 16,
	DefaultOpen = 32,
	OpenOnDoubleClick = 64,
	OpenOnArrow = 128,
	Leaf = 256,
	Bullet = 512,
	FramePadding = 1024,
	CollapsingHeader = 18,
}

--- @enum imgui.SelectableFlags
imgui.SelectableFlags = {
	DontClosePopups = 1,
	SpanAllColumns = 2,
	AllowDoubleClick = 4,
}

--- @enum imgui.HoveredFlags
imgui.HoveredFlags = {
	Default = 0,
	AllowWhenBlockedByPopup = 1,
	AllowWhenBlockedByActiveItem = 4,
	AllowWhenOverlapped = 8,
	RectOnly = 13,
}

---@enum imgui.Dir
imgui.Dir = {
	None = -1,
	Left = 0,
	Right = 1,
	Up = 2,
	Down = 3,
	COUNT = 4,
}

--- @enum imgui.Key
imgui.Key = {
	Tab = 0 + 1,
	LeftArrow = 1 + 1,
	RightArrow = 2 + 1,
	UpArrow = 3 + 1,
	DownArrow = 4 + 1,
	PageUp = 5 + 1,
	PageDown = 6 + 1,
	Home = 7 + 1,
	End = 8 + 1,
	Delete = 9 + 1,
	Backspace = 10 + 1,
	Enter = 11 + 1,
	Escape = 12 + 1,
	A = 13 + 1,
	C = 14 + 1,
	V = 15 + 1,
	X = 16 + 1,
	Y = 17 + 1,
	Z = 18 + 1,
}

--- @enum imgui.Col
imgui.Col = {
	Text = 0 + 1,
	TextDisabled = 1 + 1,
	WindowBg = 2 + 1,
	ChildWindowBg = 3 + 1,
	PopupBg = 4 + 1,
	Border = 5 + 1,
	BorderShadow = 6 + 1,
	FrameBg = 7 + 1,
	FrameBgHovered = 8 + 1,
	FrameBgActive = 9 + 1,
	TitleBg = 10 + 1,
	TitleBgActive = 11 + 1,
	TitleBgCollapsed = 12 + 1,
	MenuBarBg = 13 + 1,
	ScrollbarBg = 14 + 1,
	ScrollbarGrab = 15 + 1,
	ScrollbarGrabHovered = 16 + 1,
	ScrollbarGrabActive = 17 + 1,
	ComboBg = 18 + 1,
	CheckMark = 19 + 1,
	SliderGrab = 20 + 1,
	SliderGrabActive = 21 + 1,
	Button = 22 + 1,
	ButtonHovered = 23 + 1,
	ButtonActive = 24 + 1,
	Header = 25 + 1,
	HeaderHovered = 26 + 1,
	HeaderActive = 27 + 1,
	Separator = 28 + 1,
	SeparatorHovered = 29 + 1,
	SeparatorActive = 30 + 1,
	ResizeGrip = 31 + 1,
	ResizeGripHovered = 32 + 1,
	ResizeGripActive = 33 + 1,
	CloseButton = 34 + 1,
	CloseButtonHovered = 35 + 1,
	CloseButtonActive = 36 + 1,
	PlotLines = 37 + 1,
	PlotLinesHovered = 38 + 1,
	PlotHistogram = 39 + 1,
	PlotHistogramHovered = 40 + 1,
	TextSelectedBg = 41 + 1,
	ModalWindowDarkening = 42 + 1,
}

--- @enum imgui.StyleVar
imgui.StyleVar = {
	Alpha = 0,
	WindowPadding = 1,
	WindowRounding = 2,
	WindowBorderSize = 3,
	WindowMinSize = 4,
	WindowTitleAlign = 5,
	ChildRounding = 6,
	ChildBorderSize = 7,
	PopupRounding = 8,
	PopupBorderSize = 9,
	FramePadding = 10,
	FrameRounding = 11,
	FrameBorderSize = 12,
	ItemSpacing = 13,
	ItemInnerSpacing = 14,
	IndentSpacing = 15,
	ScrollbarSize = 16,
	ScrollbarRounding = 17,
	GrabMinSize = 18,
	GrabRounding = 19,
	TabRounding = 20,
	ButtonTextAlign = 21,
	SelectableTextAlign = 22,
	COUNT = 23,
}

--- @enum imgui.ColorEditFlags
imgui.ColorEditFlags = {
	NoAlpha = 2,
	NoPicker = 4,
	NoOptions = 8,
	NoSmallPreview = 16,
	NoInputs = 32,
	NoTooltip = 64,
	NoLabel = 128,
	NoSidePreview = 256,
	AlphaBar = 512,
	AlphaPreview = 1024,
	AlphaPreviewHalf = 2048,
	HDR = 4096,
	RGB = 8192,
	HSV = 16384,
	HEX = 32768,
	Uint8 = 65536,
	Float = 131072,
	PickerHueBar = 262144,
	PickerHueWheel = 524288,
	_InputsMask = 57344,
	_DataTypeMask = 196608,
	_PickerMask = 786432,
	_OptionsDefault = 335872,
}

--- @enum imgui.MouseCursor
imgui.MouseCursor = {
	None = -1,
	Arrow = 0,
	TextInput = 1,
	Move = 2,
	ResizeNS = 3,
	ResizeEW = 4,
	ResizeNESW = 5,
	ResizeNWSE = 6,
}

--- @enum imgui.Cond
imgui.Cond = {
	Always = 1,
	Once = 2,
	FirstUseEver = 4,
	Appearing = 8,
}

---@param x number
---@param y number
---@return ImVec2
---@overload fun(other: ImVec2): ImVec2
---@overload fun(): ImVec2
function imgui.ImVec2(x, y) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return ImVec4
---@overload fun(other: ImVec4): ImVec4
function imgui.ImVec4(x, y, z, w) end

---@class imgui.Style
---@field Alpha number;                      // Global alpha applies to everything in Dear ImGui.
---@field DisabledAlpha number;              // Additional alpha multiplier applied by BeginDisabled(). Multiply over current value of Alpha.
---@field WindowPadding ImVec2;              // Padding within a window.
---@field WindowRounding number;             // Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.
---@field WindowBorderSize number;           // Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field WindowMinSize ImVec2;              // Minimum window size. This is a global setting. If you want to constrain individual windows, use SetNextWindowSizeConstraints().
---@field WindowTitleAlign ImVec2;           // Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
---@field WindowMenuButtonPosition imgui.Dir;   // Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.
---@field ChildRounding number;              // Radius of child window corners rounding. Set to 0.0f to have rectangular windows.
---@field ChildBorderSize number;            // Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field PopupRounding number;              // Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)
---@field PopupBorderSize number;            // Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field FramePadding ImVec2;               // Padding within a framed rectangle (used by most widgets).
---@field FrameRounding number;              // Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
---@field FrameBorderSize number;            // Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field ItemSpacing ImVec2;                // Horizontal and vertical spacing between widgets/lines.
---@field ItemInnerSpacing ImVec2;           // Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).
---@field CellPadding ImVec2;                // Padding within a table cell
---@field TouchExtraPadding ImVec2;          // Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
---@field IndentSpacing number;              // Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
---@field ColumnsMinSpacing number;          // Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
---@field ScrollbarSize number;              // Width of the vertical scrollbar, Height of the horizontal scrollbar.
---@field ScrollbarRounding number;          // Radius of grab corners for scrollbar.
---@field GrabMinSize number;                // Minimum width/height of a grab box for slider/scrollbar.
---@field GrabRounding number;               // Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
---@field LogSliderDeadzone number;          // The size in pixels of the dead-zone around zero on logarithmic sliders that cross zero.
---@field TabRounding number;                // Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
---@field TabBorderSize number;              // Thickness of border around tabs.
---@field TabMinWidthForCloseButton number;  // Minimum width for close button to appear on an unselected tab when hovered. Set to 0.0f to always show when hovering, set to FLT_MAX to never show close button unless selected.
---@field ColorButtonPosition imgui.Dir;        // Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
---@field ButtonTextAlign ImVec2;            // Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).
---@field SelectableTextAlign ImVec2;        // Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.
---@field SeparatorTextBorderSize number;    // Thickkness of border in SeparatorText()
---@field SeparatorTextAlign ImVec2;         // Alignment of text within the separator. Defaults to (0.0f, 0.5f) (left aligned, center).
---@field SeparatorTextPadding ImVec2;       // Horizontal offset of text from each edge of the separator + spacing on other axis. Generally small values. .y is recommended to be == FramePadding.y.
---@field DisplayWindowPadding ImVec2;       // Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
---@field DisplaySafeAreaPadding ImVec2;     // If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!
---@field MouseCursorScale number;           // Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). May be removed later.
---@field AntiAliasedLines boolean;           // Enable anti-aliased lines/borders. Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
---@field AntiAliasedLinesUseTex boolean;     // Enable anti-aliased lines/borders using textures where possible. Require backend to render with bilinear filtering (NOT point/nearest filtering). Latched at the beginning of the frame (copied to ImDrawList).
---@field AntiAliasedFill boolean;            // Enable anti-aliased edges around filled shapes (rounded rectangles, circles, etc.). Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
---@field CurveTessellationTol number;       // Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
---@field CircleTessellationMaxError number; // Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.
---@field Colors imgui.Col;

---@param value boolean
---@return ImBool
function imgui.new.bool(value) end

---@param value number
---@return ImInt
function imgui.new.int(value) end

---Usage: `local f = imgui.new.float[size]\(values\)`
---@param ... number
---@return ImFloat
function imgui.new.float(...) end

---Example: `local myBuffer = imgui.new.char[128]\("text"\)`
---@param value string
---@return ImBuffer
function imgui.new.char(value) end

--- @param callback function
function imgui.OnInitialize(callback) end

---@class FrameParam
local FrameParam = { LockPlayer = false, HideCursor = false }

---@param cond fun(): boolean
---@param cbBeforeFrame function
---@param cbDraw fun(frame: FrameParam)
---@overload fun(cond: fun(): boolean, cbDraw: fun(frame: FrameParam))
function imgui.OnFrame(cond, cbBeforeFrame, cbDraw) end

--- @return ImDrawList
function imgui.GetWindowDrawList() end

--- @return ImDrawList
function imgui.GetBackgroundDrawList() end

--- @return ImDrawList
function imgui.GetForegroundDrawList() end

--- @param a ImVec2 Start point
--- @param b ImVec2 End point
--- @param col number Color (U32)
--- @param thickness number? Thickness. default = 1
function ImDrawList.AddLine(self, a, b, col, thickness) end

--- @param a ImVec2 Start point
--- @param b ImVec2 End point
--- @param col number Color (U32)
--- @param rounding number? Corner rounding (pixels). default = 0
--- @param rounding_corners_flags number? default = 0
--- @param thickness number? Box border thickness default = 1
function ImDrawList.AddRect(self, a, b, col, rounding, rounding_corners_flags, thickness) end

--- @param a ImVec2 Start point
--- @param b ImVec2 End point
--- @param col number Color (U32)
--- @param rounding number|nil Corner rounding (pixels)
--- @param rounding_corners_flags number|nil
function ImDrawList.AddRectFilled(self, a, b, col, rounding, rounding_corners_flags) end

--- @param a ImVec2 Start point
--- @param b ImVec2 End point
--- @param col_upr_left number Left upper color
--- @param col_upr_right number Right upper color
--- @param col_bot_right number Right bottom color
--- @param col_bot_left number Left bottom color
function ImDrawList.AddRectFilledMultiColor(self, a, b, col_upr_left, col_upr_right, col_bot_right, col_bot_left) end

function ImDrawList.AddQuad(self, a, b, c, d, col, thickness) end
function ImDrawList.AddQuadFilled(self, a, b, c, d, col) end

--- @param a ImVec2 First point
--- @param b ImVec2 Second point
--- @param c ImVec2 Third point
--- @param col number Triange color
--- @param thickness number Border thickness
function ImDrawList.AddTriangle(self, a, b, c, col, thickness) end

--- @param a ImVec2 First point
--- @param b ImVec2 Second point
--- @param c ImVec2 Third point
--- @param col number Triange color
function ImDrawList.AddTriangleFilled(self, a, b, c, col) end

--- @param centre ImVec2 Circle center
--- @param radius number Circle radius
--- @param num_segments number Count of "corners"
--- @param thickness number Border thickness
function ImDrawList.AddCircle(self, centre, radius, col, num_segments, thickness) end

--- @param centre ImVec2 Circle center
--- @param radius number Circle radius
--- @param col number Color in ARGB
--- @param num_segments number? Count of "corners". default = 0
function ImDrawList.AddCircleFilled(self, centre, radius, col, num_segments) end

--- @param pos ImVec2 Position
--- @param col number Text color
function ImDrawList.AddText(self, pos, col, text_begin, text_end) end
function ImDrawList.AddImage(self, user_texture_id, a, b, uv_a, uv_b, col) end
function ImDrawList.AddImageQuad(self, user_texture_id, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col) end
function ImDrawList.AddPolyline(self, points, num_points, col, closed, thickness, anti_aliased) end
function ImDrawList.AddConvexPolyFilled(self, points, num_points, col, anti_aliased) end
function ImDrawList.AddBezierCurve(self, pos0, cp0, cp1, pos1, col, thickness, num_segments) end

---@param clip_rect_min ImVec2
---@param clip_rect_max ImVec2
---@param intersect_with_current_clip_rect boolean?
function ImDrawList.PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect) end
function ImDrawList.PopClipRect(self) end

function imgui.CreateContext(ImFontAtlasshared_font_atlas) end
function imgui.DestroyContext(ImGuiContextctx) end
function imgui.GetCurrentContext() end
function imgui.SetCurrentContext(ImGuiContextctx) end
function imgui.DebugCheckVersionAndDataLayout(
	version_str,
	sz_io,
	sz_style,
	sz_vec2,
	sz_vec4,
	sz_drawvert,
	sz_drawidx
)
end

function imgui.GetIO() end

---@param path string File path
---@return ImGuiTexture
function imgui.CreateTextureFromFile(path) end

---@return ImGuiTexture
function imgui.CreateTextureFromFileInMemory(src, size) end

---@param texture  ImGuiTexture
function imgui.ReleaseTexture(texture) end

function imgui.StrCopy(dst, src, len) end

---@return imgui.Style
function imgui.GetStyle() end
function imgui.NewFrame() end
function imgui.EndFrame() end
function imgui.Render() end
function imgui.GetDrawData() end

---@param open ImBool
function imgui.ShowDemoWindow(open) end

---@param open ImBool
function imgui.ShowAboutWindow(open) end

---@param open ImBool
function imgui.ShowMetricsWindow(open) end
function imgui.ShowStyleEditor(ImGuiStyleref) end
function imgui.ShowStyleSelector(label) end
function imgui.ShowFontSelector(label) end
function imgui.ShowUserGuide() end
function imgui.GetVersion() end
function imgui.StyleColorsDark(ImGuiStyledst) end
function imgui.StyleColorsClassic(ImGuiStyledst) end
function imgui.ht(ImGuiStyledst) end

---Begin new window
---@param title string Window title
---@param open ImBool Window state (imgui.new.bool)
---@param WindowFlags imgui.WindowFlags | nil Window flags
function imgui.Begin(title, open, WindowFlags) end

---End window
function imgui.End() end

---Begin new child window. Use `imgui.EndChild()` to end child
---@param str_id string String ID
---@param size ImVec2 | nil Size
---@param showBorder boolean | nil Show child border
---@param flags number | nil
---@return boolean
function imgui.BeginChild(str_id, size, showBorder, flags) end
function imgui.BeginChildID(ImGuiIDid, size, _Boolborder, ImGuiWindowFlagsflags) end

---End child
function imgui.EndChild() end

---@return boolean Is window appearing
function imgui.IsWindowAppearing() end

---@return boolean Is window collapsed
function imgui.IsWindowCollapsed() end

---@return boolean Is window focused
function imgui.IsWindowFocused(focusFlags) end

---@param hoverFlags imgui.HoveredFlags | nil
---@return boolean Is window hovered
function imgui.IsWindowHovered(hoverFlags) end

---@return ImVec2 position Window screen position
function imgui.GetWindowPos() end

---@return ImVec2 size Window size
function imgui.GetWindowSize() end

---@return number width Window width
function imgui.GetWindowWidth() end

---Set next window position (use befor `imgui.Begin`)
---@param pos ImVec2 Position
---@param cond imgui.Cond|nil When?
---@param pivot ImVec2|nil Calc pos (from 0, 0 to 1, 1)
function imgui.SetNextWindowPos(pos, cond, pivot) end

---Set next window size (use befor `imgui.Begin`)
---@param size ImVec2 Size
---@param cond imgui.Cond | nil When?
function imgui.SetNextWindowSize(size, cond) end

function imgui.SetNextWindowSizeraints(size_min, size_max, ImGuiSizeCallbackcustom_callback, custom_callback_data) end
function imgui.SetNextWindowContentSize(size) end

---Set next window collapsed (use before `imgui.Begin`)
---@param collapsed boolean
---@param cond imgui.Cond|nil When?
function imgui.SetNextWindowCollapsed(collapsed, cond) end

---Set next window focused (use before `imgui.Begin')
function imgui.SetNextWindowFocus() end

---Set next window alpha (use before `imgui.Begin')
---@param alpha number
function imgui.SetNextWindowBgAlpha(alpha) end

---Set window pos
---@param pos ImVec2
---@param cond imgui.Cond|nil
function imgui.SetWindowPosVec2(pos, cond) end

---Set window size
---@param size ImVec2
---@param cond imgui.Cond|nil
function imgui.SetWindowSizeVec2(size, cond) end

---Set window collapse
---@param bool boolean
---@param cond imgui.Cond
function imgui.SetWindowCollapsedBool(bool, cond) end

---Make window focused
function imgui.SetWindowFocus() end

---Set font scale
---@param scale number Scale
function imgui.SetWindowFontScale(scale) end

---Set window pos (using window name)
---@param name string Window title
---@param pos ImVec2 Position
---@param cond imgui.Cond|nil
function imgui.SetWindowPosStr(name, pos, cond) end

---Set window size (using window name)
---@param name string Window title
---@param size ImVec2 Size
---@param cond imgui.Cond|nil
function imgui.SetWindowSizeStr(name, size, cond) end

---Set window collapsed (using window name)
---@param name string Window title
---@param collapsed boolean Is collapsed
---@param cond imgui.Cond|nil
function imgui.SetWindowCollapsedStr(name, collapsed, cond) end

---Set window focus (using window name)
---@param name string Window title
function imgui.SetWindowFocusStr(name) end

---@return number Current X scroll
function imgui.GetScrollX() end

---@return number Current Y scroll
function imgui.GetScrollY() end

---@return number Max X scroll
function imgui.GetScrollMaxX() end

---@return number Max Y scroll
function imgui.GetScrollMaxY() end

---@param scroll number Pixels
function imgui.SetScrollX(scroll) end

---@param scroll number Pixels
function imgui.SetScrollY(scroll) end

function imgui.SetScrollHereX(center_x_ratio) end
function imgui.SetScrollHereY(center_y_ratio) end
function imgui.SetScrollFromPosX(local_x, center_x_ratio) end
function imgui.SetScrollFromPosY(local_y, center_y_ratio) end

function imgui.PushFont(ImFontfont) end
function imgui.PopFont() end

---Change color
---@param colorItem imgui.Col Item
---@param color number Color
function imgui.PushStyleColorU32(colorItem, color) end

---Change color using Vec4
---@param colorItem imgui.Col Item
---@param color ImVec4 Color
function imgui.PushStyleColor(colorItem, color) end

---@param count number|nil Pushed colors count (or nil)
function imgui.PopStyleColor(count) end

---Change style var value (float/number)
---@param var imgui.StyleVar
---@param value number
function imgui.PushStyleVarFloat(var, value) end

---Change style var value (ImVec2)
---@param var imgui.StyleVar
---@param value ImVec2
function imgui.PushStyleVarVec2(var, value) end

---@param count number|nil Pushed colors count (or nil)
function imgui.PopStyleVar(count) end

function imgui.GetStyleColorVec4(ImGuiColidx) end
function imgui.GetFont() end
function imgui.GetFontSize() end
function imgui.GetFontTexUvWhitePixel() end

---@param idx imgui.Col
---@param alpha_mul number? default = 1
---@return number color
function imgui.GetColorU32(idx, alpha_mul) end

---@param col ImVec4
---@return number color
function imgui.GetColorU32Vec4(col) end

function imgui.GetColorU32U32(col) end
function imgui.PushItemWidth(floatitem_width) end
function imgui.PopItemWidth() end
function imgui.SetNextItemWidth(floatitem_width) end
function imgui.CalcItemWidth() end
function imgui.PushTextWrapPos(floatwrap_local_pos_x) end
function imgui.PopTextWrapPos() end
function imgui.PushAllowKeyboardFocus(_Boolallow_keyboard_focus) end
function imgui.PopAllowKeyboardFocus() end
function imgui.PushButtonRepeat(_Boolrepeat) end
function imgui.PopButtonRepeat() end
function imgui.Separator() end

---@param offset_from_start_x number | nil
---@param spacing number | nil
function imgui.SameLine(offset_from_start_x, spacing) end
function imgui.NewLine() end
function imgui.Spacing() end
function imgui.Dummy(size) end

---@param indent_w number | nil
function imgui.Indent(indent_w) end

---@param indent_w number | nil
function imgui.Unindent(indent_w) end
function imgui.BeginGroup() end
function imgui.EndGroup() end

---@return ImVec2 Position
function imgui.GetCursorPos() end

---@return number X
function imgui.GetCursorPosX() end

---@return number Y
function imgui.GetCursorPosY() end

---@param pos ImVec2 Position
function imgui.SetCursorPos(pos) end

---@param x number X
function imgui.SetCursorPosX(x) end

---@param y number Y
function imgui.SetCursorPosY(y) end

---@return ImVec2
function imgui.GetCursorStartPos() end

---@return ImVec2
function imgui.GetCursorScreenPos() end

---@param pos ImVec2 Position
function imgui.SetCursorScreenPos(pos) end
function imgui.nTextToFramePadding() end
function imgui.PushIDStr(str_id) end
function imgui.PushIDRange(str_id_begin, str_id_end) end
function imgui.PushIDPtr(ptr_id) end
function imgui.PushIDInt(int_id) end
function imgui.PopID() end
function imgui.GetIDStr(str_id) end
function imgui.GetIDRange(str_id_begin, str_id_end) end
function imgui.GetIDPtr(ptr_id) end
function imgui.TextUnformatted(text, text_end) end

---Text
---@param text string
function imgui.Text(text) end

---Vertical text
---@param text string
function imgui.TextV(text) end

---Colored text
---@param color ImVec4
---@param text string
function imgui.TextColored(color, text) end

--- Vertical colored text
---@param color ImVec4
---@param text string
function imgui.TextColoredV(color, text) end

---@param text string
function imgui.TextDisabled(text) end

---@param text string
function imgui.TextDisabledV(text) end

---@param text string
function imgui.TextWrapped(text) end

---@param text string
function imgui.TextWrappedV(text) end
function imgui.LabelText(label, fmt, ...) end
function imgui.LabelTextV(label, fmt, va_listargs) end

---@param text string
function imgui.BulletText(text) end

---@param text string
function imgui.BulletTextV(text) end

---@param label string
---@param size ImVec2|nil
function imgui.Button(label, size) end

---@param label string
function imgui.SmallButton(label) end

---@param str_id string
---@param size ImVec2|nil
function imgui.InvisibleButton(str_id, size) end

---@param strId string
---@param direction imgui.Dir
function imgui.ArrowButton(strId, direction) end

---@param texture ImGuiTexture
---@param size ImVec2
---@param uv0 ImVec2 | nil
---@param uv1 ImVec2 | nil
---@param color number | nil
---@param borderColor number | nil
function imgui.Image(texture, size, uv0, uv1, color, borderColor) end

---@param texture ImGuiTexture
---@param size ImVec2
---@param uv0 ImVec2 | nil
---@param uv1 ImVec2 | nil
---@param framePadding ImVec2 | nil
---@param bg_col number | nil
---@param tint_col number | nil
function imgui.ImageButton(texture, size, uv0, uv1, framePadding, bg_col, tint_col) end

---@param label string
---@param checked ImBool
function imgui.Checkbox(label, checked) end
function imgui.CheckboxFlags(label, unsignedintflags, unsignedintflags_value) end

---@param label string
---@param active boolean|nil
function imgui.RadioButtonBool(label, active) end
function imgui.RadioButtonIntPtr(label, v, v_button) end

---@param fraction number 0-1
---@param size ImVec2
---@param overlay string|nil
function imgui.ProgressBar(fraction, size, overlay) end
function imgui.Bullet() end
function imgui.BeginCombo(label, preview_value, ImGuiComboFlagsflags) end
function imgui.EndCombo() end
function imgui.Combo(label, current_item, items, items_count, popup_max_height_in_items) end
function imgui.ComboStr(label, current_item, items_separated_by_zeros, popup_max_height_in_items) end
function imgui.ComboFnPtr(label, current_item, _Bool, data, items_count, popup_max_height_in_items) end
function imgui.GetContentRegionMax() end
function imgui.GetContentRegionAvail() end
function imgui.GetWindowContentRegionMin() end
function imgui.GetWindowContentRegionMax() end
function imgui.GetWindowContentRegionWidth() end

---@param label string
---@param value ImFloat
---@param speed number
---@param min number Minimum value
---@param max number Maximum value
---@param format string|nil
---@param power any
function imgui.DragFloat(label, value, speed, min, max, format, power) end

---@param label string
---@param value ImFloat
---@param speed number
---@param min number Minimum value
---@param max number Maximum value
---@param format string|nil
---@param power any
function imgui.DragFloat2(label, value, speed, min, max, format, power) end

---@param label string
---@param value ImFloat
---@param speed number
---@param min number Minimum value
---@param max number Maximum value
---@param format string|nil
---@param power any
function imgui.DragFloat3(label, value, speed, min, max, format, power) end

---@param label string
---@param value ImFloat
---@param speed number
---@param min number Minimum value
---@param max number Maximum value
---@param format string|nil
---@param power any
function imgui.DragFloat4(label, value, speed, min, max, format, power) end

function imgui.DragFloatRange2(
	label,
	floatv_current_min,
	floatv_current_max,
	floatv_speed,
	floatv_min,
	floatv_max,
	format,
	format_max,
	floatpower
)
end
function imgui.DragIntRange2(label, v_current_min, v_current_max, floatv_speed, v_min, v_max, format, format_max) end
function imgui.DragScalar(label, ImGuiDataTypedata_type, v, floatv_speed, v_min, v_max, format, floatpower) end
function imgui.DragScalarN(
	label,
	ImGuiDataTypedata_type,
	v,
	components,
	floatv_speed,
	v_min,
	v_max,
	format,
	floatpower
)
end

---@param label string
---@param value ImInt
---@param speed number|nil
---@param min number
---@param max number
---@param format string|nil
function imgui.DragInt(label, value, speed, min, max, format) end
function imgui.DragInt2(label, value, speed, min, max, format) end
function imgui.DragInt3(label, value, speed, min, max, format) end
function imgui.DragInt4(label, value, speed, min, max, format) end

function imgui.SliderFloat(label, floatv, floatv_min, floatv_max, format, floatpower) end
function imgui.SliderFloat2(label, floatv, floatv_min, floatv_max, format, floatpower) end
function imgui.SliderFloat3(label, floatv, floatv_min, floatv_max, format, floatpower) end
function imgui.SliderFloat4(label, floatv, floatv_min, floatv_max, format, floatpower) end

function imgui.SliderAngle(label, floatv_rad, floatv_degrees_min, floatv_degrees_max, format) end

function imgui.SliderInt(label, v, v_min, v_max, format) end
function imgui.SliderInt2(label, v, v_min, v_max, format) end
function imgui.SliderInt3(label, v, v_min, v_max, format) end
function imgui.SliderInt4(label, v, v_min, v_max, format) end

function imgui.SliderScalar(label, ImGuiDataTypedata_type, v, v_min, v_max, format, floatpower) end
function imgui.SliderScalarN(label, ImGuiDataTypedata_type, v, components, v_min, v_max, format, floatpower) end
function imgui.VSliderFloat(label, size, floatv, floatv_min, floatv_max, format, floatpower) end
function imgui.VSliderInt(label, size, v, v_min, v_max, format) end
function imgui.VSliderScalar(label, size, ImGuiDataTypedata_type, v, v_min, v_max, format, floatpower) end
function imgui.InputText(label, charbuf, buf_size, flags, ImGuiInputTextCallbackcallback, user_data) end
function imgui.InputTextMultiline(label, charbuf, buf_size, size, flags, ImGuiInputTextCallbackcallback, user_data) end
function imgui.InputTextWithHint(label, hint, charbuf, buf_size, flags, ImGuiInputTextCallbackcallback, user_data) end
function imgui.InputFloat(label, floatv, floatstep, floatstep_fast, format, flags) end
function imgui.InputFloat2(label, floatv, format, flags) end
function imgui.InputFloat3(label, floatv, format, flags) end
function imgui.InputFloat4(label, floatv, format, flags) end
function imgui.InputInt(label, v, s, step_fast, flags) end
function imgui.InputInt2(label, v, flags) end
function imgui.InputInt3(label, v, flags) end
function imgui.InputInt4(label, v, flags) end
function imgui.InputDouble(label, doublev, doublestep, doublestep_fast, format, flags) end
function imgui.InputScalar(label, ImGuiDataTypedata_type, v, step, step_fast, format, flags) end
function imgui.InputScalarN(label, ImGuiDataTypedata_type, v, components, step, step_fast, format, flags) end
function imgui.ColorEdit3(label, floatcol, ImGuiColorEditFlagsflags) end
function imgui.ColorEdit4(label, floatcol, ImGuiColorEditFlagsflags) end
function imgui.ColorPicker3(label, floatcol, ImGuiColorEditFlagsflags) end
function imgui.ColorPicker4(label, floatcol, ImGuiColorEditFlagsflags, floatref_col) end
function imgui.ColorButton(desc_id, col, ImGuiColorEditFlagsflags, size) end
function imgui.SetColorEditOptions(ImGuiColorEditFlagsflags) end
function imgui.TreeNodeStr(label) end
function imgui.TreeNodeStrStr(str_id, fmt, ...) end
function imgui.TreeNodePtr(ptr_id, fmt, ...) end
function imgui.TreeNodeVStr(str_id, fmt, va_listargs) end
function imgui.TreeNodeVPtr(ptr_id, fmt, va_listargs) end
function imgui.TreeNodeExStr(label, ImGuiTreeNodeFlagsflags) end
function imgui.TreeNodeExStrStr(str_id, ImGuiTreeNodeFlagsflags, fmt, ...) end
function imgui.TreeNodeExPtr(ptr_id, ImGuiTreeNodeFlagsflags, fmt, ...) end
function imgui.TreeNodeExVStr(str_id, ImGuiTreeNodeFlagsflags, fmt, va_listargs) end
function imgui.TreeNodeExVPtr(ptr_id, ImGuiTreeNodeFlagsflags, fmt, va_listargs) end
function imgui.TreePushStr(str_id) end
function imgui.TreePushPtr(ptr_id) end
function imgui.TreePop() end
function imgui.GetTreeNodeToLabelSpacing() end
function imgui.CollapsingHeader(label, ImGuiTreeNodeFlagsflags) end
function imgui.CollapsingHeaderBoolPtr(label, _Boolp_open, ImGuiTreeNodeFlagsflags) end
function imgui.SetNextItemOpen(_Boolis_open, ImGuiCondcond) end
function imgui.Selectable(label, _Boolselected, ImGuiSelectableFlagsflags, size) end
function imgui.SelectableBoolPtr(label, _Boolp_selected, ImGuiSelectableFlagsflags, size) end
function imgui.ListBoxStr_arr(label, current_item, items, items_count, height_in_items) end
function imgui.ListBoxFnPtr(label, current_item, _Bool, data, items_count, height_in_items) end
function imgui.ListBoxHeaderVec2(label, size) end
function imgui.ListBoxHeaderInt(label, items_count, height_in_items) end
function imgui.ListBoxFooter() end
function imgui.PlotLines(
	label,
	floatvalues,
	values_count,
	values_offset,
	overlay_text,
	floatscale_min,
	floatscale_max,
	graph_size,
	stride
)
end
function imgui.PlotLinesFnPtr(
	label,
	number,
	data,
	values_count,
	values_offset,
	overlay_text,
	floatscale_min,
	floatscale_max,
	graph_size
)
end
function imgui.PlotHistogramFloatPtr(
	label,
	floatvalues,
	values_count,
	values_offset,
	overlay_text,
	floatscale_min,
	floatscale_max,
	graph_size,
	stride
)
end
function imgui.PlotHistogramFnPtr(
	label,
	number,
	data,
	values_count,
	values_offset,
	overlay_text,
	floatscale_min,
	floatscale_max,
	graph_size
)
end
function imgui.ValueBool(prefix, _Boolb) end
function imgui.ValueInt(prefix, v) end
function imgui.ValueUint(prefix, unsignedintv) end
function imgui.ValueFloat(prefix, floatv, float_format) end
function imgui.BeginMainMenuBar() end
function imgui.EndMainMenuBar() end
function imgui.BeginMenuBar() end
function imgui.EndMenuBar() end
function imgui.BeginMenu(label, _Boolenabled) end
function imgui.EndMenu() end
function imgui.MenuItemBool(label, shortcut, _Boolselected, _Boolenabled) end
function imgui.MenuItemBoolPtr(label, shortcut, _Boolp_selected, _Boolenabled) end
function imgui.BeginTooltip() end
function imgui.EndTooltip() end
function imgui.SetTooltip(fmt, ...) end
function imgui.SetTooltipV(fmt, va_listargs) end
function imgui.OpenPopup(str_id) end
function imgui.BeginPopup(str_id, ImGuiWindowFlagsflags) end
function imgui.BeginPopupContextItem(str_id, mouse_button) end
function imgui.BeginPopupContextWindow(str_id, mouse_button, _Boolalso_over_items) end
function imgui.BeginPopupContext(str_id, mouse_button) end
function imgui.BeginPopupModal(name, _Boolp_open, ImGuiWindowFlagsflags) end
function imgui.EndPopup() end
function imgui.OpenPopupOnItemClick(str_id, mouse_button) end
function imgui.IsPopupOpen(str_id) end
function imgui.CloseCurrentPopup() end
function imgui.Columns(count, id, _Boolborder) end
function imgui.NextColumn() end
function imgui.GetColumnIndex() end
function imgui.GetColumnWidth(column_index) end
function imgui.SetColumnWidth(column_index, floatwidth) end
function imgui.GetColumnOffset(column_index) end
function imgui.SetColumnOffset(column_index, floatoffset_x) end
function imgui.GetColumnsCount() end
function imgui.BeginTabBar(str_id, ImGuiTabBarFlagsflags) end
function imgui.EndTabBar() end
function imgui.BeginTabItem(label, _Boolp_open, ImGuiTabItemFlagsflags) end
function imgui.EndTabItem() end
function imgui.SetTabItemClosed(tab_or_docked_window_label) end
function imgui.LogToTTY(auto_open_depth) end
function imgui.LogToFile(auto_open_depth, filename) end
function imgui.LogToClipboard(auto_open_depth) end
function imgui.LogFinish() end
function imgui.LogButtons() end
function imgui.BeginDragDropSource(ImGuiDragDropFlagsflags) end
function imgui.SetDragDropPayload(type, data, sz, ImGuiCondcond) end
function imgui.EndDragDropSource() end
function imgui.BeginDragDropTarget() end
function imgui.AcceptDragDropPayload(type, ImGuiDragDropFlagsflags) end
function imgui.EndDragDropTarget() end
function imgui.GetDragDropPayload() end
function imgui.PushClipRect(clip_rect_min, clip_rect_max, _Boolintersect_with_current_clip_rect) end
function imgui.PopClipRect() end
function imgui.SetItemDefaultFocus() end
function imgui.SetKeyboardFocusHere(offset) end
function imgui.LoadIniSettingsFromDisk(ini_filename) end
function imgui.LoadIniSettingsFromMemory(ini_data, ini_size) end
function imgui.SaveIniSettingsToDisk(ini_filename) end
function imgui.SaveIniSettingsToMemory(out_ini_size) end
function imgui.MemAlloc(size) end
function imgui.MemFree(ptr) end
function imgui.LogText(fmt, ...) end
function imgui.ColorConvertRGBtoHSV(floatr, floatg, floatb, floatout_h, floatout_s, floatout_v) end
function imgui.ColorConvertHSVtoRGB(floath, floats, floatv, floatout_r, floatout_g, floatout_b) end
function imgui.CaptureKeyboardFromApp(_Boolwant_capture_keyboard_value) end
function imgui.CaptureMouseFromApp(_Boolwant_capture_mouse_value) end
function imgui.GetItemRectMin() end
function imgui.GetItemRectMax() end
function imgui.GetItemRectSize() end
function imgui.SetItemAllowOverlap() end
function imgui.GetTime() end
function imgui.GetFrameCount() end
function imgui.GetDrawListSharedData() end
function imgui.GetStyleColorName(ImGuiColidx) end
function imgui.SetStateStorage(ImGuiStoragestorage) end
function imgui.GetStateStorage() end

---@param text string text
---@return ImVec2
function imgui.CalcTextSize(text, text_end, _Boolhide_text_after_double_hash, floatwrap_width) end
function imgui.CalcListClipping(items_count, floatitems_height, out_items_display_start, out_items_display_end) end
function imgui.BeginChildFrame(ImGuiIDid, size, ImGuiWindowFlagsflags) end
function imgui.EndChildFrame() end
function imgui.ColorConvertU32ToFloat4(_in) end
function imgui.ColorConvertFloat4ToU32(_in) end

---@param key imgui.Key
function imgui.GetKeyIndex(key) end

---@param key imgui.Key
---@param repeatDelay number|nil
---@param rate number|nil
function imgui.GetKeyPressedAmount(key, repeatDelay, rate) end

---@return ImVec2 Position
function imgui.GetMousePos() end

---@return ImVec2 Position
function imgui.GetMousePosOnOpeningCurrentPopup() end

---@param button imgui.Key|nil
---@param lock any
---@return ImVec2 Drag
function imgui.GetMouseDragDelta(button, lock) end

---@param button imgui.Key
function imgui.ResetMouseDragDelta(button) end

---@return imgui.MouseCursor
function imgui.GetMouseCursor() end

---@param cursor imgui.MouseCursor
function imgui.SetMouseCursor(cursor) end

---@return string
function imgui.GetClipboardText() end

---@param text string
function imgui.SetClipboardText(text) end

---@param key imgui.Key
---@return boolean
function imgui.IsKeyDown(key) end

---@param key imgui.Key
---@param _repeat boolean | nil
---@return boolean
function imgui.IsKeyPressed(key, _repeat) end

---@param key imgui.Key
---@return boolean
function imgui.IsKeyReleased(key) end

---@param size ImVec2
---@return boolean
function imgui.IsRectVisible(size) end

---@return boolean
function imgui.IsRectVisibleVec2(rect_min, rect_max) end

---@param flags imgui.HoveredFlags? default = 0
---@return boolean
function imgui.IsItemHovered(flags) end

---@return boolean
function imgui.IsItemActive() end

---@return boolean
function imgui.IsItemFocused() end

---@param mouse_button imgui.MouseButton? default = 0
---@return boolean
function imgui.IsItemClicked(mouse_button) end

---@return boolean
function imgui.IsItemVisible() end

---@return boolean
function imgui.IsItemEdited() end

---@return boolean
function imgui.IsItemActivated() end

---@return boolean
function imgui.IsItemDeactivated() end

---@return boolean
function imgui.IsItemDeactivatedAfterEdit() end

---@return boolean
function imgui.IsAnyItemHovered() end

---@return boolean
function imgui.IsAnyItemActive() end

---@return boolean
function imgui.IsAnyItemFocused() end

---@return boolean
function imgui.IsMouseDown(button) end

---@return boolean
function imgui.IsAnyMouseDown() end

---@return boolean
function imgui.IsMouseClicked(button, _Boolrepeat) end

---@return boolean
function imgui.IsMouseDoubleClicked(button) end

---@return boolean
function imgui.IsMouseReleased(button) end

---@return boolean
function imgui.IsMouseDragging(button, floatlock_threshold) end

---@return boolean
function imgui.IsMouseHoveringRect(r_min, r_max, _Boolclip) end

---@return boolean
function imgui.IsMousePosValid(mouse_pos) end

return imgui
