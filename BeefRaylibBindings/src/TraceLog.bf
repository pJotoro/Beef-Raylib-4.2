using System;

namespace Raylib;

static class TraceLog
{
	// Trace log level 
	[AllowDuplicates]
	public enum Level : int32
	{
		ALL = 0,
		TRACE = 1,
		DEBUG = 2,
		INFO = 3,
		WARNING = 4,
		ERROR = 5,
		FATAL = 6,
		NONE = 7,
	}

	// Set the current threshold (minimum) log level 
	[CallingConvention(.Cdecl), LinkName("SetTraceLogLevel")]
	public static extern void SetLevel(Level logLevel);
}