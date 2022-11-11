using System;

namespace Raylib;

static
{
	public const float EPSILON = 0.000001f;

	// Normalize input value within input range
	[Inline]
	public static float Normalize(float value, float start, float end)
	{
		float result = (value - start)/(end - start);

		return result;
	}

	// Remap input value within input range to output range
	[Inline]
	public static float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
	{
	    float result = (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;

	    return result;
	}

	// Wrap input value from min to max
	[Inline]
	public static float Wrap(float value, float min, float max)
	{
	    float result = value - (max - min)*Math.Floor((value - min)/(max - min));
		
	    return result;
	}
}

namespace System
{
	extension Float
	{
		// Check whether two given floats are almost equal
		public static bool AlmostEqual(float x, float y)
		{
			bool result = (Math.Abs(x - y)) <= (Raylib.EPSILON*Math.Max(1.0f, Math.Max(Math.Abs(x), Math.Abs(y))));

			return result;
		}
	}
}