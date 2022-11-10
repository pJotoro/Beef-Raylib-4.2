using System;

namespace Raylib;

typealias TextureCubemap = Texture;

static class Cubemap
{
	// Cubemap layouts 
	[AllowDuplicates]
	public enum Layout : int32
	{
		AUTO_DETECT = 0,
		LINE_VERTICAL = 1,
		LINE_HORIZONTAL = 2,
		CROSS_THREE_BY_FOUR = 3,
		CROSS_FOUR_BY_THREE = 4,
		PANORAMA = 5,
	}

	// Load cubemap from image, multiple image cubemap layouts supported 
	[CallingConvention(.Cdecl), LinkName("LoadTextureCubemap")]
	public static extern TextureCubemap Load(Image image, Layout layout);
}