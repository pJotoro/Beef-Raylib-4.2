using System;

namespace Raylib;

// Font, font texture and GlyphInfo array data 
[CRepr]
public struct Font
{
	// Font type, defines generation method 
	[AllowDuplicates]
	public enum Type : int32
	{
		DEFAULT = 0,
		BITMAP = 1,
		SDF = 2,
	}

	public int32 baseSize;
	public int32 glyphCount;
	public int32 glyphPadding;
	public Texture2D texture;
	public Rectangle* recs;
	public GlyphInfo* glyphs;

	// Get the default Font 
	[CallingConvention(.Cdecl), LinkName("GetFontDefault"), NoShow]
	public static extern Font GetDefault();
	public static Font Default { get { return GetDefault(); } }

	// Load font from file into GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("LoadFont")]
	public static extern Font Load(char8* fileName);

	// Load font from file with extended parameters, use NULL for fontChars and 0 for glyphCount to load the default character set 
	[CallingConvention(.Cdecl), LinkName("LoadFontEx")]
	public static extern Font Load(char8* fileName, int32 fontSize, int32 * fontChars, int32 glyphCount);

	// Load font from Image (XNA style) 
	[CallingConvention(.Cdecl), LinkName("LoadFontFromImage")]
	public static extern Font Load(Image image, Color key, int32 firstChar);

	// Load font from memory buffer, fileType refers to extension: i.e. '.ttf' 
	[CallingConvention(.Cdecl), LinkName("LoadFontFromMemory")]
	public static extern Font Load(char8* fileType, uint8* fileData, int32 dataSize, int32 fontSize, int32 * fontChars, int32 glyphCount);

	// Unload font from GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadFont"), NoShow]
	public static extern void Unload(Font font);
	public void Unload() { Unload(this); }

	// Export font as code file, returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportFontAsCode"), NoShow]
	public static extern bool ExportAsCode(Font font, char8* fileName);
	public bool ExportAsCode(char8* fileName) { return ExportAsCode(this, fileName); }
}

static
{
	// Measure string width for default font 
	[CLink, CallingConvention(.Cdecl)]
	public static extern int32 MeasureText(char8* text, int32 fontSize);

	// Measure string size for Font 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 MeasureTextEx(Font font, char8* text, float fontSize, float spacing);
}