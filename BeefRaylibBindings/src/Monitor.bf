using System;
using System.Collections;

namespace Raylib;

public struct Monitor
{
	private int32 id;

	private this(int32 id)
	{
		this.id = id;
	}

	public static List<Monitor> GetAll()
	{
		List<Monitor> ret = new .();
		for (int32 i in 0..<GetCount())
		{
			ret.Add(.(i));
		}
		return ret;
	}

	// Get number of connected monitors 
	[CallingConvention(.Cdecl), LinkName("GetMonitorCount"), NoShow]
	public static extern int32 GetCount();
	public static int32 Count
	{
		get
		{
			return GetCount();
		}
	}

	// Get current connected monitor 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetCurrentMonitor();
	public static Monitor GetCurrent()
	{
		return .(GetCurrentMonitor());
	}

	// Get specified monitor position 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPosition"), NoShow]
	public static extern Vector2 GetPosition(int32 monitor);
	public Vector2 Position
	{
		get
		{
			return GetPosition(id);
		}
	}

	// Get specified monitor width (current video mode used by monitor) 
	[CallingConvention(.Cdecl), LinkName("GetMonitorWidth"), NoShow]
	public static extern int32 GetWidth(int32 monitor);
	public int32 Width
	{
		get
		{
			return GetWidth(id);
		}
	}

	// Get specified monitor height (current video mode used by monitor) 
	[CallingConvention(.Cdecl), LinkName("GetMonitorHeight"), NoShow]
	public static extern int32 GetHeight(int32 monitor);
	public int32 Height
	{
		get
		{
			return GetHeight(id);
		}
	}

	// Get specified monitor physical width in millimetres 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPhysicalWidth"), NoShow]
	public static extern int32 GetPhysicalWidth(int32 monitor);
	public int32 PhysicalWidth
	{
		get
		{
			return GetPhysicalWidth(id);
		}
	}

	// Get specified monitor physical height in millimetres 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPhysicalHeight")]
	public static extern int32 GetPhysicalHeight(int32 monitor);
	public int32 PhysicalHeight
	{
		get
		{
			return GetPhysicalHeight(id);
		}
	}

	// Get specified monitor refresh rate 
	[CallingConvention(.Cdecl), LinkName("GetMonitorRefreshRate"), NoShow]
	public static extern int32 GetRefreshRate(int32 monitor);
	public int32 RefreshRate
	{
		get
		{
			return GetRefreshRate(id);
		}
	}

	// Get the human-readable, UTF-8 encoded name of the primary monitor 
	[CallingConvention(.Cdecl), LinkName("GetMonitorName"), NoShow]
	public static extern char8* GetName(int32 monitor);
	public char8* Name
	{
		get
		{
			return GetName(id);
		}
	}
}