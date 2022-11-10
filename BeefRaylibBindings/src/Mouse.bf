using System;

namespace Raylib;

public static class Mouse
{
	// Mouse buttons 
	[AllowDuplicates]
	public enum Button : int32
	{
		LEFT = 0,
		RIGHT = 1,
		MIDDLE = 2,
		SIDE = 3,
		EXTRA = 4,
		FORWARD = 5,
		BACK = 6,
	}

	// Check if a mouse button has been pressed once 
	[CallingConvention(.Cdecl), LinkName("IsMouseButtonPressed")]
	public static extern bool IsButtonPressed(Button button);

	// Check if a mouse button is being pressed 
	[CallingConvention(.Cdecl), LinkName("IsMouseButtonDown")]
	public static extern bool IsButtonDown(Button button);

	// Check if a mouse button has been released once 
	[CallingConvention(.Cdecl), LinkName("IsMouseButtonReleased")]
	public static extern bool IsButtonReleased(Button button);

	// Check if a mouse button is NOT being pressed 
	[CallingConvention(.Cdecl), LinkName("IsMouseButtonUp")]
	public static extern bool IsButtonUp(Button button);

	// Get mouse position X 
	[CallingConvention(.Cdecl), LinkName("GetMouseX"), NoShow]
	public static extern int32 GetX();
	public static int32 X { get { return GetX(); } }

	// Get mouse position Y 
	[CallingConvention(.Cdecl), LinkName("GetMouseY"), NoShow]
	public static extern int32 GetY();
	public static int32 Y { get { return GetY(); } }

	// Get mouse position XY 
	[CallingConvention(.Cdecl), LinkName("GetMousePosition"), NoShow]
	public static extern Vector2 GetPosition();

	// Get mouse delta between frames 
	[CallingConvention(.Cdecl), LinkName("GetMouseDelta")]
	public static extern Vector2 GetDelta();

	// Set mouse position XY 
	[CallingConvention(.Cdecl), LinkName("SetMousePosition")]
	public static extern void SetPosition(int32 x, int32 y);

	// Set mouse offset 
	[CallingConvention(.Cdecl), LinkName("SetMouseOffset")]
	public static extern void SetOffset(int32 offsetX, int32 offsetY);

	// Set mouse scaling 
	[CallingConvention(.Cdecl), LinkName("SetMouseScale")]
	public static extern void SetScale(float scaleX, float scaleY);

	public static class Wheel
	{
		// Get mouse wheel movement for X or Y, whichever is larger 
		[CallingConvention(.Cdecl), LinkName("GetMouseWheelMove")]
		public static extern float GetMove();

		// Get mouse wheel movement for both X and Y 
		[CallingConvention(.Cdecl), LinkName("GetMouseWheelMoveV")]
		public static extern Vector2 GetMoveV();
	}

	public static class Cursor
	{
		// Mouse cursor 
		[AllowDuplicates]
		public enum Kind : int32
		{
			DEFAULT = 0,
			ARROW = 1,
			IBEAM = 2,
			CROSSHAIR = 3,
			POINTING_HAND = 4,
			RESIZE_EW = 5,
			RESIZE_NS = 6,
			RESIZE_NWSE = 7,
			RESIZE_NESW = 8,
			RESIZE_ALL = 9,
			NOT_ALLOWED = 10,
		}

		// Shows cursor 
		[CallingConvention(.Cdecl), LinkName("ShowCursor")]
		public static extern void Show();

		// Hides cursor 
		[CallingConvention(.Cdecl), LinkName("HideCursor")]
		public static extern void Hide();

		// Check if cursor is not visible 
		[CallingConvention(.Cdecl), LinkName("IsCursorHidden")]
		public static extern bool IsHidden();

		// Enables cursor (unlock cursor) 
		[CallingConvention(.Cdecl), LinkName("EnableCursor")]
		public static extern void Enable();

		// Disables cursor (lock cursor) 
		[CLink, CallingConvention(.Cdecl), LinkName("DisableCursor")]
		public static extern void Disable();

		// Check if cursor is on the screen 
		[CLink, CallingConvention(.Cdecl), LinkName("IsCursorOnScreen")]
		public static extern bool IsOnScreen();

		// Set mouse cursor 
		[CallingConvention(.Cdecl), LinkName("SetMouseCursor")]
		public static extern void Set(Kind cursor);
	}
}