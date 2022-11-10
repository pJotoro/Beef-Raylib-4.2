using System;

namespace Raylib;

public static class FPS
{
	// Set target FPS (maximum) 
	[CallingConvention(.Cdecl), LinkName("SetTargetFPS")]
	public static extern void SetTarget(int32 fps);

	// Get current FPS 
	[CallingConvention(.Cdecl), LinkName("GetFPS")]
	public static extern int32 Get();

	// Draw current FPS 
	[CallingConvention(.Cdecl), LinkName("DrawFPS")]
	public static extern void Draw(int32 posX, int32 posY);
}