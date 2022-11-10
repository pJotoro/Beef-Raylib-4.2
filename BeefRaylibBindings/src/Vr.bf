using System;

namespace Raylib;

public static class Vr
{
	// VrDeviceInfo, Head-Mounted-Display device parameters 
	[CRepr]
	public struct DeviceInfo
	{
		public int32 hResolution;
		public int32 vResolution;
		public float hScreenSize;
		public float vScreenSize;
		public float vScreenCenter;
		public float eyeToScreenDistance;
		public float lensSeparationDistance;
		public float interpupillaryDistance;
		public float[4] lensDistortionValues;
		public float[4] chromaAbCorrection;
	}

	// VrStereoConfig, VR stereo rendering configuration for simulator 
	[CRepr]
	public struct StereoConfig
	{
		public Matrix[2] projection;
		public Matrix[2] viewOffset;
		public float[2] leftLensCenter;
		public float[2] rightLensCenter;
		public float[2] leftScreenCenter;
		public float[2] rightScreenCenter;
		public float[2] scale;
		public float[2] scaleIn;
	}

	// Begin stereo rendering (requires VR simulator) 
	[CallingConvention(.Cdecl), LinkName("BeginVrStereoMode")]
	public static extern void BeginStereoMode(StereoConfig config);

	// End stereo rendering (requires VR simulator) 
	[CallingConvention(.Cdecl), LinkName("EndVrStereoMode")]
	public static extern void EndStereoMode();

	// Load VR stereo config for VR simulator device parameters 
	[CallingConvention(.Cdecl), LinkName("LoadVrStereoConfig")]
	public static extern StereoConfig LoadStereoConfig(DeviceInfo device);

	// Unload VR stereo config 
	[CallingConvention(.Cdecl), LinkName("UnloadVrStereoConfig")]
	public static extern void UnloadStereoConfig(StereoConfig config);
}