using System;

namespace Raylib;

static
{
	// Compress data (DEFLATE algorithm), memory must be MemFree() 
	[CLink, CallingConvention(.Cdecl)]
	public static extern uint8* CompressData(uint8* data, int32 dataSize, int32 * compDataSize);

	// Decompress data (DEFLATE algorithm), memory must be MemFree() 
	[CLink, CallingConvention(.Cdecl)]
	public static extern uint8* DecompressData(uint8* compData, int32 compDataSize, int32 * dataSize);

	// Encode data to Base64 string, memory must be MemFree() 
	[CLink, CallingConvention(.Cdecl)]
	public static extern char8* EncodeDataBase64(uint8* data, int32 dataSize, int32 * outputSize);

	// Decode Base64 string data, memory must be MemFree() 
	[CLink, CallingConvention(.Cdecl)]
	public static extern uint8* DecodeDataBase64(uint8* data, int32 * outputSize);
}