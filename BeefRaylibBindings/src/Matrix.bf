using System;

namespace Raylib;

// Matrix, 4x4 components, column major, OpenGL style, right handed 
[CRepr]
public struct Matrix
{
	public float m0;
	public float m4;
	public float m8;
	public float m12;
	public float m1;
	public float m5;
	public float m9;
	public float m13;
	public float m2;
	public float m6;
	public float m10;
	public float m14;
	public float m3;
	public float m7;
	public float m11;
	public float m15;

	public this()
	{
		this = default;
	}

	public this(float m0, float m1, float m2, float m3, float m4, float m5, float m6, float m7, float m8, float m9,
		float m10, float m11, float m12, float m13, float m14, float m15)
	{
		this.m0 = m0;
		this.m1 = m1;
		this.m2 = m2;
		this.m3 = m3;
		this.m4 = m4;
		this.m5 = m5;
		this.m6 = m6;
		this.m7 = m7;
		this.m8 = m8;
		this.m9 = m9;
		this.m10 = m10;
		this.m11 = m11;
		this.m12 = m12;
		this.m13 = m13;
		this.m14 = m14;
		this.m15 = m15;
	}

	public float this[int x, int y]
	{
		get
		{
			if (y == 0)
			{
				if (x == 0) return m0;
				else if (x == 1) return m1;
				else if (x == 2) return m2;
				else if (x == 3) return m3;
			}
			else if (y == 1)
			{
				if (x == 0) return m4;
				else if (x == 1) return m5;
				else if (x == 2) return m6;
				else if (x == 3) return m7;
			}
			else if (y == 2)
			{
				if (x == 0) return m8;
				else if (x == 1) return m9;
				else if (x == 2) return m10;
				else if (x == 3) return m11;
			}
			else if (y == 3)
			{
				if (x == 0) return m12;
				else if (x == 1) return m13;
				else if (x == 2) return m14;
				else if (x == 3) return m15;
			}

			return 0.0f;
		}
		
		set mut
		{
			if (y == 0)
			{
				if (x == 0) m0 = value;
				else if (x == 1) m1 = value;
				else if (x == 2) m2 = value;
				else if (x == 3) m3 = value;
			}
			else if (y == 1)
			{
				if (x == 0) m4 = value;
				else if (x == 1) m5 = value;
				else if (x == 2) m6 = value;
				else if (x == 3) m7 = value;
			}
			else if (y == 2)
			{
				if (x == 0) m8 = value;
				else if (x == 1) m9 = value;
				else if (x == 2) m10 = value;
				else if (x == 3) m11 = value;
			}
			else if (y == 3)
			{
				if (x == 0) m12 = value;
				else if (x == 1) m13 = value;
				else if (x == 2) m14 = value;
				else if (x == 3) m15 = value;
			}
		}
	}
}