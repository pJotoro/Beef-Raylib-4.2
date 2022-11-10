using System;

namespace Raylib;

typealias RenderTexture2D = RenderTexture;

// RenderTexture, fbo for texture rendering 
[CRepr]
public struct RenderTexture
{
	public uint32 id;
	public Texture texture;
	public Texture depth;

	// Begin drawing to render texture 
	[CallingConvention(.Cdecl), LinkName("BeginTextureMode"), NoShow]
	public static extern void BeginMode(RenderTexture2D target);
	public void Begin() { BeginMode(this); }

	// Ends drawing to render texture 
	[CallingConvention(.Cdecl), LinkName("EndTextureMode"), NoShow]
	public static extern void EndMode();
	public void End() { EndMode(); }

	// Load texture for rendering (framebuffer) 
	[CallingConvention(.Cdecl), LinkName("LoadRenderTexture")]
	public static extern RenderTexture2D Load(int32 width, int32 height);

	// Unload render texture from GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadRenderTexture"), NoShow]
	public static extern void Unload(RenderTexture2D target);
	public void Unload() { Unload(this); }
}