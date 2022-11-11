using System;

namespace Raylib;

static
{
	// Enable waiting for events on EndDrawing(), no automatic event polling 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void EnableEventWaiting();

	// Disable waiting for events on EndDrawing(), automatic events polling 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DisableEventWaiting();

	// Swap back buffer with front buffer (screen drawing) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void SwapScreenBuffer();

	// Register all input events 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void PollInputEvents();
}