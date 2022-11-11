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
		[Inline]
		get
		{
			return mData.x;
		}
		[Inline]
		set mut
		{
			mData.x = value;
		}
	}

	public float y
	{
		[Inline]
		get
		{
			return mData.y;
		}
		[Inline]
		set mut
		{
			mData.y = value;
		}
	}

	public static Vector2 Zero
	{
		[Inline]
		get
		{
			return .(0.0f, 0.0f);
		}
	}

	public static Vector2 One
	{
		[Inline]
		get
		{
			return .(1.0f, 1.0f);
		}
	}

	[Inline]
	public this(float x, float y)
	{
		mData.x = x;
		mData.y = y;
	}

	[Inline]
	public this(float2 f)
	{
		mData = f;
	}

	[Inline, Commutable]
	public static Vector2 operator+(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData + v2.mData);
	}

	[Inline]
	public void operator+=(Vector2 v) mut
	{
		mData += v.mData;
	}

	[Inline]
	public static Vector2 operator-(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData - v2.mData);
	}

	[Inline]
	public void operator-=(Vector2 v) mut
	{
		mData -= v.mData;
	}

	[Inline]
	public static Vector2 operator*(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData * v2.mData);
	}

	[Inline]
	public void operator*=(Vector2 v) mut
	{
		mData *= v.mData;
	}

	[Inline]
	public static Vector2 operator/(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData / v2.mData);
	}

	[Inline]
	public void operator/=(Vector2 v) mut
	{
		mData /= v.mData;
	}

	public float Length
	{
		[Inline]
		get
		{
			return Math.Sqrt((x*x) + (y*y));
		}
	}

	[Inline]
	public static float LengthSqr(Vector2 v)
	{
		float result = (v.x*v.x) + (v.y*v.y);

		return result;
	}

	[Inline, Commutable]
	public static Vector2 operator+(Vector2 v, float s)
	{
		return .(v.mData + s);
	}

	[Inline]
	public void operator+=(float s) mut
	{
		mData += s;
	}

	[Inline]
	public static Vector2 operator-(Vector2 v, float s)
	{
		return .(v.mData - s);
	}

	[Inline]
	public void operator-=(float s) mut
	{
		mData -= s;
	}

	[Inline, Commutable]
	public static Vector2 operator*(Vector2 v, float s)
	{
		return .(v.mData * s);
	}

	[Inline]
	public void operator*=(float s) mut
	{
		mData *= s;
	}

	[Inline]
	public static Vector2 operator/(Vector2 v, float s)
	{
		return .(v.mData / s);
	}

	[Inline]
	public void operator/=(float s) mut
	{
		mData /= s;
	}

	[Inline]
	public static float DotProduct(Vector2 v1, Vector2 v2)
	{
		float result = (v1.x*v2.x + v1.y*v2.y);

		return result;
	}

	[Inline]
	public static float Distance(Vector2 v1, Vector2 v2)
	{
		float result = Math.Sqrt((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

		return result;
	}

	[Inline]
	public static float DistanceSqr(Vector2 v1, Vector2 v2)
	{
	    float result = ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y));

	    return result;
	}

	[Inline]
	public static float Angle(Vector2 v1, Vector2 v2)
	{
	    float result = Math.Atan2(v2.y, v2.x) - Math.Atan2(v1.y, v1.x);

	    return result;
	}

	[Inline]
	public static Vector2 Negate(Vector2 v)
	{
		Vector2 result = .(-v.x, -v.y);

		return result;
	}

	[Inline]
	public static Vector2 Normalize(Vector2 v)
	{
	    Vector2 result = Vector2.Zero;
	    float length = Math.Sqrt((v.x*v.x) + (v.y*v.y));

	    if (length > 0)
	    {
	        float ilength = 1.0f/length;
	        result.x = v.x*ilength;
	        result.y = v.y*ilength;
	    }

	    return result;
	}

	[Inline]
	public static Vector2 Transform(Vector2 v, Matrix mat)
	{
	    Vector2 result = Vector2.Zero;

	    float x = v.x;
	    float y = v.y;
	    float z = 0;

	    result.x = mat.m0*x + mat.m4*y + mat.m8*z + mat.m12;
	    result.y = mat.m1*x + mat.m5*y + mat.m9*z + mat.m13;

	    return result;
	}

	[Inline]
	public static Vector2 Lerp(Vector2 v1, Vector2 v2, float amount)
	{
		Vector2 result = Vector2.Zero;

		result.x = v1.x + amount*(v2.x - v1.x);
		result.y = v1.y + amount*(v2.y - v1.y);

		return result;
	}

	[Inline]
	public static Vector2 Reflect(Vector2 v, Vector2 normal)
	{
	    Vector2 result = Vector2.Zero;

	    float dotProduct = (v.x*normal.x + v.y*normal.y); // Dot product

	    result.x = v.x - (2.0f*normal.x)*dotProduct;
	    result.y = v.y - (2.0f*normal.y)*dotProduct;

	    return result;
	}

	[Inline]
	public static Vector2 Rotate(Vector2 v, float angle)
	{
	    Vector2 result = Vector2.Zero;

	    float cosres = Math.Cos(angle);
	    float sinres = Math.Sin(angle);

	    result.x = v.x*cosres - v.y*sinres;
	    result.y = v.x*sinres + v.y*cosres;

	    return result;
	}

	[Inline]
	public static Vector2 MoveTowards(Vector2 v, Vector2 target, float maxDistance)
	{
	    Vector2 result = Vector2.Zero;

	    float dx = target.x - v.x;
	    float dy = target.y - v.y;
	    float value = (dx*dx) + (dy*dy);

	    if ((value == 0) || ((maxDistance >= 0) && (value <= maxDistance*maxDistance))) return target;

	    float dist = Math.Sqrt(value);

	    result.x = v.x + dx/dist*maxDistance;
	    result.y = v.y + dy/dist*maxDistance;

	    return result;
	}

	[Inline]
	public static Vector2 Invert(Vector2 v)
	{
	    Vector2 result = .(1.0f/v.x, 1.0f/v.y);

	    return result;
	}

	[Inline]
	public static Vector2 Clamp(Vector2 v, Vector2 min, Vector2 max)
	{
	    Vector2 result = Vector2.Zero;

	    result.x = Math.Min(max.x, Math.Max(min.x, v.x));
	    result.y = Math.Min(max.y, Math.Max(min.y, v.y));

	    return result;
	}

	[Inline]
	public static Vector2 ClampValue(Vector2 v, float min, float max)
	{
	    Vector2 result = v;

	    float length = (v.x*v.x) + (v.y*v.y);
	    if (length > 0.0f)
	    {
	        length = Math.Sqrt(length);

	        if (length < min)
	        {
	            float scale = min/length;
	            result.x = v.x*scale;
	            result.y = v.y*scale;
	        }
	        else if (length > max)
	        {
	            float scale = max/length;
	            result.x = v.x*scale;
	            result.y = v.y*scale;
	        }
	    }

	    return result;
	}

	// mostly equal
	[Inline]
	public static bool operator==(Vector2 p, Vector2 q)
	{
		bool result = ((Math.Abs(p.x - q.x)) <= (EPSILON*Math.Max(1.0f, Math.Max(Math.Abs(p.x), Math.Abs(q.x))))) &&
		              ((Math.Abs(p.y - q.y)) <= (EPSILON*Math.Max(1.0f, Math.Max(Math.Abs(p.y), Math.Abs(q.y)))));

		return result;
	}

	[Inline]
	public static bool StrictEqual(Vector2 v1, Vector2 v2)
	{
		return v1.x == v2.x && v1.y == v2.y;
	}

	[Inline]
	public static Vector2 operator%(Vector2 v1, Vector2 v2)
	{
		return .(v1.mData % v2.mData);
	}
}