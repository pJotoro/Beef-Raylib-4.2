using System;

namespace Raylib;

// Vector3, 3 components 
[CRepr]
struct Vector3
{
	public float x;
	public float y;
	public float z;

	public static Vector3 Zero
	{
		get
		{
			return .(0.0f, 0.0f, 0.0f);
		}
	}

	public this(float x, float y, float z)
	{
		this.x = x;
		this.y = y;
		this.z = z;
	}
}