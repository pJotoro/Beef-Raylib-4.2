using System;

namespace Raylib;

static
{
	// Get time in seconds for last frame drawn (delta time) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern float GetFrameTime();

	// Get elapsed time in seconds since InitWindow() 
	[CLink, CallingConvention(.Cdecl)]
	public static extern double GetTime();
}