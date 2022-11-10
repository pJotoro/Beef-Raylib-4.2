using System;

namespace Raylib;

// Ray, ray for raycasting 
[CRepr]
public struct Ray
{
	public Vector3 position;
	public Vector3 direction;

	// RayCollision, ray hit information 
	[CRepr]
	public struct Collision
	{
		public bool hit;
		public float distance;
		public Vector3 point;
		public Vector3 normal;
	}

	// Draw a ray line 
	[CallingConvention(.Cdecl), LinkName("DrawRay"), NoShow]
	public static extern void Draw(Ray ray, Color color);
	public void Draw(Color color) { Draw(this, color); }

	// Get collision info between ray and sphere 
	[CallingConvention(.Cdecl), LinkName("GetRayCollisionSphere"), NoShow]
	public static extern Collision GetCollisionSphere(Ray ray, Vector3 center, float radius);
	public Collision GetCollisionSphere(Vector3 center, float radius)
	{
		return GetCollisionSphere(this, center, radius);
	}

	// Get collision info between ray and box 
	[CallingConvention(.Cdecl), LinkName("GetRayCollisionBox"), NoShow]
	public static extern Collision GetCollisionBox(Ray ray, BoundingBox box_);
	public Collision GetCollisionBox(BoundingBox box_)
	{
		return GetCollisionBox(this, box_);
	}

	// Get collision info between ray and mesh 
	[CallingConvention(.Cdecl), LinkName("GetRayCollisionMesh"), NoShow]
	public static extern Collision GetCollisionMesh(Ray ray, Mesh mesh, Matrix transform);
	public Collision GetCollisionMesh(Mesh mesh, Matrix transform)
	{
		return GetCollisionMesh(this, mesh, transform);
	}

	// Get collision info between ray and triangle 
	[CallingConvention(.Cdecl), LinkName("GetRayCollisionTriangle"), NoShow]
	public static extern Collision GetCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
	public Collision GetCollisionTriangle(Vector3 p1, Vector3 p2, Vector3 p3)
	{
		return GetCollisionTriangle(this, p1, p2, p3);
	}

	// Get collision info between ray and quad 
	[CallingConvention(.Cdecl), LinkName("GetRayCollisionQuad"), NoShow]
	public static extern Collision GetCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4);
	public Collision GetCollisionQuad(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)
	{
		return GetCollisionQuad(this, p1, p2, p3, p4);
	}

}