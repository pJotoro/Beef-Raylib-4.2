using System;

namespace Raylib;

// Rectangle, 4 components 
[CRepr]
public struct Rectangle
{
	public float x;
	public float y;
	public float width;
	public float height;

	public this(float x, float y, float width, float height)
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	// Draw a color-filled rectangle 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleRec"), NoShow]
	public static extern void Draw(Rectangle rec, Color color);

	// Draw a color-filled rectangle with pro parameters 
	[CallingConvention(.Cdecl), LinkName("DrawRectanglePro"), NoShow]
	public static extern void Draw(Rectangle rec, Vector2 origin, float rotation, Color color);

	public void Draw(Color color)
	{
		Draw(this, color);
	}

	public void Draw(Vector2 origin, float rotation, Color color)
	{
		Draw(this, origin, rotation, color);
	}

	// Draw rectangle outline with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleLinesEx"), NoShow]
	public static extern void DrawLines(Rectangle rec, float lineThick, Color color);
	public void Draw(float lineThick, Color color)
	{
		DrawLines(this, lineThick, color);
	}

	// Draw rectangle with rounded edges 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleRounded"), NoShow]
	public static extern void DrawRounded(Rectangle rec, float roundness, int32 segments, Color color);
	public void DrawRounded(float roundness, int32 segments, Color color)
	{
		DrawRounded(this, roundness, segments, color);
	}

	// Draw rectangle with rounded edges outline 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleRoundedLines"), NoShow]
	public static extern void DrawRoundedLines(Rectangle rec, float roundness, int32 segments, float lineThick, Color color);
	public void DrawRoundedLines(float roundness, int32 segments, float lineThick, Color color)
	{
		DrawRoundedLines(this, roundness, segments, lineThick, color);
	}
}