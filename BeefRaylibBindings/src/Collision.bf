using System;

namespace Raylib;

static
{
	// Check collision between two rectangles 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionRecs")]
	public static extern bool CheckCollision(Rectangle rec1, Rectangle rec2);

	// Check collision between two circles 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionCircles")]
	public static extern bool CheckCollision(Vector2 center1, float radius1, Vector2 center2, float radius2);

	// Check collision between circle and rectangle 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionCircleRec")]
	public static extern bool CheckCollision(Vector2 center, float radius, Rectangle rec);

	// Check if point is inside rectangle 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionPointRec")]
	public static extern bool CheckCollision(Vector2 point, Rectangle rec);

	// Check if point is inside circle 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionPointCircle")]
	public static extern bool CheckCollision(Vector2 point, Vector2 center, float radius);

	// Check if point is inside a triangle 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionPointTriangle")]
	public static extern bool CheckCollision(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);

	// Check the collision between two lines defined by two points each, returns collision point by reference 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionLines")]
	public static extern bool CheckCollision(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 * collisionPoint);

	// Check if point32 belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold] 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionPointLine")]
	public static extern bool CheckCollision(Vector2 point, Vector2 p1, Vector2 p2, int32 threshold);

	// Get collision rectangle for two rectangles collision 
	[CallingConvention(.Cdecl), LinkName("GetCollisionRec")]
	public static extern Rectangle GetCollision(Rectangle rec1, Rectangle rec2);

	// Check collision between two spheres 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionSpheres")]
	public static extern bool CheckCollision(Vector3 center1, float radius1, Vector3 center2, float radius2);

	// Check collision between two bounding boxes 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionBoxes")]
	public static extern bool CheckCollision(BoundingBox box1, BoundingBox box2);

	// Check collision between box and sphere 
	[CallingConvention(.Cdecl), LinkName("CheckCollisionBoxSphere")]
	public static extern bool CheckCollision(BoundingBox box_, Vector3 center, float radius);
}