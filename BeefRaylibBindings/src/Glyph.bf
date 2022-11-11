using System;

namespace Raylib;

// GlyphInfo, font characters glyphs info 
[CRepr]
public struct GlyphInfo
{
	public int32 value;
	public int32 offsetX;
	public int32 offsetY;
	public int32 advanceX;
	public Image image;
}

public struct Glyph
{
	private char32 mCodepoint;
	private Font mFont;

	public this(char32 codepoint)
	{
		mCodepoint = codepoint;
		mFont = Font.Default;
	}

	public this(char32 codepoint, Font font)
	{
		mCodepoint = codepoint;
		mFont = font;
	}

	[Commutable]
	public static bool operator==(Glyph glyph, char32 codepoint)
	{
		return glyph.mCodepoint == codepoint;
	}

	// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found 
	[CallingConvention(.Cdecl), LinkName("GetGlyphIndex"), NoShow]
	public static extern int32 GetIndex(Font font, int32 codepoint);
	public int32 Index
	{
		get
		{
			return GetIndex(mFont, (int32)mCodepoint);
		}
	}

	// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found 
	[CallingConvention(.Cdecl), LinkName("GetGlyphInfo"), NoShow]
	public static extern GlyphInfo GetInfo(Font font, int32 codepoint);
	public GlyphInfo Info
	{
		get
		{
			return GetInfo(mFont, (int32)mCodepoint);
		}
	}

	// Get glyph rectangle in font atlas for a codepoint32 (unicode character), fallback to '?' if not found 
	[CallingConvention(.Cdecl), LinkName("GetGlyphAtlasRec"), NoShow]
	public static extern Rectangle GetAtlasRec(Font font, int32 codepoint);
	public Rectangle AtlasRec
	{
		get
		{
			return GetAtlasRec(mFont, (int32)mCodepoint);
		}
	}

	// Load font data for further use 
	[CallingConvention(.Cdecl), LinkName("LoadFontData")]
	public static extern GlyphInfo* LoadInfo(uint8* fileData, int32 dataSize, int32 fontSize, int32 * fontChars, int32 glyphCount, int32 type);

	// Unload font chars info data (RAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadFontData")]
	public static extern void UnloadInfo(GlyphInfo * chars, int32 glyphCount);
}