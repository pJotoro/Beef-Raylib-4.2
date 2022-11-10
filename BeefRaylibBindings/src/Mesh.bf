using System;

namespace Raylib;

// Mesh, vertex data and vao/vbo 
[CRepr]
public struct Mesh
{
	public int32 vertexCount;
	public int32 triangleCount;
	public float* vertices;
	public float* texcoords;
	public float* texcoords2;
	public float* normals;
	public float* tangents;
	public char8* colors;
	public uint16* indices;
	public float* animVertices;
	public float* animNormals;
	public char8* boneIds;
	public float* boneWeights;
	public uint32 vaoId;
	public uint32* vboId;

	// Upload mesh vertex data in GPU and provide VAO/VBO ids 
	[CallingConvention(.Cdecl), LinkName("UploadMesh"), NoShow]
	public static extern void Upload(Mesh * mesh, bool dynamic);
	public void Upload(bool dynamic) mut { Upload(&this, dynamic); }

	// Update mesh vertex data in GPU for a specific buffer index 
	[CallingConvention(.Cdecl), LinkName("UpdateMeshBuffer"), NoShow]
	public static extern void UpdateBuffer(Mesh mesh, int32 index, void* data, int32 dataSize, int32 offset);
	public void UpdateBuffer(int32 index, void* data, int32 dataSize, int32 offset)
	{
		UpdateBuffer(this, index, data, dataSize, offset);
	}

	// Unload mesh data from CPU and GPU 
	[CallingConvention(.Cdecl), LinkName("UnloadMesh"), NoShow]
	public static extern void Unload(Mesh mesh);
	public void Unload() { Unload(this); }

	// Draw a 3d mesh with material and transform 
	[CallingConvention(.Cdecl), LinkName("DrawMesh"), NoShow]
	public static extern void Draw(Mesh mesh, Material material, Matrix transform);
	public void Draw(Material material, Matrix transform)
	{
		Draw(this, material, transform);
	}

	// Draw multiple mesh instances with material and different transforms 
	[CallingConvention(.Cdecl), LinkName("DrawMeshInstanced"), NoShow]
	public static extern void DrawInstanced(Mesh mesh, Material material, Matrix * transforms, int32 instances);
	public void DrawInstanced(Material material, Matrix * transforms, int32 instances)
	{
		DrawInstanced(this, material, transforms, instances);
	}

	// Export mesh data to file, returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportMesh"), NoShow]
	public static extern bool Export(Mesh mesh, char8* fileName);
	public bool Export(char8* fileName) => Export(this, fileName);

	// Compute mesh bounding box limits 
	[CallingConvention(.Cdecl), LinkName("GetMeshBoundingBox"), NoShow]
	public static extern BoundingBox GetBoundingBox(Mesh mesh);
	public BoundingBox GetBoundingBox() => GetBoundingBox(this);

	// Compute mesh tangents 
	[CallingConvention(.Cdecl), LinkName("GenMeshTangents"), NoShow]
	public static extern void GenTangents(Mesh * mesh);
	public void GenTangents() mut { GenTangents(&this); }

	// Generate polygonal mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshPoly")]
	public static extern Mesh GenPoly(int32 sides, float radius);

	// Generate plane mesh (with subdivisions) 
	[CallingConvention(.Cdecl), LinkName("GenMeshPlane")]
	public static extern Mesh GenPlane(float width, float length, int32 resX, int32 resZ);

	// Generate cuboid mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshCube")]
	public static extern Mesh GenCube(float width, float height, float length);

	// Generate sphere mesh (standard sphere) 
	[CallingConvention(.Cdecl), LinkName("GenMeshSphere")]
	public static extern Mesh GenSphere(float radius, int32 rings, int32 slices);

	// Generate half-sphere mesh (no bottom cap) 
	[CallingConvention(.Cdecl), LinkName("GenMeshHemisphere")]
	public static extern Mesh GenHemiSphere(float radius, int32 rings, int32 slices);

	// Generate cylinder mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshCylinder")]
	public static extern Mesh GenCylinder(float radius, float height, int32 slices);

	// Generate cone/pyramid mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshCone")]
	public static extern Mesh GenCone(float radius, float height, int32 slices);

	// Generate torus mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshTorus")]
	public static extern Mesh GenTorus(float radius, float size, int32 radSeg, int32 sides);

	// Generate trefoil knot mesh 
	[CallingConvention(.Cdecl), LinkName("GenMeshKnot")]
	public static extern Mesh GenKnot(float radius, float size, int32 radSeg, int32 sides);

	// Generate heightmap mesh from image data 
	[CLink, CallingConvention(.Cdecl), LinkName("GenMeshHeightmap")]
	public static extern Mesh GenHeightmap(Image heightmap, Vector3 size);

	// Generate cubes-based map mesh from image data 
	[CallingConvention(.Cdecl), LinkName("GenMeshCubicmap")]
	public static extern Mesh GenCubicmap(Image cubicmap, Vector3 cubeSize);
}