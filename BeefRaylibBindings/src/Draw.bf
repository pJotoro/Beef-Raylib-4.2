using System;

namespace Raylib;

static
{
	// Set background color (framebuffer clear color) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void ClearBackground(Color color);

	// Setup canvas (framebuffer) to start drawing 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void BeginDrawing();

	// End canvas drawing and swap buffers (double buffering) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void EndDrawing();

	// Draw a pixel 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPixel(int32 posX, int32 posY, Color color);

	// Draw a pixel (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawPixelV")]
	public static extern void DrawPixel(Vector2 position, Color color);

	// Draw a line 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLine(int32 startPosX, int32 startPosY, int32 endPosX, int32 endPosY, Color color);

	// Draw a line (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawLineV")]
	public static extern void DrawLine(Vector2 startPos, Vector2 endPos, Color color);

	// Draw a line defining thickness 
	[CallingConvention(.Cdecl), LinkName("DrawLineEx")]
	public static extern void DrawLine(Vector2 startPos, Vector2 endPos, float thick, Color color);

	// Draw a line using cubic-bezier curves in-out 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);

	// Draw line using quadratic bezier curves with a control point32 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color);

	// Draw line using cubic bezier curves with 2 control points 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezierCubic(Vector2 startPos, Vector2 endPos, Vector2 startControlPos, Vector2 endControlPos, float thick, Color color);

	// Draw lines sequence 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineStrip(Vector2 * points, int32 pointCount, Color color);

	// Draw a color-filled circle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircle(int32 centerX, int32 centerY, float radius, Color color);

	// Draw a piece of a circle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw circle sector outline 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw a gradient-filled circle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleGradient(int32 centerX, int32 centerY, float radius, Color color1, Color color2);

	// Draw a color-filled circle (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawCircleV")]
	public static extern void DrawCircle(Vector2 center, float radius, Color color);

	// Draw circle outline 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleLines(int32 centerX, int32 centerY, float radius, Color color);

	// Draw ellipse 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawEllipse(int32 centerX, int32 centerY, float radiusH, float radiusV, Color color);

	// Draw ellipse outline 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawEllipseLines(int32 centerX, int32 centerY, float radiusH, float radiusV, Color color);

	// Draw ring 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw ring outline 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw a color-filled rectangle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangle(int32 posX, int32 posY, int32 width, int32 height, Color color);

	// Draw a color-filled rectangle (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleV")]
	public static extern void DrawRectangle(Vector2 position, Vector2 size, Color color);

	// Draw a vertical-gradient-filled rectangle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleGradientV(int32 posX, int32 posY, int32 width, int32 height, Color color1, Color color2);

	// Draw a horizontal-gradient-filled rectangle 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleGradientH(int32 posX, int32 posY, int32 width, int32 height, Color color1, Color color2);

	// Draw a gradient-filled rectangle with custom vertex colors 
	[CallingConvention(.Cdecl), LinkName("DrawRectangleGradientEx")]
	public static extern void DrawRectangleGradient(Rectangle rec, Color col1, Color col2, Color col3, Color col4);

	// Draw rectangle outline 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleLines(int32 posX, int32 posY, int32 width, int32 height, Color color);

	// Draw a color-filled triangle (vertex in counter-clockwise order!) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

	// Draw triangle outline (vertex in counter-clockwise order!) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

	// Draw a triangle fan defined by points (first vertex is the center) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleFan(Vector2 * points, int32 pointCount, Color color);

	// Draw a triangle strip defined by points 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleStrip(Vector2 * points, int32 pointCount, Color color);

	// Draw a regular polygon (Vector version) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPoly(Vector2 center, int32 sides, float radius, float rotation, Color color);

	// Draw a polygon outline of n sides 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPolyLines(Vector2 center, int32 sides, float radius, float rotation, Color color);

	// Draw a polygon outline of n sides with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawPolyLinesEx")]
	public static extern void DrawPolyLines(Vector2 center, int32 sides, float radius, float rotation, float lineThick, Color color);

	// Begin scissor mode (define screen area for following drawing) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void BeginScissorMode(int32 x, int32 y, int32 width, int32 height);

	// End scissor mode 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void EndScissorMode();

	// Draw text (using default font) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawText(char8* text, int32 posX, int32 posY, int32 fontSize, Color color);

	// Draw text using font and additional parameters 
	[CallingConvention(.Cdecl), LinkName("DrawTextEx")]
	public static extern void DrawText(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);

	// Draw text using Font and pro parameters (rotation) 
	[CallingConvention(.Cdecl), LinkName("DrawTextPro")]
	public static extern void DrawText(Font font, char8* text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint);

	// Draw one character (codepoint) 
	[CallingConvention(.Cdecl), LinkName("DrawTextCodepoint")]
	public static extern void DrawCodepoint(Font font, int32 codepoint, Vector2 position, float fontSize, Color tint);

	// Draw multiple character (codepoint) 
	[CallingConvention(.Cdecl), LinkName("DrawTextCodepoints")]
	public static extern void DrawCodepoints(Font font, int32* codepoints, int32 count, Vector2 position, float fontSize, float spacing, Color tint);

	// Draw a line in 3D world space 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);

	// Draw a point32 in 3D space, actually a small line 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPoint3D(Vector3 position, Color color);

	// Draw a circle in 3D world space 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);

	// Draw a color-filled triangle (vertex in counter-clockwise order!) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);

	// Draw a triangle strip defined by points 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleStrip3D(Vector3 * points, int32 pointCount, Color color);

	// Draw cube 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCube(Vector3 position, float width, float height, float length, Color color);

	// Draw cube (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawCubeV")]
	public static extern void DrawCube(Vector3 position, Vector3 size, Color color);

	// Draw cube wires 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);

	// Draw cube wires (Vector version) 
	[CallingConvention(.Cdecl), LinkName("DrawCubeWiresV")]
	public static extern void DrawCubeWires(Vector3 position, Vector3 size, Color color);

	// Draw cube textured 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);

	// Draw cube with a region of a texture 
	[CallingConvention(.Cdecl), LinkName("DrawCubeTextureRec")]
	public static extern void DrawCubeTexture(Texture2D texture, Rectangle source, Vector3 position, float width, float height, float length, Color color);

	// Draw sphere 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawSphere(Vector3 centerPos, float radius, Color color);

	// Draw sphere with extended parameters 
	[CallingConvention(.Cdecl), LinkName("DrawSphereEx")]
	public static extern void DrawSphere(Vector3 centerPos, float radius, int32 rings, int32 slices, Color color);

	// Draw sphere wires 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawSphereWires(Vector3 centerPos, float radius, int32 rings, int32 slices, Color color);

	// Draw a cylinder/cone 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int32 slices, Color color);

	// Draw a cylinder with base at startPos and top at endPos 
	[CallingConvention(.Cdecl), LinkName("DrawCylinderEx")]
	public static extern void DrawCylinder(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int32 sides, Color color);

	// Draw a cylinder/cone wires 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int32 slices, Color color);

	// Draw a cylinder wires with base at startPos and top at endPos 
	[CallingConvention(.Cdecl), LinkName("DrawCylinderWiresEx")]
	public static extern void DrawCylinderWires(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int32 sides, Color color);

	// Draw a plane XZ 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);

	// Draw a grid (centered at (0, 0, 0)) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawGrid(int32 slices, float spacing);

	// Draw a billboard texture 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint);

	// Draw a billboard texture defined by source 
	[CallingConvention(.Cdecl), LinkName("DrawBillboardRec")]
	public static extern void DrawBillboard(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);

	// Draw a billboard texture defined by source and rotation 
	[CallingConvention(.Cdecl), LinkName("DrawBillboardPro")]
	public static extern void DrawBillboard(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);
}