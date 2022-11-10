using System;

namespace Raylib;

// Camera2D, defines position/orientation in 2d space 
[CRepr]
public struct Camera2D
{
	public this() { this = default; }

	public this(Vector2 target, Vector2 offset, float rotation, float zoom)
	{
		this.target = target;
		this.offset = offset;
		this.rotation = rotation;
		this.zoom = zoom;
	}

	public this(Vector2 target, float width, float height)
	{
		this.target = target;
		this.offset = .(width / 2.0f, height / 2.0f);
		this.zoom = 1.0f;
		this.rotation = 0.0f;
	}

	public Vector2 offset;
	public Vector2 target;
	public float rotation;
	public float zoom;

	// Begin 2D mode with custom camera (2D) 
	[CallingConvention(.Cdecl), LinkName("BeginMode2D"), NoShow]
	public static extern void BeginMode(Camera2D camera);
	public void Begin() { BeginMode(this); }

	// Ends 2D mode with custom camera 
	[CallingConvention(.Cdecl), LinkName("EndMode2D"), NoShow]
	public static extern void EndMode();
	public void End() { EndMode(); }

	// Get camera 2d transform matrix 
	[CallingConvention(.Cdecl), LinkName("GetCameraMatrix2D"), NoShow]
	public static extern Matrix GetMatrix(Camera2D camera);
	public Matrix GetMatrix() { return GetMatrix(this); }
}