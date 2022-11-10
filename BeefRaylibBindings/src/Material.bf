using System;

namespace Raylib;

// Material, includes shader and maps 
[CRepr]
public struct Material
{
	// Material map index 
	[AllowDuplicates]
	public enum MapIndex : int32
	{
		ALBEDO = 0,
		METALNESS = 1,
		NORMAL = 2,
		ROUGHNESS = 3,
		OCCLUSION = 4,
		EMISSION = 5,
		HEIGHT = 6,
		CUBEMAP = 7,
		IRRADIANCE = 8,
		PREFILTER = 9,
		BRDF = 10,
	}

	// MaterialMap 
	[CRepr]
	public struct Map
	{
		public Texture2D texture;
		public Color color;
		public float value;
	}

	public Shader shader;
	public Map* maps;
	public float[4] params_;

	// Load materials from model file 
	[CallingConvention(.Cdecl), LinkName("LoadMaterials")]
	public static extern Material* Load(char8* fileName, int32 * materialCount);

	// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) 
	[CallingConvention(.Cdecl), LinkName("LoadMaterialDefault"), NoShow]
	public static extern Material LoadDefault();
	public static Material Default { get { return LoadDefault(); } }

	// Unload material from GPU memory (VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadMaterial"), NoShow]
	public static extern void Unload(Material material);
	public void Unload() { Unload(this); }

	// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...) 
	[CallingConvention(.Cdecl), LinkName("SetMaterialTexture"), NoShow]
	public static extern void SetTexture(Material * material, int32 mapType, Texture2D texture);
	public void SetTexture(int32 mapType, Texture2D texture) mut
	{
		SetTexture(&this, mapType, texture);
	}
}