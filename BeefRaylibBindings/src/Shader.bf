using System;

namespace Raylib;

// Shader 
[CRepr]
public struct Shader
{
	// Shader location index 
	[AllowDuplicates]
	public enum LocationIndex : int32
	{
		VERTEX_POSITION = 0,
		VERTEX_TEXCOORD01 = 1,
		VERTEX_TEXCOORD02 = 2,
		VERTEX_NORMAL = 3,
		VERTEX_TANGENT = 4,
		VERTEX_COLOR = 5,
		MATRIX_MVP = 6,
		MATRIX_VIEW = 7,
		MATRIX_PROJECTION = 8,
		MATRIX_MODEL = 9,
		MATRIX_NORMAL = 10,
		VECTOR_VIEW = 11,
		COLOR_DIFFUSE = 12,
		COLOR_SPECULAR = 13,
		COLOR_AMBIENT = 14,
		MAP_ALBEDO = 15,
		MAP_METALNESS = 16,
		MAP_NORMAL = 17,
		MAP_ROUGHNESS = 18,
		MAP_OCCLUSION = 19,
		MAP_EMISSION = 20,
		MAP_HEIGHT = 21,
		MAP_CUBEMAP = 22,
		MAP_IRRADIANCE = 23,
		MAP_PREFILTER = 24,
		MAP_BRDF = 25,
	}

	// Shader uniform data type 
	[AllowDuplicates]
	public enum UniformDataType : int32
	{
		FLOAT = 0,
		VEC2 = 1,
		VEC3 = 2,
		VEC4 = 3,
		INT = 4,
		IVEC2 = 5,
		IVEC3 = 6,
		IVEC4 = 7,
		SAMPLER2D = 8,
	}

	// Shader attribute data types 
	[AllowDuplicates]
	public enum AttributeDataType : int32
	{
		FLOAT = 0,
		VEC2 = 1,
		VEC3 = 2,
		VEC4 = 3,
	}

	public uint32 id;
	public int32* locs;

	// Load shader from files and bind default locations 
	[CallingConvention(.Cdecl), LinkName("LoadShader")]
	public static extern Shader Load(char8* vsFileName, char8* fsFileName);

	// Load shader from code strings and bind default locations 
	[CallingConvention(.Cdecl), LinkName("LoadShaderFromMemory")]
	public static extern Shader LoadFromMemory(char8* vsCode, char8* fsCode);

	// Get shader uniform location 
	[CallingConvention(.Cdecl), LinkName("GetShaderLocation"), NoShow]
	public static extern int32 GetLocation(Shader shader, char8* uniformName);
	public int32 GetLocation(char8* uniformName) { return GetLocation(this, uniformName); }

	// Get shader attribute location 
	[CallingConvention(.Cdecl), LinkName("GetShaderLocationAttrib"), NoShow]
	public static extern int32 GetLocationAttrib(Shader shader, char8* attribName);
	public int32 GetLocationAttrib(char8* attribName) { return GetLocationAttrib(this, attribName); }

	// Set shader uniform value 
	[CallingConvention(.Cdecl), LinkName("SetShaderValue"), NoShow]
	public static extern void SetValue(Shader shader, int32 locIndex, void* value, int32 uniformType);
	public void SetValue(int32 locIndex, void* value, int32 uniformType) { SetValue(this, locIndex, value, uniformType); }

	// Set shader uniform value vector 
	[CallingConvention(.Cdecl), LinkName("SetShaderValueV"), NoShow]
	public static extern void SetValue(Shader shader, int32 locIndex, void* value, int32 uniformType, int32 count);
	public void SetValue(int32 locIndex, void* value, int32 uniformType, int32 count) { SetValue(this, locIndex, value, uniformType, count); }

	// Set shader uniform value (matrix 4x4) 
	[CallingConvention(.Cdecl), LinkName("SetShaderValueMatrix"), NoShow]
	public static extern void SetValue(Shader shader, int32 locIndex, Matrix mat);
	public void SetValue(int32 locIndex, Matrix mat)
	{
		SetValue(this, locIndex, mat);
	}

	// Set shader uniform value for texture (sampler2d) 
	[CallingConvention(.Cdecl), LinkName("SetShaderValueTexture"), NoShow]
	public static extern void SetValue(Shader shader, int32 locIndex, Texture2D texture);
	public void SetValue(int32 locIndex, Texture2D texture)
	{
		SetValue(this, locIndex, texture);
	}

	// Unload shader from GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadShader")]
	public static extern void Unload(Shader shader);

	// Begin custom shader drawing 
	[CallingConvention(.Cdecl), LinkName("BeginShaderMode"), NoShow]
	public static extern void BeginMode(Shader shader);
	public void Begin() { BeginMode(this); }

	// End custom shader drawing (use default shader) 
	[CallingConvention(.Cdecl), LinkName("EndShaderMode"), NoShow]
	public static extern void EndMode();
	public void End() { EndMode(); }
}