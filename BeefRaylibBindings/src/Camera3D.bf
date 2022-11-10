using System;

namespace Raylib;

typealias Camera = Camera3D;

// Camera, defines position/orientation in 3d space 
[CRepr]
public struct Camera3D
{
	// Camera projection 
	[AllowDuplicates]
	public enum Projection : int32
	{
		PERSPECTIVE = 0,
		ORTHOGRAPHIC = 1,
	}

	public Vector3 position;
	public Vector3 target;
	public Vector3 up;
	public float fovy;
	public int32 projection;

	// Camera system modes 
	[AllowDuplicates]
	public enum Mode : int32
	{
		CUSTOM = 0,
		FREE = 1,
		ORBITAL = 2,
		FIRST_PERSON = 3,
		THIRD_PERSON = 4,
	}

	// Set camera mode (multiple camera modes available) 
	[CallingConvention(.Cdecl), LinkName("SetCameraMode")]
	public static extern void SetMode(Camera camera, int32 mode);

	// Update camera position for selected mode 
	[CallingConvention(.Cdecl), LinkName("UpdateCamera"), NoShow]
	public static extern void Update(Camera * camera);
	public void Update() mut { Update(&this); }

	// Set camera pan key to combine with mouse movement (free camera) 
	[CallingConvention(.Cdecl), LinkName("SetCameraPanControl")]
	public static extern void SetPanControl(KeyboardKey keyPan);

	// Set camera alt key to combine with mouse movement (free camera) 
	[CallingConvention(.Cdecl), LinkName("SetCameraAltControl")]
	public static extern void SetAltControl(KeyboardKey keyAlt);

	// Set camera smooth zoom key to combine with mouse (free camera) 
	[CallingConvention(.Cdecl), LinkName("SetCameraSmoothZoomControl")]
	public static extern void SetSmoothZoomControl(KeyboardKey keySmoothZoom);

	// Set camera move controls (1st person and 3rd person cameras) 
	[CallingConvention(.Cdecl), LinkName("SetCameraMoveControls")]
	public static extern void SetMoveControls(KeyboardKey keyFront, KeyboardKey keyBack, KeyboardKey keyRight, KeyboardKey keyLeft, KeyboardKey keyUp, KeyboardKey keyDown);

	// Begin 3D mode with custom camera (3D) 
	[CallingConvention(.Cdecl), LinkName("BeginMode3D"), NoShow]
	public static extern void BeginMode(Camera3D camera);
	public void Begin() { BeginMode(this); }

	// Ends 3D mode and returns to default 2D orthographic mode 
	[CallingConvention(.Cdecl), LinkName("EndMode3D"), NoShow]
	public static extern void EndMode();
	public void End() { EndMode(); }

	// Get camera transform matrix (view matrix) 
	[CallingConvention(.Cdecl), LinkName("GetCameraMatrix"), NoShow]
	public static extern Matrix GetMatrix(Camera camera);
	public Matrix GetMatrix() { return GetMatrix(this); }
}