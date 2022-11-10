using System;

namespace Raylib;

public static class Touch
{
	// Get touch position X for touch point32 0 (relative to screen size) 
	[CallingConvention(.Cdecl), LinkName("GetTouchX"), NoShow]
	public static extern int32 GetX();
	public static int32 X { get { return GetX(); } }

	// Get touch position Y for touch point32 0 (relative to screen size) 
	[CallingConvention(.Cdecl), LinkName("GetTouchY"), NoShow]
	public static extern int32 GetY();
	public static int32 Y { get { return GetY(); } }

	// Get touch position XY for a touch point32 index (relative to screen size) 
	[CallingConvention(.Cdecl), LinkName("GetTouchPosition")]
	public static extern Vector2 GetPosition(int32 index);

	public static class Point
	{
		// Get touch point32 identifier for given index 
		[CallingConvention(.Cdecl), LinkName("GetTouchPointId")]
		public static extern int32 GetId(int32 index);

		// Get number of touch points 
		[CallingConvention(.Cdecl), LinkName("GetTouchPointCount"), NoShow]
		public static extern int32 GetCount();
		public static int32 Count { get { return GetCount(); } }
	}
}