using System;

namespace Raylib;

public static class Clipboard
{
	// Set clipboard text content 
	[CallingConvention(.Cdecl), LinkName("SetClipboardText")]
	public static extern void SetText(char8* text);

	// Get clipboard text content 
	[CallingConvention(.Cdecl), LinkName("GetClipboardText")]
	public static extern char8* GetText();
}