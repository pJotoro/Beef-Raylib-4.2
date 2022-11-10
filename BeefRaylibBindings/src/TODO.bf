// NOTE(pJotoro): This is all stuff that is either commented out because it doesn't compile, or it's
// stuff that works perfectly fine but I just don't know where to put it.

using System;

namespace Raylib;

static
{
	// Get current screen width 
	[CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetScreenWidth();

	// Get current screen height 
	[CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetScreenHeight();

	// Get current render width (it considers HiDPI) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetRenderWidth();

	// Get current render height (it considers HiDPI) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetRenderHeight();

	// Enable waiting for events on EndDrawing(), no automatic event polling 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void EnableEventWaiting();

	// Disable waiting for events on EndDrawing(), automatic events polling 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DisableEventWaiting();

	// Swap back buffer with front buffer (screen drawing) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void SwapScreenBuffer();

	// Register all input events 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void PollInputEvents();

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

	// Get a ray trace from mouse position 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Ray GetMouseRay(Vector2 mousePosition, Camera camera);

	// Get the screen space position for a 3d world space position 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreen(Vector3 position, Camera camera);

	// Get the world space position for a 2d camera screen space position 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);

	// Get size position for a 3d world space position 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int32 width, int32 height);

	// Get the screen space position for a 2d camera world space position 
	[CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);

	// Takes a screenshot of current screen (filename extension defines format) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void TakeScreenshot(char8* fileName);

	// Open URL with default system browser (if available) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void OpenURL(char8* url);

	// Wait for some time (halt program execution) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void WaitTime(double seconds);
}