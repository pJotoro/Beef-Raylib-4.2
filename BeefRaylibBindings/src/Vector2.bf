using System;
using System.Numerics;

namespace Raylib;

// Vector2, 2 components 
[CRepr]
struct Vector2
{
	float2 mData;

	public float x
	{
		get
		{
			return mData.x;
		}
		set mut
		{
			mData.x = value;
		}
	}

	public float y
	{
		get
		{
			return mData.y;
		}
		set mut
		{
			mData.y = value;
		}
	}

	public static Vector2 Zero
	{
		get
		{
			return .(0.0f, 0.0f);
		}
	}

	public this(float x, float y)
	{
		mData.x = x;
		mData.y = y;
	}

	public this(float2 f)
	{
		mData = f;
	}

	[Commutable]
	public static Vector2 operator+(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData + v2.mData);
	}

	public void operator+=(Vector2 v) mut
	{
		mData = mData + v.mData;
	}

	public static Vector2 operator-(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData - v2.mData);
	}

	public void operator-=(Vector2 v) mut
	{
		mData = mData - v.mData;
	}

	public static Vector2 operator*(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData * v2.mData);
	}

	public void operator*=(Vector2 v) mut
	{
		mData = mData * v.mData;
	}

	public static Vector2 operator/(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData / v2.mData);
	}

	public void operator/=(Vector2 v) mut
	{
		mData = mData / v.mData;
	}

	public float Length
	{
		get
		{
			return Math.Sqrt((x*x) + (y*y));
		}
	}

	[Commutable]
	public static Vector2 operator*(Vector2 v, float s)
	{
		return .(v.x * s, v.y * s);
	}

	public void operator*=(float s) mut
	{
		mData = mData * s;
	}
}