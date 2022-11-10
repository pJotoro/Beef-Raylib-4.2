using System;

namespace Raylib;

// Image, pixel data stored in CPU memory (RAM) 
[CRepr]
public struct Image
{
	public void* data;
	public int32 width;
	public int32 height;
	public int32 mipmaps;
	public int32 format;

	// Load image from file into CPU memory (RAM) 
	[CallingConvention(.Cdecl), LinkName("LoadImage")]
	public static extern Image Load(char8* fileName);

	// Load image from RAW file data 
	[CallingConvention(.Cdecl), LinkName("LoadImageRaw")]
	public static extern Image Load(char8* fileName, int32 width, int32 height, int32 format, int32 headerSize);

	// Load image sequence from file (frames appended to image.data) 
	[CallingConvention(.Cdecl), LinkName("LoadImageAnim")]
	public static extern Image Load(char8* fileName, int32 * frames);

	// Load image from memory buffer, fileType refers to extension: i.e. '.png' 
	[CallingConvention(.Cdecl), LinkName("LoadImageFromMemory")]
	public static extern Image Load(char8* fileType, uint8* fileData, int32 dataSize);

	// Load image from GPU texture data 
	[CallingConvention(.Cdecl), LinkName("LoadImageFromTexture")]
	public static extern Image Load(Texture2D texture);

	// Load image from screen buffer and (screenshot) 
	[CallingConvention(.Cdecl), LinkName("LoadImageFromScreen")]
	public static extern Image LoadFromScreen();

	// Unload image from CPU memory (RAM) 
	[CallingConvention(.Cdecl), LinkName("UnloadImage"), NoShow]
	public static extern void Unload(Image image);
	public void Unload() { Unload(this); }

	// Export image data to file, returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportImage"), NoShow]
	public static extern bool Export(Image image, char8* fileName);
	public bool Export(char8* fileName) { return Export(this, fileName); }

	// Export image as code file defining an array of bytes, returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportImageAsCode")]
	public static extern bool ExportAsCode(Image image, char8* fileName);
	public bool ExportAsCode(char8* fileName) { return ExportAsCode(this, fileName); }

	// Generate image: plain color 
	[CallingConvention(.Cdecl), LinkName("GenImageColor")]
	public static extern Image GenColor(int32 width, int32 height, Color color);

	// Generate image: vertical gradient 
	[CallingConvention(.Cdecl), LinkName("GenImageGradientV")]
	public static extern Image GenGradientV(int32 width, int32 height, Color top, Color bottom);

	// Generate image: horizontal gradient 
	[CallingConvention(.Cdecl), LinkName("GenImageGradientH")]
	public static extern Image GenGradientH(int32 width, int32 height, Color left, Color right);

	// Generate image: radial gradient 
	[CallingConvention(.Cdecl), LinkName("GenImageGradientRadial")]
	public static extern Image GenGradientRadial(int32 width, int32 height, float density, Color inner, Color outer);

	// Generate image: checked 
	[CallingConvention(.Cdecl), LinkName("GenImageChecked")]
	public static extern Image GenChecked(int32 width, int32 height, int32 checksX, int32 checksY, Color col1, Color col2);

	// Generate image: white noise 
	[CallingConvention(.Cdecl), LinkName("GenImageWhiteNoise")]
	public static extern Image GenWhiteNoise(int32 width, int32 height, float factor);

	// Generate image: cellular algorithm, bigger tileSize means bigger cells 
	[CallingConvention(.Cdecl), LinkName("GenImageCellular")]
	public static extern Image GenCellular(int32 width, int32 height, int32 tileSize);

	// Create an image duplicate (useful for transformations) 
	[CallingConvention(.Cdecl), LinkName("ImageCopy"), NoShow]
	public static extern Image Copy(Image image);
	public Image Copy() { return Copy(this); }

	// Create an image from another image piece 
	[CallingConvention(.Cdecl), LinkName("ImageFromImage"), NoShow]
	public static extern Image FromImage(Image image, Rectangle rec);
	public Image FromImage(Rectangle rec) { return FromImage(this, rec); }

	// Create an image from text (default font) 
	[CallingConvention(.Cdecl), LinkName("ImageText")]
	public static extern Image Text(char8* text, int32 fontSize, Color color);

	// Create an image from text (custom sprite font) 
	[CallingConvention(.Cdecl), LinkName("ImageTextEx")]
	public static extern Image Text(Font font, char8* text, float fontSize, float spacing, Color tint);

	// Convert image data to desired format 
	[CallingConvention(.Cdecl), LinkName("ImageFormat"), NoShow]
	public static extern void Format(Image * image, int32 newFormat);
	public void Format(int32 newFormat) mut { Format(&this, newFormat); }

	// Convert image to POT (power-of-two) 
	[CallingConvention(.Cdecl), LinkName("ImageToPOT"), NoShow]
	public static extern void ToPOT(Image * image, Color fill);
	public void ToPOT(Color fill) mut { ToPOT(&this, fill); }

	// Crop an image to a defined rectangle 
	[CallingConvention(.Cdecl), LinkName("ImageCrop"), NoShow]
	public static extern void Crop(Image * image, Rectangle crop);
	public void Crop(Rectangle crop) mut { Crop(&this, crop); }

	// Crop image depending on alpha value 
	[CallingConvention(.Cdecl), LinkName("ImageAlphaCrop"), NoShow]
	public static extern void AlphaCrop(Image * image, float threshold);
	public void AlphaCrop(float threshold) mut { AlphaCrop(&this, threshold); }

	// Clear alpha channel to desired color 
	[CallingConvention(.Cdecl), LinkName("ImageAlphaClear"), NoShow]
	public static extern void AlphaClear(Image * image, Color color, float threshold);
	public void AlphaClear(Color color, float threshold) mut { AlphaClear(&this, color, threshold); }

	// Apply alpha mask to image 
	[CallingConvention(.Cdecl), LinkName("ImageAlphaMask"), NoShow]
	public static extern void AlphaMask(Image * image, Image alphaMask);
	public void AlphaMask(Image alphaMask) mut { AlphaMask(&this, alphaMask); }

	// Premultiply alpha channel 
	[CallingConvention(.Cdecl), LinkName("ImageAlphaPremultiply"), NoShow]
	public static extern void AlphaPremultiply(Image * image);
	public void AlphaPremultiply() mut { AlphaPremultiply(&this); }

	// Resize image (Bicubic scaling algorithm) 
	[CallingConvention(.Cdecl), LinkName("ImageResize"), NoShow]
	public static extern void Resize(Image * image, int32 newWidth, int32 newHeight);
	public void Resize(int32 newWidth, int32 newHeight) mut { Resize(&this, newWidth, newHeight); }

	// Resize image (Nearest-Neighbor scaling algorithm) 
	[CallingConvention(.Cdecl), LinkName("ImageResizeNN"), NoShow]
	public static extern void ResizeNN(Image * image, int32 newWidth, int32 newHeight);
	public void ResizeNN(int32 newWidth, int32 newHeight) mut { ResizeNN(&this, newWidth, newHeight); }

	// Resize canvas and fill with color 
	[CallingConvention(.Cdecl), LinkName("ImageResizeCanvas"), NoShow]
	public static extern void ResizeCanvas(Image * image, int32 newWidth, int32 newHeight, int32 offsetX, int32 offsetY, Color fill);
	public void ResizeCanvas(int32 newWidth, int32 newHeight, int32 offsetX, int32 offsetY, Color fill) mut
	{
		ResizeCanvas(&this, newWidth, newHeight, offsetX, offsetY, fill);
	}

	// Compute all mipmap levels for a provided image 
	[CallingConvention(.Cdecl), LinkName("ImageMipmaps"), NoShow]
	public static extern void Mipmaps(Image * image);
	public void Mipmaps() mut { Mipmaps(&this); }

	// Dither image data to 16bpp or lower (Floyd-Steinberg dithering) 
	[CallingConvention(.Cdecl), LinkName("ImageDither"), NoShow]
	public static extern void Dither(Image * image, int32 rBpp, int32 gBpp, int32 bBpp, int32 aBpp);
	public void Dither(int32 rBpp, int32 gBpp, int32 bBpp, int32 aBpp) mut
	{
		Dither(&this, rBpp, gBpp, bBpp, aBpp);
	}

	// Flip image vertically 
	[CallingConvention(.Cdecl), LinkName("ImageFlipVertical"), NoShow]
	public static extern void FlipVertical(Image * image);
	public void FlipVertical() mut { FlipVertical(&this); }

	// Flip image horizontally 
	[CallingConvention(.Cdecl), LinkName("ImageFlipHorizontal"), NoShow]
	public static extern void FlipHorizontal(Image * image);
	public void FlipHorizontal() mut { FlipHorizontal(&this); }

	// Rotate image clockwise 90deg 
	[CallingConvention(.Cdecl), LinkName("ImageRotateCW"), NoShow]
	public static extern void RotateCW(Image * image);
	public void RotateCW() mut { RotateCW(&this); }

	// Rotate image counter-clockwise 90deg 
	[CallingConvention(.Cdecl), LinkName("ImageRotateCCW"), NoShow]
	public static extern void RotateCCW(Image * image);
	public void RotateCCW() mut { RotateCCW(&this); }

	// Modify image color: tint 
	[CallingConvention(.Cdecl), LinkName("ImageColorTint"), NoShow]
	public static extern void ColorTint(Image * image, Color color);
	public void ColorTint(Color color) mut { ColorTint(&this, color); }

	// Modify image color: invert 
	[CallingConvention(.Cdecl), LinkName("ImageColorInvert"), NoShow]
	public static extern void ColorInvert(Image * image);
	public void ColorInvert() mut { ColorInvert(&this); }

	// Modify image color: grayscale 
	[CallingConvention(.Cdecl), LinkName("ImageColorGrayscale"), NoShow]
	public static extern void ColorGrayscale(Image * image);
	public void ColorGrayscale() mut { ColorGrayscale(&this); }

	// Modify image color: contrast (-100 to 100) 
	[CallingConvention(.Cdecl), LinkName("ImageColorContrast"), NoShow]
	public static extern void ColorContrast(Image * image, float contrast);
	public void ColorContrast(float contrast) mut { ColorContrast(&this, contrast); }

	// Modify image color: brightness (-255 to 255) 
	[CallingConvention(.Cdecl), LinkName("ImageColorBrightness"), NoShow]
	public static extern void ColorBrightness(Image * image, int32 brightness);
	public void ColorBrightness(int32 brightness) mut { ColorBrightness(&this, brightness); }

	// Modify image color: replace color 
	[CallingConvention(.Cdecl), LinkName("ImageColorReplace"), NoShow]
	public static extern void ColorReplace(Image * image, Color color, Color replace);
	public void ColorReplace(Color color, Color replace) mut { ColorReplace(&this, color, replace); }

	// Load color data from image as a Color array (RGBA - 32bit) 
	[CallingConvention(.Cdecl), LinkName("LoadImageColors"), NoShow]
	public static extern Color* LoadColors(Image image);
	public Color* LoadColors() { return LoadColors(this); }

	// Load colors palette from image as a Color array (RGBA - 32bit) 
	[CallingConvention(.Cdecl), LinkName("LoadImagePalette"), NoShow]
	public static extern Color* LoadPalette(Image image, int32 maxPaletteSize, int32 * colorCount);
	public Color* LoadPalette(int32 maxPaletteSize, int32 * colorCount)
	{
		return LoadPalette(this, maxPaletteSize, colorCount);
	}

	// Get image alpha border rectangle 
	[CallingConvention(.Cdecl), LinkName("GetImageAlphaBorder"), NoShow]
	public static extern Rectangle GetAlphaBorder(Image image, float threshold);
	public Rectangle GetAlphaBorder(float threshold) { return GetAlphaBorder(this, threshold); }

	// Get image pixel color at (x, y) position 
	[CallingConvention(.Cdecl), LinkName("GetImageColor"), NoShow]
	public static extern Color GetColor(Image image, int32 x, int32 y);
	public Color GetColor(int32 x, int32 y) { return GetColor(this, x, y); }

	// Clear image background with given color 
	[CallingConvention(.Cdecl), LinkName("ImageClearBackground"), NoShow]
	public static extern void ClearBackground(Image * dst, Color color);
	public void ClearBackground(Color color) mut { ClearBackground(&this, color); }

	// Draw pixel within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawPixel"), NoShow]
	public static extern void DrawPixel(Image * dst, int32 posX, int32 posY, Color color);
	public void DrawPixel(int32 posX, int32 posY, Color color) mut { DrawPixel(&this, posX, posY, color); }

	// Draw pixel within an image (Vector version) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawPixelV"), NoShow]
	public static extern void DrawPixel(Image * dst, Vector2 position, Color color);
	public void DrawPixel(Vector2 position, Color color) mut { DrawPixel(&this, position, color); }

	// Draw line within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawLine"), NoShow]
	public static extern void DrawLine(Image * dst, int32 startPosX, int32 startPosY, int32 endPosX, int32 endPosY, Color color);
	public void DrawLine(int32 startPosX, int32 startPosY, int32 endPosX, int32 endPosY, Color color) mut
	{
		DrawLine(&this, startPosX, startPosY, endPosX, endPosY, color);
	}

	// Draw line within an image (Vector version) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawLineV"), NoShow]
	public static extern void DrawLine(Image * dst, Vector2 start, Vector2 end, Color color);
	public void DrawLine(Vector2 start, Vector2 end, Color color) mut
	{
		DrawLine(&this, start, end, color);
	}

	// Draw circle within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawCircle"), NoShow]
	public static extern void DrawCircle(Image * dst, int32 centerX, int32 centerY, int32 radius, Color color);
	public void DrawCircle(int32 centerX, int32 centerY, int32 radius, Color color) mut
	{
		DrawCircle(&this, centerX, centerY, radius, color);
	}

	// Draw circle within an image (Vector version) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawCircleV"), NoShow]
	public static extern void DrawCircle(Image * dst, Vector2 center, int32 radius, Color color);
	public void DrawCircle(Vector2 center, int32 radius, Color color) mut
	{
		DrawCircle(&this, center, radius, color);
	}

	// Draw rectangle within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawRectangle"), NoShow]
	public static extern void DrawRectangle(Image * dst, int32 posX, int32 posY, int32 width, int32 height, Color color);
	public void DrawRectangle(int32 posX, int32 posY, int32 width, int32 height, Color color) mut
	{
		DrawRectangle(&this, posX, posY, width, height, color);
	}

	// Draw rectangle within an image (Vector version) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawRectangleV"), NoShow]
	public static extern void DrawRectangle(Image * dst, Vector2 position, Vector2 size, Color color);
	public void DrawRectangle(Vector2 position, Vector2 size, Color color) mut
	{
		DrawRectangle(&this, position, size, color);
	}

	// Draw rectangle within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawRectangleRec"), NoShow]
	public static extern void DrawRectangle(Image * dst, Rectangle rec, Color color);
	public void DrawRectangle(Rectangle rec, Color color) mut
	{
		DrawRectangle(&this, rec, color);
	}

	// Draw rectangle lines within an image 
	[CallingConvention(.Cdecl), LinkName("ImageDrawRectangleLines"), NoShow]
	public static extern void DrawRectangle(Image * dst, Rectangle rec, int32 thick, Color color);
	public void DrawRectangle(Rectangle rec, int32 thick, Color color) mut
	{
		DrawRectangle(&this, rec, thick, color);
	}

	// Draw a source image within a destination image (tint applied to source) 
	[CallingConvention(.Cdecl), LinkName("ImageDraw"), NoShow]
	public static extern void Draw(Image * dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
	public void Draw(Image src, Rectangle srcRec, Rectangle dstRec, Color tint) mut
	{
		Draw(&this, src, srcRec, dstRec, tint);
	}

	// Draw text (using default font) within an image (destination) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawText"), NoShow]
	public static extern void DrawText(Image * dst, char8* text, int32 posX, int32 posY, int32 fontSize, Color color);
	public void DrawText(char8* text, int32 posX, int32 posY, int32 fontSize, Color color) mut
	{
		DrawText(&this, text, posX, posY, fontSize, color);
	}

	// Draw text (custom sprite font) within an image (destination) 
	[CallingConvention(.Cdecl), LinkName("ImageDrawTextEx"), NoShow]
	public static extern void DrawText(Image * dst, Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);
	public void DrawText(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint) mut
	{
		DrawText(&this, font, text, position, fontSize, spacing, tint);
	}

	// Unload color data loaded with LoadImageColors()
	[CallingConvention(.Cdecl), LinkName("UnloadImageColors")]
	public static extern void UnloadColors(Color * colors);

	// Unload colors palette loaded with LoadImagePalette() 
	[CallingConvention(.Cdecl), LinkName("UnloadImagePalette")]
	public static extern void UnloadPalette(Color * colors);

	// Generate image font atlas using chars info 
	[CallingConvention(.Cdecl), LinkName("GenImageFontAtlas")]
	public static extern Image GenFontAtlas(GlyphInfo * chars, Rectangle ** recs, int32 glyphCount, int32 fontSize, int32 padding, int32 packMethod);
}