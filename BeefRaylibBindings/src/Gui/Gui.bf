#if false

using System;

namespace Raylib.Gui;

public struct StyleProp
{
	public Control control;
	public Property property;
	public uint value;
}

public enum State
{
	STATE_NORMAL = 0,
	STATE_FOCUSED,
	STATE_PRESSED,
	STATE_DISABLED,
}

public enum TextAlignment
{
	LEFT = 0,
	CENTER,
	RIGHT,
}

public enum Control
{
	// Default -> populates to all controls when set
	DEFAULT = 0,
	// Basic controls
	LABEL,          // Used also for: LABELBUTTON
	BUTTON,
	TOGGLE,         // Used also for: TOGGLEGROUP
	SLIDER,         // Used also for: SLIDERBAR
	PROGRESSBAR,
	CHECKBOX,
	COMBOBOX,
	DROPDOWNBOX,
	TEXTBOX,        // Used also for: TEXTBOXMULTI
	VALUEBOX,
	SPINNER,        // Uses: BUTTON, VALUEBOX
	LISTVIEW,
	COLORPICKER,
	SCROLLBAR,
	STATUSBAR
}

[AllowDuplicates]
public enum Property
{
	BORDER_COLOR_NORMAL = 0,
	BASE_COLOR_NORMAL,
	TEXT_COLOR_NORMAL,
	BORDER_COLOR_FOCUSED,
	BASE_COLOR_FOCUSED,
	TEXT_COLOR_FOCUSED,
	BORDER_COLOR_PRESSED,
	BASE_COLOR_PRESSED,
	TEXT_COLOR_PRESSED,
	BORDER_COLOR_DISABLED,
	BASE_COLOR_DISABLED,
	TEXT_COLOR_DISABLED,
	BORDER_WIDTH,
	TEXT_PADDING,
	TEXT_ALIGNMENT,
	RESERVED,

	TEXT_SIZE = 16,             // Text size (glyphs max height)
	TEXT_SPACING,               // Text spacing between glyphs
	LINE_COLOR,                 // Line control color
	BACKGROUND_COLOR,           // Background color

	GROUP_PADDING = 16,         // ToggleGroup separation between toggles

	SLIDER_WIDTH = 16,          // Slider size of internal bar
	SLIDER_PADDING,              // Slider/SliderBar internal bar padding

	PROGRESS_PADDING = 16,      // ProgressBar internal padding

	ARROWS_SIZE = 16,
	ARROWS_VISIBLE,
	SCROLL_SLIDER_PADDING,      // (SLIDERBAR, SLIDER_PADDING)
	SCROLL_SLIDER_SIZE,
	SCROLL_PADDING,
	SCROLL_SPEED,

	CHECK_PADDING = 16,          // CheckBox internal check padding

	COMBO_BUTTON_WIDTH = 16,    // ComboBox right button width
	COMBO_BUTTON_SPACING,        // ComboBox button separation

	ARROW_PADDING = 16,         // DropdownBox arrow separation from border and items
	DROPDOWN_ITEMS_SPACING,      // DropdownBox items separation

	TEXT_INNER_PADDING = 16,    // TextBox/TextBoxMulti/ValueBox/Spinner inner text padding
	TEXT_LINES_SPACING,         // TextBoxMulti lines separation

	SPIN_BUTTON_WIDTH = 16,     // Spinner left/right buttons width
	SPIN_BUTTON_SPACING,        // Spinner buttons separation

	LIST_ITEMS_HEIGHT = 16,     // ListView items height
	LIST_ITEMS_SPACING,         // ListView items separation
	SCROLLBAR_WIDTH,            // ListView scrollbar size (usually width)
	SCROLLBAR_SIDE,             // ListView scrollbar side (0-left, 1-right)

	COLOR_SELECTOR_SIZE = 16,
	HUEBAR_WIDTH,               // ColorPicker right hue bar width
	HUEBAR_PADDING,             // ColorPicker right hue bar separation from panel
	HUEBAR_SELECTOR_HEIGHT,     // ColorPicker right hue bar selector height
	HUEBAR_SELECTOR_OVERFLOW    // ColorPicker right hue bar selector overflow
}

static
{
	const uint SCROLLBAR_LEFT_SIDE = 0;
	const uint SCROLLBAR_RIGHT_SIDE = 1;
}

static
{
	public static void Enable()
	{

	}

	public static void Disable()
	{

	}

	public static void Lock()
	{

	}

	public static void Unlock()
	{

	}

	public static bool IsLocked()
	{
		return false;
	}

	public static void Fade(float alpha)
	{

	}

	public static void SetState(State state)
	{

	}

	public static State GetState()
	{
		return .STATE_DISABLED;
	}


	public static void SetFont(Font font)
	{

	}

	public static Font GetFont()
	{
		return Font.Default;
	}


	public static void SetStyle(Control control, Property property, uint value)
	{

	}

	public static uint GetStyle(Control control, Property property)
	{
		return 0;
	}


	public static bool WindowBox(Rectangle bounds, char8* title)
	{
		return false;
	}

	public static void GroupBox(Rectangle bounds, char8* text)
	{

	}
}

#endif