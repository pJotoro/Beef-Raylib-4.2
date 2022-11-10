using System;

namespace Raylib;

static class Pixel
{
	// Pixel formats 
	[AllowDuplicates]
	public enum Format : int32
	{
		UNCOMPRESSED_GRAYSCALE = 1,
		UNCOMPRESSED_GRAY_ALPHA = 2,
		UNCOMPRESSED_R5G6B5 = 3,
		UNCOMPRESSED_R8G8B8 = 4,
		UNCOMPRESSED_R5G5B5A1 = 5,
		UNCOMPRESSED_R4G4B4A4 = 6,
		UNCOMPRESSED_R8G8B8A8 = 7,
		UNCOMPRESSED_R32 = 8,
		UNCOMPRESSED_R32G32B32 = 9,
		UNCOMPRESSED_R32G32B32A32 = 10,
		COMPRESSED_DXT1_RGB = 11,
		COMPRESSED_DXT1_RGBA = 12,
		COMPRESSED_DXT3_RGBA = 13,
		COMPRESSED_DXT5_RGBA = 14,
		COMPRESSED_ETC1_RGB = 15,
		COMPRESSED_ETC2_RGB = 16,
		COMPRESSED_ETC2_EAC_RGBA = 17,
		COMPRESSED_PVRT_RGB = 18,
		COMPRESSED_PVRT_RGBA = 19,
		COMPRESSED_ASTC_4x4_RGBA = 20,
		COMPRESSED_ASTC_8x8_RGBA = 21,
	}

	// Get Color from a source pixel pointer of certain format 
	[CallingConvention(.Cdecl), LinkName("GetPixelColor")]
	public static extern Color GetColor(void * srcPtr, Format format);

	// Set color formatted into destination pixel pointer 
	[CallingConvention(.Cdecl), LinkName("SetPixelColor")]
	public static extern void SetColor(void * dstPtr, Color color, Format format);

	// Get pixel data size in bytes for certain format 
	[CallingConvention(.Cdecl), LinkName("GetPixelDataSize")]
	public static extern int32 GetDataSize(int32 width, int32 height, Format format);
}