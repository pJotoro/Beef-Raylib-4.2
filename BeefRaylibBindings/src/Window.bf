using System;

namespace Raylib;

public static class Window
{
	public static class Config
	{
		// System/Window config flags 
		[AllowDuplicates]
		public enum Flags : uint32
		{
			VSYNC_HINT = 64,
			FULLSCREEN_MODE = 2,
			WINDOW_RESIZABLE = 4,
			WINDOW_UNDECORATED = 8,
			WINDOW_HIDDEN = 128,
			WINDOW_MINIMIZED = 512,
			WINDOW_MAXIMIZED = 1024,
			WINDOW_UNFOCUSED = 2048,
			WINDOW_TOPMOST = 4096,
			WINDOW_ALWAYS_RUN = 256,
			WINDOW_TRANSPARENT = 16,
			WINDOW_HIGHDPI = 8192,
			WINDOW_MOUSE_PASSTHROUGH = 16384,
			MSAA_4X_HINT = 32,
			INTERLACED_HINT = 65536,
		}

		// Setup init configuration flags (view FLAGS) 
		[CallingConvention(.Cdecl), LinkName("SetConfigFlags")]
		public static extern void Set(Flags flags);
	}

	// Initialize window and OpenGL context 
	[CallingConvention(.Cdecl), LinkName("InitWindow")]
	public static extern void Init(int32 width, int32 height, char8* title);

	// Check if KEY_ESCAPE pressed or Close icon pressed 
	[CallingConvention(.Cdecl), LinkName("WindowShouldClose")]
	public static extern bool ShouldClose();

	// Close window and unload OpenGL context 
	[CallingConvention(.Cdecl), LinkName("CloseWindow")]
	public static extern void Close();

	// Check if window has been initialized successfully 
	[CallingConvention(.Cdecl), LinkName("IsWindowReady")]
	public static extern bool IsReady();

	// Check if window is currently fullscreen 
	[CallingConvention(.Cdecl), LinkName("IsWindowFullscreen")]
	public static extern bool IsFullscreen();

	// Check if window is currently hidden (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("IsWindowHidden")]
	public static extern bool IsHidden();

	// Check if window is currently minimized (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("IsWindowMinimized")]
	public static extern bool IsMinimized();

	// Check if window is currently maximized (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("IsWindowMaximized")]
	public static extern bool IsMaximized();

	// Check if window is currently focused (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("IsWindowFocused")]
	public static extern bool IsFocused();

	// Check if window has been resized last frame 
	[CallingConvention(.Cdecl), LinkName("IsWindowResized")]
	public static extern bool IsResized();

	// Check if one specific window flag is enabled 
	[CallingConvention(.Cdecl), LinkName("IsWindowState")]
	public static extern bool IsState(Config.Flags flag);

	// Set window configuration state using flags (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("SetWindowState")]
	public static extern void SetState(Config.Flags flags);

	// Clear window configuration state flags 
	[CallingConvention(.Cdecl), LinkName("ClearWindowState")]
	public static extern void ClearState(Config.Flags flags);

	// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void ToggleFullscreen();

	// Set window state: maximized, if resizable (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("MaximizeWindow")]
	public static extern void Maximize();

	// Set window state: minimized, if resizable (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("MinimizeWindow")]
	public static extern void Minimize();

	// Set window state: not minimized/maximized (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("RestoreWindow")]
	public static extern void Restore();

	// Set icon for window (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("SetWindowIcon")]
	public static extern void SetIcon(Image image);

	// Set title for window (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("SetWindowTitle")]
	public static extern void SetTitle(char8* title);

	// Set window position on screen (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("SetWindowPosition")]
	public static extern void SetPosition(int32 x, int32 y);

	// Set monitor for the current window (fullscreen mode) 
	[CallingConvention(.Cdecl), LinkName("SetWindowMonitor")]
	public static extern void SetMonitor(int32 monitor);

	// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) 
	[CallingConvention(.Cdecl), LinkName("SetWindowMinSize")]
	public static extern void SetMinSize(int32 width, int32 height);

	// Set window dimensions 
	[CallingConvention(.Cdecl), LinkName("SetWindowSize")]
	public static extern void SetSize(int32 width, int32 height);

	// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP) 
	[CallingConvention(.Cdecl), LinkName("SetWindowOpacity")]
	public static extern void SetOpacity(float opacity);

	// Get native window handle 
	[CallingConvention(.Cdecl), LinkName("GetWindowHandle")]
	public static extern void* GetHandle();

	// Get window position XY on monitor 
	[CallingConvention(.Cdecl), LinkName("GetWindowPosition")]
	public static extern Vector2 GetPosition();

	// Get window scale DPI factor 
	[CallingConvention(.Cdecl), LinkName("GetWindowScaleDPI")]
	public static extern Vector2 GetScaleDPI();
}