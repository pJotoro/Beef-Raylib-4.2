// NOTE(pJotoro): This is all stuff that is commented out because it doesn't compile. I may or may not
// eventually add these.

using System;

namespace Raylib;

static
{
	// Set custom trace log 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetTraceLogCallback(TraceLogCallback callback);

	// Set custom file binary data loader 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetLoadFileDataCallback(LoadFileDataCallback callback);

	// Set custom file binary data saver 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetSaveFileDataCallback(SaveFileDataCallback callback);

	// Set custom file text data loader 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetLoadFileTextCallback(LoadFileTextCallback callback);

	// Set custom file text data saver 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetSaveFileTextCallback(SaveFileTextCallback callback);

	// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...) 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void TraceLog(int32 logLevel, char8* text, ... args);

	// Audio thread callback to request new data 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void SetAudioStreamCallback(AudioStream stream, AudioCallback callback);

	// 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor);

	// 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor);
}