using System;

namespace Raylib;

// Model, meshes, materials and animation data 
[CRepr]
public struct Model
{
	public Matrix transform;
	public int32 meshCount;
	public int32 materialCount;
	public Mesh* meshes;
	public Material* materials;
	public int32* meshMaterial;
	public int32 boneCount;
	public BoneInfo* bones;
	public Transform* bindPose;

	// Set material for a mesh 
	[CallingConvention(.Cdecl), LinkName("SetModelMeshMaterial"), NoShow]
	public static extern void SetMeshMaterial(Model * model, int32 meshId, int32 materialId);
	public void SetMeshMaterial(int32 meshId, int32 materialId) mut { SetMeshMaterial(&this, meshId, materialId); }

	// Update model animation pose 
	[CallingConvention(.Cdecl), LinkName("UpdateModelAnimation"), NoShow]
	public static extern void UpdateAnimation(Model model, Animation anim, int32 frame);
	public void UpdateAnimation(Animation anim, int32 frame) { UpdateAnimation(this, anim, frame); }

	// Check model animation skeleton match 
	[CallingConvention(.Cdecl), LinkName("IsModelAnimationValid"), NoShow]
	public static extern bool IsAnimationValid(Model model, Animation anim);
	public bool IsAnimationValid(Animation anim) { return IsAnimationValid(this, anim); }

	// ModelAnimation 
	[CRepr]
	public struct Animation
	{
		public int32 boneCount;
		public int32 frameCount;
		public BoneInfo* bones;
		public Transform** framePoses;

		// Load model animations from file 
		[CallingConvention(.Cdecl), LinkName("LoadModelAnimations")]
		public static extern Animation* LoadMultiple(char8* fileName, uint32 * animCount);

		// Unload animation data 
		[CallingConvention(.Cdecl), LinkName("UnloadModelAnimation"), NoShow]
		public static extern void Unload(Animation anim);
		public void Unload() { Unload(this); }

		// Unload animation array data 
		[CallingConvention(.Cdecl), LinkName("UnloadModelAnimations")]
		public static extern void UnloadMultiple(Animation * animations, uint32 count);
	}

	// Load model from files (meshes and materials) 
	[CallingConvention(.Cdecl), LinkName("LoadModel")]
	public static extern Model Load(char8* fileName);

	// Load model from generated mesh (default material) 
	[CallingConvention(.Cdecl), LinkName("LoadModelFromMesh")]
	public static extern Model Load(Mesh mesh);

	// Unload model (including meshes) from memory (RAM and/or VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadModel"), NoShow]
	public static extern void Unload(Model model);
	public void Unload() { Unload(this); }

	// Unload model (but not meshes) from memory (RAM and/or VRAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadModelKeepMeshes"), NoShow]
	public static extern void UnloadKeepMeshes(Model model);
	public void UnloadKeepMeshes() { UnloadKeepMeshes(this); }

	// Compute model bounding box limits (considers all meshes) 
	[CallingConvention(.Cdecl), LinkName("GetModelBoundingBox"), NoShow]
	public static extern BoundingBox GetBoundingBox(Model model);
	public BoundingBox GetBoundingBox() { return GetBoundingBox(this); }

	// Draw a model (with texture if set) 
	[CallingConvention(.Cdecl), LinkName("DrawModel"), NoShow]
	public static extern void Draw(Model model, Vector3 position, float scale, Color tint);
	public void Draw(Vector3 position, float scale, Color tint)
	{
		Draw(this, position, scale, tint);
	}

	// Draw a model with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawModelEx"), NoShow]
	public static extern void Draw(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
	public void Draw(Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
	{
		Draw(this, position, rotationAxis, rotationAngle, scale, tint);
	}

	// Draw a model wires (with texture if set) 
	[CallingConvention(.Cdecl), LinkName("DrawModelWires"), NoShow]
	public static extern void DrawWires(Model model, Vector3 position, float scale, Color tint);
	public void DrawWires(Vector3 position, float scale, Color tint)
	{
		DrawWires(this, position, scale, tint);
	}

	// Draw a model wires (with texture if set) with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawModelWiresEx"), NoShow]
	public static extern void DrawWires(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
	public void DrawWires(Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
	{
		DrawWires(this, position, rotationAxis, rotationAngle, scale, tint);
	}
}

// Bone, skeletal animation bone 
[CRepr]
public struct BoneInfo
{
	public char8[32] name;
	public int32 parent;
}

// Transform, vectex transformation data 
[CRepr]
public struct Transform
{
	public Vector3 translation;
	public Quaternion rotation;
	public Vector3 scale;
}