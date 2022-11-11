using System;

namespace Raylib;

static
{
	// Takes a screenshot of current screen (filename extension defines format) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void TakeScreenshot(char8* fileName);

	// Open URL with default system browser (if available) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void OpenURL(char8* url);
}