using System;

namespace Raylib;

// Color, 4 components, R8G8B8A8 (32bit) 
[CRepr]
struct Color
{
	public uint8 r, g, b, a;
	public this(uint8 r, uint8 g, uint8 b, uint8 a)
	{
		this.r = r;
		this.g = g;
		this.b = b;
		this.a = a;
	}

	// Get color with alpha applied, alpha goes from 0.0f to 1.0f 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Color Fade(Color color, float alpha);

	// Get hexadecimal value for a Color 
	[CallingConvention(.Cdecl), LinkName("ColorToInt")]
	public static extern int32 ToInt(Color color);

	// Get Color normalized as float [0..1] 
	[CallingConvention(.Cdecl), LinkName("ColorNormalize")]
	public static extern Vector4 Normalize(Color color);

	// Get Color from normalized values [0..1] 
	[CallingConvention(.Cdecl), LinkName("ColorFromNormalized")]
	public static extern Color FromNormalized(Vector4 normalized);

	// Get HSV values for a Color, hue [0..360], saturation/value [0..1] 
	[CallingConvention(.Cdecl), LinkName("ColorToHSV")]
	public static extern Vector3 ToHSV(Color color);

	// Get a Color from HSV values, hue [0..360], saturation/value [0..1] 
	[CallingConvention(.Cdecl), LinkName("ColorFromHSV")]
	public static extern Color FromHSV(float hue, float saturation, float value);

	// Get color with alpha applied, alpha goes from 0.0f to 1.0f 
	[CallingConvention(.Cdecl), LinkName("ColorAlpha")]
	public static extern Color Alpha(Color color, float alpha);

	// Get src alpha-blended into dst color with tint 
	[CallingConvention(.Cdecl), LinkName("ColorAlphaBlend")]
	public static extern Color AlphaBlend(Color dst, Color src, Color tint);

	// Get Color structure from hexadecimal value 
	[CallingConvention(.Cdecl), LinkName("GetColor")]
	public static extern Color Get(uint32 hexValue);
}

static
{
	public const Color LIGHTGRAY = .(200, 200, 200, 255); // Light Gray 
	public const Color GRAY = .(130, 130, 130, 255); // Gray 
	public const Color DARKGRAY = .(80, 80, 80, 255); // Dark Gray 
	public const Color YELLOW = .(253, 249, 0, 255); // Yellow 
	public const Color GOLD = .(255, 203, 0, 255); // Gold 
	public const Color ORANGE = .(255, 161, 0, 255); // Orange 
	public const Color PINK = .(255, 109, 194, 255); // Pink 
	public const Color RED = .(230, 41, 55, 255); // Red 
	public const Color MAROON = .(190, 33, 55, 255); // Maroon 
	public const Color GREEN = .(0, 228, 48, 255); // Green 
	public const Color LIME = .(0, 158, 47, 255); // Lime 
	public const Color DARKGREEN = .(0, 117, 44, 255); // Dark Green 
	public const Color SKYBLUE = .(102, 191, 255, 255); // Sky Blue 
	public const Color BLUE = .(0, 121, 241, 255); // Blue 
	public const Color DARKBLUE = .(0, 82, 172, 255); // Dark Blue 
	public const Color PURPLE = .(200, 122, 255, 255); // Purple 
	public const Color VIOLET = .(135, 60, 190, 255); // Violet 
	public const Color DARKPURPLE = .(112, 31, 126, 255); // Dark Purple 
	public const Color BEIGE = .(211, 176, 131, 255); // Beige 
	public const Color BROWN = .(127, 106, 79, 255); // Brown 
	public const Color DARKBROWN = .(76, 63, 47, 255); // Dark Brown 
	public const Color WHITE = .(255, 255, 255, 255); // White 
	public const Color BLACK = .(0, 0, 0, 255); // Black 
	public const Color BLANK = .(0, 0, 0, 0); // Blank (Transparent) 
	public const Color MAGENTA = .(255, 0, 255, 255); // Magenta 
	public const Color RAYWHITE = .(245, 245, 245, 255); // My own White (raylib logo)
}