using System;

namespace Raylib;

// Color blending modes (pre-defined) 
[AllowDuplicates]
public enum BlendMode : int32
{
	ALPHA = 0,
	ADDITIVE = 1,
	MULTIPLIED = 2,
	ADD_COLORS = 3,
	SUBTRACT_COLORS = 4,
	ALPHA_PREMULTIPLY = 5,
	CUSTOM = 6,
}

static
{
	// Begin blending mode (alpha, additive, multiplied, subtract, custom) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void BeginBlendMode(BlendMode mode);

	// End blending mode (reset to default: alpha blending) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void EndBlendMode();
}