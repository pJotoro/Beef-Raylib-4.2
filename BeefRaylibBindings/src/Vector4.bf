using System;

namespace Raylib;

// Vector4, 4 components 
[CRepr]
public struct Vector4
{
	public float x;
	public float y;
	public float z;
	public float w;

	public static Vector4 Zero
	{
		get
		{
			return .(0.0f, 0.0f, 0.0f, 0.0f);
		}	
	}

	public this(float x, float y, float z, float w)
	{
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
	}
}

typealias Quaternion = Vector4;