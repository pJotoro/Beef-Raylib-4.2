using System;

namespace Raylib;

typealias Texture2D = Texture;

// Texture, tex data stored in GPU memory (VRAM) 
[CRepr]
public struct Texture
{
	// Texture parameters: filter mode 
	[AllowDuplicates]
	public enum Filter : int32
	{
		POINT = 0,
		BILINEAR = 1,
		TRILINEAR = 2,
		ANISOTROPIC_4X = 3,
		ANISOTROPIC_8X = 4,
		ANISOTROPIC_16X = 5,
	}

	// Texture parameters: wrap mode 
	[AllowDuplicates]
	public enum Wrap : int32
	{
		REPEAT = 0,
		CLAMP = 1,
		MIRROR_REPEAT = 2,
		MIRROR_CLAMP = 3,
	}

	public uint32 id;
	public int32 width;
	public int32 height;
	public int32 mipmaps;
	public int32 format;

	// Update GPU texture with new data 
	[CallingConvention(.Cdecl), LinkName("UpdateTexture"), NoShow]
	public static extern void Update(Texture2D texture, void* pixels);
	public void Update(void* pixels) { Update(this, pixels); }

	// Update GPU texture rectangle with new data 
	[CallingConvention(.Cdecl), LinkName("UpdateTextureRec"), NoShow]
	public static extern void Update(Texture2D texture, Rectangle rec, void* pixels);
	public void Update(Rectangle rec, void* pixels) { Update(this, rec, pixels); }

	// Generate GPU mipmaps for a texture 
	[CallingConvention(.Cdecl), LinkName("GenTextureMipmaps"), NoShow]
	public static extern void GenMipmaps(Texture2D * texture);
	public void GenMipmaps() mut { GenMipmaps(&this); }

	// Set texture scaling filter mode 
	[CallingConvention(.Cdecl), LinkName("SetTextureFilter"), NoShow]
	public static extern void SetFilter(Texture2D texture, Filter filter);
	public void SetFilter(Filter filter) { SetFilter(this, filter); }

	// Set texture wrapping mode 
	[CallingConvention(.Cdecl), LinkName("SetTextureWrap"), NoShow]
	public static extern void SetWrap(Texture2D texture, Wrap wrap);
	public void SetWrap(Wrap wrap) { SetWrap(this, wrap); }

	// Draw a Texture2D 
	[CallingConvention(.Cdecl), LinkName("DrawTexture"), NoShow]
	public static extern void Draw(Texture2D texture, int32 posX, int32 posY, Color tint);
	public void Draw(int32 posX, int32 posY, Color tint) { Draw(this, posX, posY, tint); }

	// Draw a Texture2D with position defined as Vector2 
	[CallingConvention(.Cdecl), LinkName("DrawTextureV"), NoShow]
	public static extern void Draw(Texture2D texture, Vector2 position, Color tint);
	public void Draw(Vector2 position, Color tint) { Draw(this, position, tint); }

	// Draw a Texture2D with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawTextureEx"), NoShow]
	public static extern void Draw(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
	public void Draw(Vector2 position, float rotation, float scale, Color tint)
	{
		Draw(this, position, rotation, scale, tint);
	}

	// Draw a part of a texture defined by a rectangle 
	[CallingConvention(.Cdecl), LinkName("DrawTextureRec"), NoShow]
	public static extern void Draw(Texture2D texture, Rectangle source, Vector2 position, Color tint);
	public void Draw(Rectangle source, Vector2 position, Color tint)
	{
		Draw(this, source, position, tint);
	}

	// Draw texture quad with tiling and offset parameters 
	[CallingConvention(.Cdecl), LinkName("DrawTextureQuad"), NoShow]
	public static extern void DrawQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
	public void DrawQuad(Vector2 tiling, Vector2 offset, Rectangle quad, Color tint)
	{
		DrawQuad(this, tiling, offset, quad, tint);
	}

	// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest. 
	[CallingConvention(.Cdecl), LinkName("DrawTextureTiled"), NoShow]
	public static extern void DrawTiled(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint);
	public void DrawTiled(Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint)
	{
		DrawTiled(this, source, dest, origin, rotation, scale, tint);
	}

	// Draw a part of a texture defined by a rectangle with 'pro' parameters 
	[CallingConvention(.Cdecl), LinkName("DrawTexturePro"), NoShow]
	public static extern void Draw(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);
	public void Draw(Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint)
	{
		Draw(this, source, dest, origin, rotation, tint);
	}

	// Draws a texture (or part of it) that stretches or shrinks nicely 
	[CallingConvention(.Cdecl), LinkName("DrawTextureNPatch"), NoShow]
	public static extern void DrawNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint);
	public void DrawNPatch(NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint)
	{
		DrawNPatch(this, nPatchInfo, dest, origin, rotation, tint);
	}

	// Draw a textured polygon 
	[CallingConvention(.Cdecl), LinkName("DrawTexturePoly"), NoShow]
	public static extern void DrawPoly(Texture2D texture, Vector2 center, Vector2 * points, Vector2 * texcoords, int32 pointCount, Color tint);
	public void DrawPoly(Vector2 center, Vector2 * points, Vector2 * texcoords, int32 pointCount, Color tint)
	{
		DrawPoly(this, center, points, texcoords, pointCount, tint);
	}

	// Set texture and rectangle to be used on shapes drawing 
	[CallingConvention(.Cdecl), LinkName("SetShapesTexture"), NoShow]
	public static extern void SetShapes(Texture2D texture, Rectangle source);
	public void SetShapes(Rectangle source) { SetShapes(this, source); }

	// Load texture from file into GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("LoadTexture")]
	public static extern Texture2D Load(char8* fileName);

	// Load texture from image data 
	[CallingConvention(.Cdecl), LinkName("LoadTextureFromImage")]
	public static extern Texture2D Load(Image image);

	// Unload texture from GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadTexture"), NoShow]
	public static extern void Unload(Texture2D texture);
	public void Unload() { Unload(this); }
}

// NPatchInfo, n-patch layout info 
[CRepr]
public struct NPatchInfo
{
	// N-patch layout 
	[AllowDuplicates]
	public enum Layout : int32
	{
		NINE_PATCH = 0,
		THREE_PATCH_VERTICAL = 1,
		THREE_PATCH_HORIZONTAL = 2,
	}

	public Rectangle source;
	public int32 left;
	public int32 top;
	public int32 right;
	public int32 bottom;
	public Layout layout;
}