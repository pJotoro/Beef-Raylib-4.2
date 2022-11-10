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
	public static extern void DrawPro(Rectangle rec, Vector2 origin, float rotation, Color color);

	public void Draw(Color color)
	{
		Draw(this, color);
	}

	public void Draw(Vector2 origin, float rotation, Color color)
	{
		DrawPro(this, origin, rotation, color);
	}
}