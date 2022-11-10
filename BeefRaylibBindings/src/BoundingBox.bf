using System;

namespace Raylib;

// BoundingBox 
[CRepr]
public struct BoundingBox
{
	public Vector3 min;
	public Vector3 max;

	// Draw bounding box (wires) 
	[CallingConvention(.Cdecl), LinkName("DrawBoundingBox"), NoShow]
	public static extern void Draw(BoundingBox box_, Color color);
	public void Draw(Color color)
	{
		Draw(this, color);
	}
}