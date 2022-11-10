using System;

namespace Raylib;

public static class Monitor
{
	// Get number of connected monitors 
	[CallingConvention(.Cdecl), LinkName("GetMonitorCount")]
	public static extern int32 GetCount();

	// Get current connected monitor 
	[CallingConvention(.Cdecl), LinkName("GetCurrentMonitor")]
	public static extern int32 GetCurrent();

	// Get specified monitor position 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPosition")]
	public static extern Vector2 GetPosition(int32 monitor);

	// Get specified monitor width (current video mode used by monitor) 
	[CallingConvention(.Cdecl), LinkName("GetMonitorWidth")]
	public static extern int32 GetWidth(int32 monitor);

	// Get specified monitor height (current video mode used by monitor) 
	[CallingConvention(.Cdecl), LinkName("GetMonitorHeight")]
	public static extern int32 GetHeight(int32 monitor);

	// Get specified monitor physical width in millimetres 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPhysicalWidth")]
	public static extern int32 GetPhysicalWidth(int32 monitor);

	// Get specified monitor physical height in millimetres 
	[CallingConvention(.Cdecl), LinkName("GetMonitorPhysicalHeight")]
	public static extern int32 GetPhysicalHeight(int32 monitor);

	// Get specified monitor refresh rate 
	[CallingConvention(.Cdecl), LinkName("GetMonitorRefreshRate")]
	public static extern int32 GetRefreshRate(int32 monitor);

	// Get the human-readable, UTF-8 encoded name of the primary monitor 
	[CallingConvention(.Cdecl), LinkName("GetMonitorName")]
	public static extern char8* GetName(int32 monitor);
}