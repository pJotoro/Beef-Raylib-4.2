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

	// Wait for some time (halt program execution) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void WaitTime(double seconds);
}