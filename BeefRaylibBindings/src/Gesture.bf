using System;

namespace Raylib;

public static class Gesture
{
	// Gesture 
	[AllowDuplicates]
	public enum Flags : uint32
	{
		NONE = 0,
		TAP = 1,
		DOUBLETAP = 2,
		HOLD = 4,
		DRAG = 8,
		SWIPE_RIGHT = 16,
		SWIPE_LEFT = 32,
		SWIPE_UP = 64,
		SWIPE_DOWN = 128,
		PINCH_IN = 256,
		PINCH_OUT = 512,
	}

	// Enable a set of gestures using flags 
	[CallingConvention(.Cdecl), LinkName("SetGesturesEnabled")]
	public static extern void SetEnabled(Flags flags);

	// Check if a gesture have been detected 
	[CallingConvention(.Cdecl), LinkName("IsGestureDetected")]
	public static extern bool IsDetected(int32 gesture);

	// Get latest detected gesture 
	[CallingConvention(.Cdecl), LinkName("GetGestureDetected")]
	public static extern int32 GetDetected();

	// Get gesture hold time in milliseconds 
	[CallingConvention(.Cdecl), LinkName("GetGestureHoldDuration")]
	public static extern float GetHoldDuration();

	// Get gesture drag vector 
	[CallingConvention(.Cdecl), LinkName("GetGestureDragVector")]
	public static extern Vector2 GetDragVector();

	// Get gesture drag angle 
	[CallingConvention(.Cdecl), LinkName("GetGestureDragAngle")]
	public static extern float GetDragAngle();

	// Get gesture pinch delta 
	[CallingConvention(.Cdecl), LinkName("GetGesturePinchVector")]
	public static extern Vector2 GetPinchVector();

	// Get gesture pinch angle 
	[CLink, CallingConvention(.Cdecl), LinkName("GetGesturePinchAngle")]
	public static extern float GetPinchAngle();
}