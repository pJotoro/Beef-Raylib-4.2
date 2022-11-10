using System;

namespace RaylibBeef;

static class Raylib
{
	// Color, 4 components, R8G8B8A8 (32bit) 
	[CRepr]
	public struct Color
	{
		public uint8 r, g, b, a;
		public this(uint8 r, uint8 g, uint8 b, uint8 a)
		{
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
		}
	}

	public const char8* RAYLIB_VERSION = "4.2";

	public const Color LIGHTGRAY = .(200, 200, 200, 255); // Light Gray 
	public const Color GRAY = .(130, 130, 130, 255); // Gray 
	public const Color DARKGRAY = .(80, 80, 80, 255); // Dark Gray 
	public const Color YELLOW = .(253, 249, 0, 255); // Yellow 
	public const Color GOLD = .(255, 203, 0, 255); // Gold 
	public const Color ORANGE = .(255, 161, 0, 255); // Orange 
	public const Color PINK = .(255, 109, 194, 255); // Pink 
	public const Color RED = .(230, 41, 55, 255); // Red 
	public const Color MAROON = .(190, 33, 55, 255); // Maroon 
	public const Color GREEN = .(0, 228, 48, 255); // Green 
	public const Color LIME = .(0, 158, 47, 255); // Lime 
	public const Color DARKGREEN = .(0, 117, 44, 255); // Dark Green 
	public const Color SKYBLUE = .(102, 191, 255, 255); // Sky Blue 
	public const Color BLUE = .(0, 121, 241, 255); // Blue 
	public const Color DARKBLUE = .(0, 82, 172, 255); // Dark Blue 
	public const Color PURPLE = .(200, 122, 255, 255); // Purple 
	public const Color VIOLET = .(135, 60, 190, 255); // Violet 
	public const Color DARKPURPLE = .(112, 31, 126, 255); // Dark Purple 
	public const Color BEIGE = .(211, 176, 131, 255); // Beige 
	public const Color BROWN = .(127, 106, 79, 255); // Brown 
	public const Color DARKBROWN = .(76, 63, 47, 255); // Dark Brown 
	public const Color WHITE = .(255, 255, 255, 255); // White 
	public const Color BLACK = .(0, 0, 0, 255); // Black 
	public const Color BLANK = .(0, 0, 0, 0); // Blank (Transparent) 
	public const Color MAGENTA = .(255, 0, 255, 255); // Magenta 
	public const Color RAYWHITE = .(245, 245, 245, 255); // My own White (raylib logo) 

	// Vector2, 2 components 
	[CRepr]
	public struct Vector2
	{
		public float x;
		public float y;
	}

	// Vector3, 3 components 
	[CRepr]
	public struct Vector3
	{
		public float x;
		public float y;
		public float z;
	}

	// Vector4, 4 components 
	[CRepr]
	public struct Vector4
	{
		public float x;
		public float y;
		public float z;
		public float w;
	}

	// Matrix, 4x4 components, column major, OpenGL style, right handed 
	[CRepr]
	public struct Matrix
	{
		public float m0;
		public float m4;
		public float m8;
		public float m12;
		public float m1;
		public float m5;
		public float m9;
		public float m13;
		public float m2;
		public float m6;
		public float m10;
		public float m14;
		public float m3;
		public float m7;
		public float m11;
		public float m15;
	}

	// Rectangle, 4 components 
	[CRepr]
	public struct Rectangle
	{
		public float x;
		public float y;
		public float width;
		public float height;
	}

	// Image, pixel data stored in CPU memory (RAM) 
	[CRepr]
	public struct Image
	{
		public void* data;
		public int32 width;
		public int32 height;
		public int32 mipmaps;
		public int32 format;
	}

	// Texture, tex data stored in GPU memory (VRAM) 
	[CRepr]
	public struct Texture
	{
		public uint32 id;
		public int32 width;
		public int32 height;
		public int32 mipmaps;
		public int32 format;
	}

	// RenderTexture, fbo for texture rendering 
	[CRepr]
	public struct RenderTexture
	{
		public uint32 id;
		public Texture texture;
		public Texture depth;
	}

	// NPatchInfo, n-patch layout info 
	[CRepr]
	public struct NPatchInfo
	{
		public Rectangle source;
		public int32 left;
		public int32 top;
		public int32 right;
		public int32 bottom;
		public int32 layout;
	}

	// GlyphInfo, font characters glyphs info 
	[CRepr]
	public struct GlyphInfo
	{
		public int32 value;
		public int32 offsetX;
		public int32 offsetY;
		public int32 advanceX;
		public Image image;
	}

	// Font, font texture and GlyphInfo array data 
	[CRepr]
	public struct Font
	{
		public int32 baseSize;
		public int32 glyphCount;
		public int32 glyphPadding;
		public Texture2D texture;
		public Rectangle* recs;
		public GlyphInfo* glyphs;
	}

	// Camera, defines position/orientation in 3d space 
	[CRepr]
	public struct Camera3D
	{
		public Vector3 position;
		public Vector3 target;
		public Vector3 up;
		public float fovy;
		public int32 projection;
	}

	// Camera2D, defines position/orientation in 2d space 
	[CRepr]
	public struct Camera2D
	{
		public Vector2 offset;
		public Vector2 target;
		public float rotation;
		public float zoom;
	}

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
	}

	// Shader 
	[CRepr]
	public struct Shader
	{
		public uint32 id;
		public int32* locs;
	}

	// MaterialMap 
	[CRepr]
	public struct MaterialMap
	{
		public Texture2D texture;
		public Color color;
		public float value;
	}

	// Material, includes shader and maps 
	[CRepr]
	public struct Material
	{
		public Shader shader;
		public MaterialMap* maps;
		public float[4] params_;
	}

	// Transform, vectex transformation data 
	[CRepr]
	public struct Transform
	{
		public Vector3 translation;
		public Quaternion rotation;
		public Vector3 scale;
	}

	// Bone, skeletal animation bone 
	[CRepr]
	public struct BoneInfo
	{
		public char8[32] name;
		public int32 parent;
	}

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
	}

	// ModelAnimation 
	[CRepr]
	public struct ModelAnimation
	{
		public int32 boneCount;
		public int32 frameCount;
		public BoneInfo* bones;
		public Transform** framePoses;
	}

	// Ray, ray for raycasting 
	[CRepr]
	public struct Ray
	{
		public Vector3 position;
		public Vector3 direction;
	}

	// RayCollision, ray hit information 
	[CRepr]
	public struct RayCollision
	{
		public bool hit;
		public float distance;
		public Vector3 point;
		public Vector3 normal;
	}

	// BoundingBox 
	[CRepr]
	public struct BoundingBox
	{
		public Vector3 min;
		public Vector3 max;
	}

	// Wave, audio wave data 
	[CRepr]
	public struct Wave
	{
		public uint32 frameCount;
		public uint32 sampleRate;
		public uint32 sampleSize;
		public uint32 channels;
		public void* data;
	}

	// AudioStream, custom audio stream 
	[CRepr]
	public struct AudioStream
	{
		public rAudioBuffer* buffer;
		public rAudioProcessor* processor;
		public uint32 sampleRate;
		public uint32 sampleSize;
		public uint32 channels;
	}

	// Sound 
	[CRepr]
	public struct Sound
	{
		public AudioStream stream;
		public uint32 frameCount;
	}

	// Music, audio stream, anything longer than ~10 seconds should be streamed 
	[CRepr]
	public struct Music
	{
		public AudioStream stream;
		public uint32 frameCount;
		public bool looping;
		public int32 ctxType;
		public void* ctxData;
	}

	// VrDeviceInfo, Head-Mounted-Display device parameters 
	[CRepr]
	public struct VrDeviceInfo
	{
		public int32 hResolution;
		public int32 vResolution;
		public float hScreenSize;
		public float vScreenSize;
		public float vScreenCenter;
		public float eyeToScreenDistance;
		public float lensSeparationDistance;
		public float interpupillaryDistance;
		public float[4] lensDistortionValues;
		public float[4] chromaAbCorrection;
	}

	// VrStereoConfig, VR stereo rendering configuration for simulator 
	[CRepr]
	public struct VrStereoConfig
	{
		public Matrix[2] projection;
		public Matrix[2] viewOffset;
		public float[2] leftLensCenter;
		public float[2] rightLensCenter;
		public float[2] leftScreenCenter;
		public float[2] rightScreenCenter;
		public float[2] scale;
		public float[2] scaleIn;
	}

	// File path list 
	[CRepr]
	public struct FilePathList
	{
		public uint32 capacity;
		public uint32 count;
		public char8** paths;
	}

	typealias Quaternion = Vector4;
	typealias Texture2D = Texture;
	typealias TextureCubemap = Texture;
	typealias RenderTexture2D = RenderTexture;
	typealias Camera = Camera3D;

	// System/Window config flags 
	public enum ConfigFlags : int32
	{
		FLAG_VSYNC_HINT = 64,
		FLAG_FULLSCREEN_MODE = 2,
		FLAG_WINDOW_RESIZABLE = 4,
		FLAG_WINDOW_UNDECORATED = 8,
		FLAG_WINDOW_HIDDEN = 128,
		FLAG_WINDOW_MINIMIZED = 512,
		FLAG_WINDOW_MAXIMIZED = 1024,
		FLAG_WINDOW_UNFOCUSED = 2048,
		FLAG_WINDOW_TOPMOST = 4096,
		FLAG_WINDOW_ALWAYS_RUN = 256,
		FLAG_WINDOW_TRANSPARENT = 16,
		FLAG_WINDOW_HIGHDPI = 8192,
		FLAG_WINDOW_MOUSE_PASSTHROUGH = 16384,
		FLAG_MSAA_4X_HINT = 32,
		FLAG_INTERLACED_HINT = 65536,
	}

	// Trace log level 
	public enum TraceLogLevel : int32
	{
		LOG_ALL = 0,
		LOG_TRACE = 1,
		LOG_DEBUG = 2,
		LOG_INFO = 3,
		LOG_WARNING = 4,
		LOG_ERROR = 5,
		LOG_FATAL = 6,
		LOG_NONE = 7,
	}

	// Keyboard keys (US keyboard layout) 
	public enum KeyboardKey : int32
	{
		KEY_NULL = 0,
		KEY_APOSTROPHE = 39,
		KEY_COMMA = 44,
		KEY_MINUS = 45,
		KEY_PERIOD = 46,
		KEY_SLASH = 47,
		KEY_ZERO = 48,
		KEY_ONE = 49,
		KEY_TWO = 50,
		KEY_THREE = 51,
		KEY_FOUR = 52,
		KEY_FIVE = 53,
		KEY_SIX = 54,
		KEY_SEVEN = 55,
		KEY_EIGHT = 56,
		KEY_NINE = 57,
		KEY_SEMICOLON = 59,
		KEY_EQUAL = 61,
		KEY_A = 65,
		KEY_B = 66,
		KEY_C = 67,
		KEY_D = 68,
		KEY_E = 69,
		KEY_F = 70,
		KEY_G = 71,
		KEY_H = 72,
		KEY_I = 73,
		KEY_J = 74,
		KEY_K = 75,
		KEY_L = 76,
		KEY_M = 77,
		KEY_N = 78,
		KEY_O = 79,
		KEY_P = 80,
		KEY_Q = 81,
		KEY_R = 82,
		KEY_S = 83,
		KEY_T = 84,
		KEY_U = 85,
		KEY_V = 86,
		KEY_W = 87,
		KEY_X = 88,
		KEY_Y = 89,
		KEY_Z = 90,
		KEY_LEFT_BRACKET = 91,
		KEY_BACKSLASH = 92,
		KEY_RIGHT_BRACKET = 93,
		KEY_GRAVE = 96,
		KEY_SPACE = 32,
		KEY_ESCAPE = 256,
		KEY_ENTER = 257,
		KEY_TAB = 258,
		KEY_BACKSPACE = 259,
		KEY_INSERT = 260,
		KEY_DELETE = 261,
		KEY_RIGHT = 262,
		KEY_LEFT = 263,
		KEY_DOWN = 264,
		KEY_UP = 265,
		KEY_PAGE_UP = 266,
		KEY_PAGE_DOWN = 267,
		KEY_HOME = 268,
		KEY_END = 269,
		KEY_CAPS_LOCK = 280,
		KEY_SCROLL_LOCK = 281,
		KEY_NUM_LOCK = 282,
		KEY_PRINT_SCREEN = 283,
		KEY_PAUSE = 284,
		KEY_F1 = 290,
		KEY_F2 = 291,
		KEY_F3 = 292,
		KEY_F4 = 293,
		KEY_F5 = 294,
		KEY_F6 = 295,
		KEY_F7 = 296,
		KEY_F8 = 297,
		KEY_F9 = 298,
		KEY_F10 = 299,
		KEY_F11 = 300,
		KEY_F12 = 301,
		KEY_LEFT_SHIFT = 340,
		KEY_LEFT_CONTROL = 341,
		KEY_LEFT_ALT = 342,
		KEY_LEFT_SUPER = 343,
		KEY_RIGHT_SHIFT = 344,
		KEY_RIGHT_CONTROL = 345,
		KEY_RIGHT_ALT = 346,
		KEY_RIGHT_SUPER = 347,
		KEY_KB_MENU = 348,
		KEY_KP_0 = 320,
		KEY_KP_1 = 321,
		KEY_KP_2 = 322,
		KEY_KP_3 = 323,
		KEY_KP_4 = 324,
		KEY_KP_5 = 325,
		KEY_KP_6 = 326,
		KEY_KP_7 = 327,
		KEY_KP_8 = 328,
		KEY_KP_9 = 329,
		KEY_KP_DECIMAL = 330,
		KEY_KP_DIVIDE = 331,
		KEY_KP_MULTIPLY = 332,
		KEY_KP_SUBTRACT = 333,
		KEY_KP_ADD = 334,
		KEY_KP_ENTER = 335,
		KEY_KP_EQUAL = 336,
		KEY_BACK = 4,
		KEY_MENU = 82,
		KEY_VOLUME_UP = 24,
		KEY_VOLUME_DOWN = 25,
	}

	// Mouse buttons 
	public enum MouseButton : int32
	{
		MOUSE_BUTTON_LEFT = 0,
		MOUSE_BUTTON_RIGHT = 1,
		MOUSE_BUTTON_MIDDLE = 2,
		MOUSE_BUTTON_SIDE = 3,
		MOUSE_BUTTON_EXTRA = 4,
		MOUSE_BUTTON_FORWARD = 5,
		MOUSE_BUTTON_BACK = 6,
	}

	// Mouse cursor 
	public enum MouseCursor : int32
	{
		MOUSE_CURSOR_DEFAULT = 0,
		MOUSE_CURSOR_ARROW = 1,
		MOUSE_CURSOR_IBEAM = 2,
		MOUSE_CURSOR_CROSSHAIR = 3,
		MOUSE_CURSOR_POINTING_HAND = 4,
		MOUSE_CURSOR_RESIZE_EW = 5,
		MOUSE_CURSOR_RESIZE_NS = 6,
		MOUSE_CURSOR_RESIZE_NWSE = 7,
		MOUSE_CURSOR_RESIZE_NESW = 8,
		MOUSE_CURSOR_RESIZE_ALL = 9,
		MOUSE_CURSOR_NOT_ALLOWED = 10,
	}

	// Gamepad buttons 
	public enum GamepadButton : int32
	{
		GAMEPAD_BUTTON_UNKNOWN = 0,
		GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
		GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
		GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
		GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,
		GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
		GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
		GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
		GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,
		GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
		GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
		GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
		GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,
		GAMEPAD_BUTTON_MIDDLE_LEFT = 13,
		GAMEPAD_BUTTON_MIDDLE = 14,
		GAMEPAD_BUTTON_MIDDLE_RIGHT = 15,
		GAMEPAD_BUTTON_LEFT_THUMB = 16,
		GAMEPAD_BUTTON_RIGHT_THUMB = 17,
	}

	// Gamepad axis 
	public enum GamepadAxis : int32
	{
		GAMEPAD_AXIS_LEFT_X = 0,
		GAMEPAD_AXIS_LEFT_Y = 1,
		GAMEPAD_AXIS_RIGHT_X = 2,
		GAMEPAD_AXIS_RIGHT_Y = 3,
		GAMEPAD_AXIS_LEFT_TRIGGER = 4,
		GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
	}

	// Material map index 
	public enum MaterialMapIndex : int32
	{
		MATERIAL_MAP_ALBEDO = 0,
		MATERIAL_MAP_METALNESS = 1,
		MATERIAL_MAP_NORMAL = 2,
		MATERIAL_MAP_ROUGHNESS = 3,
		MATERIAL_MAP_OCCLUSION = 4,
		MATERIAL_MAP_EMISSION = 5,
		MATERIAL_MAP_HEIGHT = 6,
		MATERIAL_MAP_CUBEMAP = 7,
		MATERIAL_MAP_IRRADIANCE = 8,
		MATERIAL_MAP_PREFILTER = 9,
		MATERIAL_MAP_BRDF = 10,
	}

	// Shader location index 
	public enum ShaderLocationIndex : int32
	{
		SHADER_LOC_VERTEX_POSITION = 0,
		SHADER_LOC_VERTEX_TEXCOORD01 = 1,
		SHADER_LOC_VERTEX_TEXCOORD02 = 2,
		SHADER_LOC_VERTEX_NORMAL = 3,
		SHADER_LOC_VERTEX_TANGENT = 4,
		SHADER_LOC_VERTEX_COLOR = 5,
		SHADER_LOC_MATRIX_MVP = 6,
		SHADER_LOC_MATRIX_VIEW = 7,
		SHADER_LOC_MATRIX_PROJECTION = 8,
		SHADER_LOC_MATRIX_MODEL = 9,
		SHADER_LOC_MATRIX_NORMAL = 10,
		SHADER_LOC_VECTOR_VIEW = 11,
		SHADER_LOC_COLOR_DIFFUSE = 12,
		SHADER_LOC_COLOR_SPECULAR = 13,
		SHADER_LOC_COLOR_AMBIENT = 14,
		SHADER_LOC_MAP_ALBEDO = 15,
		SHADER_LOC_MAP_METALNESS = 16,
		SHADER_LOC_MAP_NORMAL = 17,
		SHADER_LOC_MAP_ROUGHNESS = 18,
		SHADER_LOC_MAP_OCCLUSION = 19,
		SHADER_LOC_MAP_EMISSION = 20,
		SHADER_LOC_MAP_HEIGHT = 21,
		SHADER_LOC_MAP_CUBEMAP = 22,
		SHADER_LOC_MAP_IRRADIANCE = 23,
		SHADER_LOC_MAP_PREFILTER = 24,
		SHADER_LOC_MAP_BRDF = 25,
	}

	// Shader uniform data type 
	public enum ShaderUniformDataType : int32
	{
		SHADER_UNIFORM_FLOAT = 0,
		SHADER_UNIFORM_VEC2 = 1,
		SHADER_UNIFORM_VEC3 = 2,
		SHADER_UNIFORM_VEC4 = 3,
		SHADER_UNIFORM_INT = 4,
		SHADER_UNIFORM_IVEC2 = 5,
		SHADER_UNIFORM_IVEC3 = 6,
		SHADER_UNIFORM_IVEC4 = 7,
		SHADER_UNIFORM_SAMPLER2D = 8,
	}

	// Shader attribute data types 
	public enum ShaderAttributeDataType : int32
	{
		SHADER_ATTRIB_FLOAT = 0,
		SHADER_ATTRIB_VEC2 = 1,
		SHADER_ATTRIB_VEC3 = 2,
		SHADER_ATTRIB_VEC4 = 3,
	}

	// Pixel formats 
	public enum PixelFormat : int32
	{
		PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
		PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,
		PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,
		PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,
		PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,
		PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,
		PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,
		PIXELFORMAT_UNCOMPRESSED_R32 = 8,
		PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,
		PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,
		PIXELFORMAT_COMPRESSED_DXT1_RGB = 11,
		PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12,
		PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13,
		PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14,
		PIXELFORMAT_COMPRESSED_ETC1_RGB = 15,
		PIXELFORMAT_COMPRESSED_ETC2_RGB = 16,
		PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17,
		PIXELFORMAT_COMPRESSED_PVRT_RGB = 18,
		PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19,
		PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20,
		PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21,
	}

	// Texture parameters: filter mode 
	public enum TextureFilter : int32
	{
		TEXTURE_FILTER_POINT = 0,
		TEXTURE_FILTER_BILINEAR = 1,
		TEXTURE_FILTER_TRILINEAR = 2,
		TEXTURE_FILTER_ANISOTROPIC_4X = 3,
		TEXTURE_FILTER_ANISOTROPIC_8X = 4,
		TEXTURE_FILTER_ANISOTROPIC_16X = 5,
	}

	// Texture parameters: wrap mode 
	public enum TextureWrap : int32
	{
		TEXTURE_WRAP_REPEAT = 0,
		TEXTURE_WRAP_CLAMP = 1,
		TEXTURE_WRAP_MIRROR_REPEAT = 2,
		TEXTURE_WRAP_MIRROR_CLAMP = 3,
	}

	// Cubemap layouts 
	public enum CubemapLayout : int32
	{
		CUBEMAP_LAYOUT_AUTO_DETECT = 0,
		CUBEMAP_LAYOUT_LINE_VERTICAL = 1,
		CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2,
		CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3,
		CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4,
		CUBEMAP_LAYOUT_PANORAMA = 5,
	}

	// Font type, defines generation method 
	public enum FontType : int32
	{
		FONT_DEFAULT = 0,
		FONT_BITMAP = 1,
		FONT_SDF = 2,
	}

	// Color blending modes (pre-defined) 
	public enum BlendMode : int32
	{
		BLEND_ALPHA = 0,
		BLEND_ADDITIVE = 1,
		BLEND_MULTIPLIED = 2,
		BLEND_ADD_COLORS = 3,
		BLEND_SUBTRACT_COLORS = 4,
		BLEND_ALPHA_PREMULTIPLY = 5,
		BLEND_CUSTOM = 6,
	}

	// Gesture 
	public enum Gesture : int32
	{
		GESTURE_NONE = 0,
		GESTURE_TAP = 1,
		GESTURE_DOUBLETAP = 2,
		GESTURE_HOLD = 4,
		GESTURE_DRAG = 8,
		GESTURE_SWIPE_RIGHT = 16,
		GESTURE_SWIPE_LEFT = 32,
		GESTURE_SWIPE_UP = 64,
		GESTURE_SWIPE_DOWN = 128,
		GESTURE_PINCH_IN = 256,
		GESTURE_PINCH_OUT = 512,
	}

	// Camera system modes 
	public enum CameraMode : int32
	{
		CAMERA_CUSTOM = 0,
		CAMERA_FREE = 1,
		CAMERA_ORBITAL = 2,
		CAMERA_FIRST_PERSON = 3,
		CAMERA_THIRD_PERSON = 4,
	}

	// Camera projection 
	public enum CameraProjection : int32
	{
		CAMERA_PERSPECTIVE = 0,
		CAMERA_ORTHOGRAPHIC = 1,
	}

	// N-patch layout 
	public enum NPatchLayout : int32
	{
		NPATCH_NINE_PATCH = 0,
		NPATCH_THREE_PATCH_VERTICAL = 1,
		NPATCH_THREE_PATCH_HORIZONTAL = 2,
	}


	// Initialize window and OpenGL context 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void InitWindow(int32 width, int32height, char8* title);

	// Check if KEY_ESCAPE pressed or Close icon pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool WindowShouldClose();

	// Close window and unload OpenGL context 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void CloseWindow();

	// Check if window has been initialized successfully 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowReady();

	// Check if window is currently fullscreen 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowFullscreen();

	// Check if window is currently hidden (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowHidden();

	// Check if window is currently minimized (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowMinimized();

	// Check if window is currently maximized (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowMaximized();

	// Check if window is currently focused (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowFocused();

	// Check if window has been resized last frame 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowResized();

	// Check if one specific window flag is enabled 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsWindowState(uint32 flag);

	// Set window configuration state using flags (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowState(uint32 flags);

	// Clear window configuration state flags 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ClearWindowState(uint32 flags);

	// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ToggleFullscreen();

	// Set window state: maximized, if resizable (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void MaximizeWindow();

	// Set window state: minimized, if resizable (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void MinimizeWindow();

	// Set window state: not minimized/maximized (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void RestoreWindow();

	// Set icon for window (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowIcon(Image image);

	// Set title for window (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowTitle(char8* title);

	// Set window position on screen (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowPosition(int32 x, int32 y);

	// Set monitor for the current window (fullscreen mode) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowMonitor(int32 monitor);

	// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowMinSize(int32 width, int32 height);

	// Set window dimensions 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowSize(int32 width, int32 height);

	// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetWindowOpacity(float opacity);

	// Get native window handle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void* GetWindowHandle();

	// Get current screen width 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetScreenWidth();

	// Get current screen height 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetScreenHeight();

	// Get current render width (it considers HiDPI) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetRenderWidth();

	// Get current render height (it considers HiDPI) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetRenderHeight();

	// Get number of connected monitors 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorCount();

	// Get current connected monitor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetCurrentMonitor();

	// Get specified monitor position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetMonitorPosition(int32 monitor);

	// Get specified monitor width (current video mode used by monitor) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorWidth(int32 monitor);

	// Get specified monitor height (current video mode used by monitor) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorHeight(int32 monitor);

	// Get specified monitor physical width in millimetres 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorPhysicalWidth(int32 monitor);

	// Get specified monitor physical height in millimetres 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorPhysicalHeight(int32 monitor);

	// Get specified monitor refresh rate 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMonitorRefreshRate(int32 monitor);

	// Get window position XY on monitor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWindowPosition();

	// Get window scale DPI factor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWindowScaleDPI();

	// Get the human-readable, UTF-8 encoded name of the primary monitor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetMonitorName(int32 monitor);

	// Set clipboard text content 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetClipboardText(char8* text);

	// Get clipboard text content 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetClipboardText();

	// Enable waiting for events on EndDrawing(), no automatic event polling 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EnableEventWaiting();

	// Disable waiting for events on EndDrawing(), automatic events polling 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DisableEventWaiting();

	// Swap back buffer with front buffer (screen drawing) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SwapScreenBuffer();

	// Register all input events 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PollInputEvents();

	// Wait for some time (halt program execution) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void WaitTime(double seconds);

	// Shows cursor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ShowCursor();

	// Hides cursor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void HideCursor();

	// Check if cursor is not visible 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsCursorHidden();

	// Enables cursor (unlock cursor) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EnableCursor();

	// Disables cursor (lock cursor) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DisableCursor();

	// Check if cursor is on the screen 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsCursorOnScreen();

	// Set background color (framebuffer clear color) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ClearBackground(Color color);

	// Setup canvas (framebuffer) to start drawing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginDrawing();

	// End canvas drawing and swap buffers (double buffering) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndDrawing();

	// Begin 2D mode with custom camera (2D) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginMode2D(Camera2D camera);

	// Ends 2D mode with custom camera 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndMode2D();

	// Begin 3D mode with custom camera (3D) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginMode3D(Camera3D camera);

	// Ends 3D mode and returns to default 2D orthographic mode 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndMode3D();

	// Begin drawing to render texture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginTextureMode(RenderTexture2D target);

	// Ends drawing to render texture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndTextureMode();

	// Begin custom shader drawing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginShaderMode(Shader shader);

	// End custom shader drawing (use default shader) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndShaderMode();

	// Begin blending mode (alpha, additive, multiplied, subtract, custom) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginBlendMode(int32 mode);

	// End blending mode (reset to default: alpha blending) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndBlendMode();

	// Begin scissor mode (define screen area for following drawing) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginScissorMode(int32 x, int32 y, int32 width, int32 height);

	// End scissor mode 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndScissorMode();

	// Begin stereo rendering (requires VR simulator) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void BeginVrStereoMode(VrStereoConfig config);

	// End stereo rendering (requires VR simulator) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void EndVrStereoMode();

	// Load VR stereo config for VR simulator device parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);

	// Unload VR stereo config 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadVrStereoConfig(VrStereoConfig config);

	// Load shader from files and bind default locations 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Shader LoadShader(char8* vsFileName, char8* fsFileName);

	// Load shader from code strings and bind default locations 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Shader LoadShaderFromMemory(char8* vsCode, char8* fsCode);

	// Get shader uniform location 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetShaderLocation(Shader shader, char8* uniformName);

	// Get shader attribute location 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetShaderLocationAttrib(Shader shader, char8* attribName);

	// Set shader uniform value 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetShaderValue(Shader shader, int32 locIndex, void* value, int32 uniformType);

	// Set shader uniform value vector 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetShaderValueV(Shader shader, int32 locIndex, void* value, int32 uniformType, int32 count);

	// Set shader uniform value (matrix 4x4) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetShaderValueMatrix(Shader shader, int32 locIndex, Matrix mat);

	// Set shader uniform value for texture (sampler2d) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetShaderValueTexture(Shader shader, int32 locIndex, Texture2D texture);

	// Unload shader from GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadShader(Shader shader);

	// Get a ray trace from mouse position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Ray GetMouseRay(Vector2 mousePosition, Camera camera);

	// Get camera transform matrix (view matrix) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Matrix GetCameraMatrix(Camera camera);

	// Get camera 2d transform matrix 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Matrix GetCameraMatrix2D(Camera2D camera);

	// Get the screen space position for a 3d world space position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreen(Vector3 position, Camera camera);

	// Get the world space position for a 2d camera screen space position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);

	// Get size position for a 3d world space position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int32 width, int32 height);

	// Get the screen space position for a 2d camera world space position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);

	// Set target FPS (maximum) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetTargetFPS(int32 fps);

	// Get current FPS 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetFPS();

	// Get time in seconds for last frame drawn (delta time) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetFrameTime();

	// Get elapsed time in seconds since InitWindow() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern double GetTime();

	// Get a random value between min and max (both included) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetRandomValue(int32 min, int32 max);

	// Set the seed for the random number generator 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetRandomSeed(uint32 seed);

	// Takes a screenshot of current screen (filename extension defines format) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void TakeScreenshot(char8* fileName);

	// Setup init configuration flags (view FLAGS) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetConfigFlags(uint32 flags);

	// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...) 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void TraceLog(int32 logLevel, char8* text, ... args);

	// Set the current threshold (minimum) log level 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetTraceLogLevel(int32 logLevel);

	// Internal memory allocator 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void* MemAlloc(int32 size);

	// Internal memory reallocator 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void* MemRealloc(void * ptr, int32 size);

	// Internal memory free 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void MemFree(void * ptr);

	// Open URL with default system browser (if available) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void OpenURL(char8* url);

	// Set custom trace log 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetTraceLogCallback(TraceLogCallback callback);

	// Set custom file binary data loader 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetLoadFileDataCallback(LoadFileDataCallback callback);

	// Set custom file binary data saver 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetSaveFileDataCallback(SaveFileDataCallback callback);

	// Set custom file text data loader 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetLoadFileTextCallback(LoadFileTextCallback callback);

	// Set custom file text data saver 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetSaveFileTextCallback(SaveFileTextCallback callback);

	// Load file data as byte array (read) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern uint8* LoadFileData(char8* fileName, uint32 * bytesRead);

	// Unload file data allocated by LoadFileData() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadFileData(uint8* data);

	// Save data to file from byte array (write), returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool SaveFileData(char8* fileName, void * data, uint32 bytesToWrite);

	// Export data to code (.h), returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportDataAsCode(char8* data, uint32 size, char8* fileName);

	// Load text data from file (read), returns a '\0' terminated string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* LoadFileText(char8* fileName);

	// Unload file text data allocated by LoadFileText() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadFileText(char8* text);

	// Save text data to file (write), string must be '\0' terminated, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool SaveFileText(char8* fileName, char8* text);

	// Check if file exists 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool FileExists(char8* fileName);

	// Check if a directory path exists 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool DirectoryExists(char8* dirPath);

	// Check file extension (including point: .png, .wav) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsFileExtension(char8* fileName, char8* ext);

	// Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetFileLength(char8* fileName);

	// Get pointer to extension for a filename string (includes dot: '.png') 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8*  GetFileExtension(char8* fileName);

	// Get pointer to filename for a path string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetFileName(char8* filePath);

	// Get filename string without extension (uses static string) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetFileNameWithoutExt(char8* filePath);

	// Get full path for a given fileName with path (uses static string) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetDirectoryPath(char8* filePath);

	// Get previous directory path for a given path (uses static string) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetPrevDirectoryPath(char8* dirPath);

	// Get current working directory (uses static string) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetWorkingDirectory();

	// Get the directory if the running application (uses static string) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetApplicationDirectory();

	// Change working directory, return true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ChangeDirectory(char8* dir);

	// Check if a given path is a file or a directory 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsPathFile(char8* path);

	// Load directory filepaths 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern FilePathList LoadDirectoryFiles(char8* dirPath);

	// Load directory filepaths with extension filtering and recursive directory scan 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern FilePathList LoadDirectoryFilesEx(char8* basePath, char8* filter, bool scanSubdirs);

	// Unload filepaths 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadDirectoryFiles(FilePathList files);

	// Check if a file has been dropped into window 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsFileDropped();

	// Load dropped filepaths 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern FilePathList LoadDroppedFiles();

	// Unload dropped filepaths 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadDroppedFiles(FilePathList files);

	// Get file modification time (last write time) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetFileModTime(char8* fileName);

	// Compress data (DEFLATE algorithm), memory must be MemFree() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern uint8* CompressData(uint8* data, int32 dataSize, int32 * compDataSize);

	// Decompress data (DEFLATE algorithm), memory must be MemFree() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern uint8* DecompressData(uint8* compData, int32 compDataSize, int32 * dataSize);

	// Encode data to Base64 string, memory must be MemFree() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* EncodeDataBase64(uint8* data, int32 dataSize, int32 * outputSize);

	// Decode Base64 string data, memory must be MemFree() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern uint8* DecodeDataBase64(uint8* data, int32 * outputSize);

	// Check if a key has been pressed once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsKeyPressed(int32 key);

	// Check if a key is being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsKeyDown(int32 key);

	// Check if a key has been released once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsKeyReleased(int32 key);

	// Check if a key is NOT being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsKeyUp(int32 key);

	// Set a custom key to exit program (default is ESC) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetExitKey(int32 key);

	// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetKeyPressed();

	// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetCharPressed();

	// Check if a gamepad is available 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGamepadAvailable(int32 gamepad);

	// Get gamepad internal name id 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* GetGamepadName(int32 gamepad);

	// Check if a gamepad button has been pressed once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGamepadButtonPressed(int32 gamepad, int32 button);

	// Check if a gamepad button is being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGamepadButtonDown(int32 gamepad, int32 button);

	// Check if a gamepad button has been released once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGamepadButtonReleased(int32 gamepad, int32 button);

	// Check if a gamepad button is NOT being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGamepadButtonUp(int32 gamepad, int32 button);

	// Get the last gamepad button pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetGamepadButtonPressed();

	// Get gamepad axis count for a gamepad 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetGamepadAxisCount(int32 gamepad);

	// Get axis movement value for a gamepad axis 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetGamepadAxisMovement(int32 gamepad, int32 axis);

	// Set internal gamepad mappings (SDL_GameControllerDB) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 SetGamepadMappings(char8* mappings);

	// Check if a mouse button has been pressed once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsMouseButtonPressed(int32 button);

	// Check if a mouse button is being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsMouseButtonDown(int32 button);

	// Check if a mouse button has been released once 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsMouseButtonReleased(int32 button);

	// Check if a mouse button is NOT being pressed 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsMouseButtonUp(int32 button);

	// Get mouse position X 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMouseX();

	// Get mouse position Y 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetMouseY();

	// Get mouse position XY 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetMousePosition();

	// Get mouse delta between frames 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetMouseDelta();

	// Set mouse position XY 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMousePosition(int32 x, int32 y);

	// Set mouse offset 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMouseOffset(int32 offsetX, int32 offsetY);

	// Set mouse scaling 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMouseScale(float scaleX, float scaleY);

	// Get mouse wheel movement for X or Y, whichever is larger 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetMouseWheelMove();

	// Get mouse wheel movement for both X and Y 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetMouseWheelMoveV();

	// Set mouse cursor 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMouseCursor(int32 cursor);

	// Get touch position X for touch point32 0 (relative to screen size) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetTouchX();

	// Get touch position Y for touch point32 0 (relative to screen size) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetTouchY();

	// Get touch position XY for a touch point32 index (relative to screen size) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetTouchPosition(int32 index);

	// Get touch point32 identifier for given index 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetTouchPointId(int32 index);

	// Get number of touch points 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetTouchPointCount();

	// Enable a set of gestures using flags 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetGesturesEnabled(uint32 flags);

	// Check if a gesture have been detected 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsGestureDetected(int32 gesture);

	// Get latest detected gesture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetGestureDetected();

	// Get gesture hold time in milliseconds 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetGestureHoldDuration();

	// Get gesture drag vector 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetGestureDragVector();

	// Get gesture drag angle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetGestureDragAngle();

	// Get gesture pinch delta 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 GetGesturePinchVector();

	// Get gesture pinch angle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetGesturePinchAngle();

	// Set camera mode (multiple camera modes available) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetCameraMode(Camera camera, int32 mode);

	// Update camera position for selected mode 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateCamera(Camera * camera);

	// Set camera pan key to combine with mouse movement (free camera) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetCameraPanControl(int32 keyPan);

	// Set camera alt key to combine with mouse movement (free camera) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetCameraAltControl(int32 keyAlt);

	// Set camera smooth zoom key to combine with mouse (free camera) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetCameraSmoothZoomControl(int32 keySmoothZoom);

	// Set camera move controls (1st person and 3rd person cameras) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetCameraMoveControls(int32 keyFront, int32 keyBack, int32 keyRight, int32 keyLeft, int32 keyUp, int32 keyDown);

	// Set texture and rectangle to be used on shapes drawing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetShapesTexture(Texture2D texture, Rectangle source);

	// Draw a pixel 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPixel(int32 posX, int32 posY, Color color);

	// Draw a pixel (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPixelV(Vector2 position, Color color);

	// Draw a line 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLine(int32 startPosX, int32 startPosY, int32 endPosX, int32 endPosY, Color color);

	// Draw a line (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);

	// Draw a line defining thickness 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);

	// Draw a line using cubic-bezier curves in-out 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);

	// Draw line using quadratic bezier curves with a control point32 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color);

	// Draw line using cubic bezier curves with 2 control points 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineBezierCubic(Vector2 startPos, Vector2 endPos, Vector2 startControlPos, Vector2 endControlPos, float thick, Color color);

	// Draw lines sequence 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLineStrip(Vector2 * points, int32 pointCount, Color color);

	// Draw a color-filled circle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircle(int32 centerX, int32 centerY, float radius, Color color);

	// Draw a piece of a circle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw circle sector outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw a gradient-filled circle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleGradient(int32 centerX, int32 centerY, float radius, Color color1, Color color2);

	// Draw a color-filled circle (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleV(Vector2 center, float radius, Color color);

	// Draw circle outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircleLines(int32 centerX, int32 centerY, float radius, Color color);

	// Draw ellipse 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawEllipse(int32 centerX, int32 centerY, float radiusH, float radiusV, Color color);

	// Draw ellipse outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawEllipseLines(int32 centerX, int32 centerY, float radiusH, float radiusV, Color color);

	// Draw ring 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw ring outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int32 segments, Color color);

	// Draw a color-filled rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangle(int32 posX, int32 posY, int32 width, int32 height, Color color);

	// Draw a color-filled rectangle (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleV(Vector2 position, Vector2 size, Color color);

	// Draw a color-filled rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleRec(Rectangle rec, Color color);

	// Draw a color-filled rectangle with pro parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);

	// Draw a vertical-gradient-filled rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleGradientV(int32 posX, int32 posY, int32 width, int32 height, Color color1, Color color2);

	// Draw a horizontal-gradient-filled rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleGradientH(int32 posX, int32 posY, int32 width, int32 height, Color color1, Color color2);

	// Draw a gradient-filled rectangle with custom vertex colors 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);

	// Draw rectangle outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleLines(int32 posX, int32 posY, int32 width, int32 height, Color color);

	// Draw rectangle outline with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);

	// Draw rectangle with rounded edges 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleRounded(Rectangle rec, float roundness, int32 segments, Color color);

	// Draw rectangle with rounded edges outline 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRectangleRoundedLines(Rectangle rec, float roundness, int32 segments, float lineThick, Color color);

	// Draw a color-filled triangle (vertex in counter-clockwise order!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

	// Draw triangle outline (vertex in counter-clockwise order!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

	// Draw a triangle fan defined by points (first vertex is the center) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleFan(Vector2 * points, int32 pointCount, Color color);

	// Draw a triangle strip defined by points 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleStrip(Vector2 * points, int32 pointCount, Color color);

	// Draw a regular polygon (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPoly(Vector2 center, int32 sides, float radius, float rotation, Color color);

	// Draw a polygon outline of n sides 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPolyLines(Vector2 center, int32 sides, float radius, float rotation, Color color);

	// Draw a polygon outline of n sides with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPolyLinesEx(Vector2 center, int32 sides, float radius, float rotation, float lineThick, Color color);

	// Check collision between two rectangles 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);

	// Check collision between two circles 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);

	// Check collision between circle and rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);

	// Check if point is inside rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionPointRec(Vector2 point, Rectangle rec);

	// Check if point is inside circle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);

	// Check if point is inside a triangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);

	// Check the collision between two lines defined by two points each, returns collision point by reference 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 * collisionPoint);

	// Check if point32 belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold] 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int32 threshold);

	// Get collision rectangle for two rectangles collision 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);

	// Load image from file into CPU memory (RAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImage(char8* fileName);

	// Load image from RAW file data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImageRaw(char8* fileName, int32 width, int32 height, int32 format, int32 headerSize);

	// Load image sequence from file (frames appended to image.data) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImageAnim(char8* fileName, int32 * frames);

	// Load image from memory buffer, fileType refers to extension: i.e. '.png' 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImageFromMemory(char8* fileType, uint8* fileData, int32 dataSize);

	// Load image from GPU texture data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImageFromTexture(Texture2D texture);

	// Load image from screen buffer and (screenshot) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image LoadImageFromScreen();

	// Unload image from CPU memory (RAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadImage(Image image);

	// Export image data to file, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportImage(Image image, char8* fileName);

	// Export image as code file defining an array of bytes, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportImageAsCode(Image image, char8* fileName);

	// Generate image: plain color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageColor(int32 width, int32 height, Color color);

	// Generate image: vertical gradient 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageGradientV(int32 width, int32 height, Color top, Color bottom);

	// Generate image: horizontal gradient 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageGradientH(int32 width, int32 height, Color left, Color right);

	// Generate image: radial gradient 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageGradientRadial(int32 width, int32 height, float density, Color inner, Color outer);

	// Generate image: checked 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageChecked(int32 width, int32 height, int32 checksX, int32 checksY, Color col1, Color col2);

	// Generate image: white noise 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageWhiteNoise(int32 width, int32 height, float factor);

	// Generate image: cellular algorithm, bigger tileSize means bigger cells 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageCellular(int32 width, int32 height, int32 tileSize);

	// Create an image duplicate (useful for transformations) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image ImageCopy(Image image);

	// Create an image from another image piece 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image ImageFromImage(Image image, Rectangle rec);

	// Create an image from text (default font) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image ImageText(char8* text, int32 fontSize, Color color);

	// Create an image from text (custom sprite font) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image ImageTextEx(Font font, char8* text, float fontSize, float spacing, Color tint);

	// Convert image data to desired format 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageFormat(Image * image, int32 newFormat);

	// Convert image to POT (power-of-two) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageToPOT(Image * image, Color fill);

	// Crop an image to a defined rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageCrop(Image * image, Rectangle crop);

	// Crop image depending on alpha value 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageAlphaCrop(Image * image, float threshold);

	// Clear alpha channel to desired color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageAlphaClear(Image * image, Color color, float threshold);

	// Apply alpha mask to image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageAlphaMask(Image * image, Image alphaMask);

	// Premultiply alpha channel 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageAlphaPremultiply(Image * image);

	// Resize image (Bicubic scaling algorithm) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageResize(Image * image, int32 newWidth, int32 newHeight);

	// Resize image (Nearest-Neighbor scaling algorithm) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageResizeNN(Image * image, int32 newWidth, int32 newHeight);

	// Resize canvas and fill with color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageResizeCanvas(Image * image, int32 newWidth, int32 newHeight, int32 offsetX, int32 offsetY, Color fill);

	// Compute all mipmap levels for a provided image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageMipmaps(Image * image);

	// Dither image data to 16bpp or lower (Floyd-Steinberg dithering) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDither(Image * image, int32 rBpp, int32 gBpp, int32 bBpp, int32 aBpp);

	// Flip image vertically 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageFlipVertical(Image * image);

	// Flip image horizontally 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageFlipHorizontal(Image * image);

	// Rotate image clockwise 90deg 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageRotateCW(Image * image);

	// Rotate image counter-clockwise 90deg 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageRotateCCW(Image * image);

	// Modify image color: tint 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorTint(Image * image, Color color);

	// Modify image color: invert 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorInvert(Image * image);

	// Modify image color: grayscale 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorGrayscale(Image * image);

	// Modify image color: contrast (-100 to 100) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorContrast(Image * image, float contrast);

	// Modify image color: brightness (-255 to 255) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorBrightness(Image * image, int32 brightness);

	// Modify image color: replace color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageColorReplace(Image * image, Color color, Color replace);

	// Load color data from image as a Color array (RGBA - 32bit) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color* LoadImageColors(Image image);

	// Load colors palette from image as a Color array (RGBA - 32bit) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color* LoadImagePalette(Image image, int32 maxPaletteSize, int32 * colorCount);

	// Unload color data loaded with LoadImageColors() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadImageColors(Color * colors);

	// Unload colors palette loaded with LoadImagePalette() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadImagePalette(Color * colors);

	// Get image alpha border rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Rectangle GetImageAlphaBorder(Image image, float threshold);

	// Get image pixel color at (x, y) position 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color GetImageColor(Image image, int32 x, int32 y);

	// Clear image background with given color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageClearBackground(Image * dst, Color color);

	// Draw pixel within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawPixel(Image * dst, int32 posX, int32 posY, Color color);

	// Draw pixel within an image (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawPixelV(Image * dst, Vector2 position, Color color);

	// Draw line within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawLine(Image * dst, int32 startPosX, int32 startPosY, int32 endPosX, int32 endPosY, Color color);

	// Draw line within an image (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawLineV(Image * dst, Vector2 start, Vector2 end, Color color);

	// Draw circle within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawCircle(Image * dst, int32 centerX, int32 centerY, int32 radius, Color color);

	// Draw circle within an image (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawCircleV(Image * dst, Vector2 center, int32 radius, Color color);

	// Draw rectangle within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawRectangle(Image * dst, int32 posX, int32 posY, int32 width, int32 height, Color color);

	// Draw rectangle within an image (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawRectangleV(Image * dst, Vector2 position, Vector2 size, Color color);

	// Draw rectangle within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawRectangleRec(Image * dst, Rectangle rec, Color color);

	// Draw rectangle lines within an image 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawRectangleLines(Image * dst, Rectangle rec, int32 thick, Color color);

	// Draw a source image within a destination image (tint applied to source) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDraw(Image * dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);

	// Draw text (using default font) within an image (destination) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawText(Image * dst, char8* text, int32 posX, int32 posY, int32 fontSize, Color color);

	// Draw text (custom sprite font) within an image (destination) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ImageDrawTextEx(Image * dst, Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);

	// Load texture from file into GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Texture2D LoadTexture(char8* fileName);

	// Load texture from image data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Texture2D LoadTextureFromImage(Image image);

	// Load cubemap from image, multiple image cubemap layouts supported 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern TextureCubemap LoadTextureCubemap(Image image, int32 layout);

	// Load texture for rendering (framebuffer) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RenderTexture2D LoadRenderTexture(int32 width, int32 height);

	// Unload texture from GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadTexture(Texture2D texture);

	// Unload render texture from GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadRenderTexture(RenderTexture2D target);

	// Update GPU texture with new data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateTexture(Texture2D texture, void* pixels);

	// Update GPU texture rectangle with new data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateTextureRec(Texture2D texture, Rectangle rec, void* pixels);

	// Generate GPU mipmaps for a texture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void GenTextureMipmaps(Texture2D * texture);

	// Set texture scaling filter mode 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetTextureFilter(Texture2D texture, int32 filter);

	// Set texture wrapping mode 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetTextureWrap(Texture2D texture, int32 wrap);

	// Draw a Texture2D 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTexture(Texture2D texture, int32 posX, int32 posY, Color tint);

	// Draw a Texture2D with position defined as Vector2 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureV(Texture2D texture, Vector2 position, Color tint);

	// Draw a Texture2D with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);

	// Draw a part of a texture defined by a rectangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);

	// Draw texture quad with tiling and offset parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);

	// Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest. 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureTiled(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint);

	// Draw a part of a texture defined by a rectangle with 'pro' parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);

	// Draws a texture (or part of it) that stretches or shrinks nicely 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint);

	// Draw a textured polygon 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTexturePoly(Texture2D texture, Vector2 center, Vector2 * points, Vector2 * texcoords, int32 pointCount, Color tint);

	// Get color with alpha applied, alpha goes from 0.0f to 1.0f 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color Fade(Color color, float alpha);

	// Get hexadecimal value for a Color 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 ColorToInt(Color color);

	// Get Color normalized as float [0..1] 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector4 ColorNormalize(Color color);

	// Get Color from normalized values [0..1] 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color ColorFromNormalized(Vector4 normalized);

	// Get HSV values for a Color, hue [0..360], saturation/value [0..1] 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector3 ColorToHSV(Color color);

	// Get a Color from HSV values, hue [0..360], saturation/value [0..1] 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color ColorFromHSV(float hue, float saturation, float value);

	// Get color with alpha applied, alpha goes from 0.0f to 1.0f 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color ColorAlpha(Color color, float alpha);

	// Get src alpha-blended into dst color with tint 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color ColorAlphaBlend(Color dst, Color src, Color tint);

	// Get Color structure from hexadecimal value 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color GetColor(uint32 hexValue);

	// Get Color from a source pixel pointer of certain format 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Color GetPixelColor(void * srcPtr, int32 format);

	// Set color formatted into destination pixel pointer 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetPixelColor(void * dstPtr, Color color, int32 format);

	// Get pixel data size in bytes for certain format 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetPixelDataSize(int32 width, int32 height, int32 format);

	// Get the default Font 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Font GetFontDefault();

	// Load font from file into GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Font LoadFont(char8* fileName);

	// Load font from file with extended parameters, use NULL for fontChars and 0 for glyphCount to load the default character set 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Font LoadFontEx(char8* fileName, int32 fontSize, int32 * fontChars, int32 glyphCount);

	// Load font from Image (XNA style) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Font LoadFontFromImage(Image image, Color key, int32 firstChar);

	// Load font from memory buffer, fileType refers to extension: i.e. '.ttf' 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Font LoadFontFromMemory(char8* fileType, uint8* fileData, int32 dataSize, int32 fontSize, int32 * fontChars, int32 glyphCount);

	// Load font data for further use 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern GlyphInfo* LoadFontData(uint8* fileData, int32 dataSize, int32 fontSize, int32 * fontChars, int32 glyphCount, int32 type);

	// Generate image font atlas using chars info 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Image GenImageFontAtlas(GlyphInfo * chars, Rectangle ** recs, int32 glyphCount, int32 fontSize, int32 padding, int32 packMethod);

	// Unload font chars info data (RAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadFontData(GlyphInfo * chars, int32 glyphCount);

	// Unload font from GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadFont(Font font);

	// Export font as code file, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportFontAsCode(Font font, char8* fileName);

	// Draw current FPS 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawFPS(int32 posX, int32 posY);

	// Draw text (using default font) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawText(char8* text, int32 posX, int32 posY, int32 fontSize, Color color);

	// Draw text using font and additional parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextEx(Font font, char8* text, Vector2 position, float fontSize, float spacing, Color tint);

	// Draw text using Font and pro parameters (rotation) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextPro(Font font, char8* text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint);

	// Draw one character (codepoint) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextCodepoint(Font font, int32 codepoint, Vector2 position, float fontSize, Color tint);

	// Draw multiple character (codepoint) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTextCodepoints(Font font, int32* codepoints, int32 count, Vector2 position, float fontSize, float spacing, Color tint);

	// Measure string width for default font 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 MeasureText(char8* text, int32 fontSize);

	// Measure string size for Font 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Vector2 MeasureTextEx(Font font, char8* text, float fontSize, float spacing);

	// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetGlyphIndex(Font font, int32 codepoint);

	// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern GlyphInfo GetGlyphInfo(Font font, int32 codepoint);

	// Get glyph rectangle in font atlas for a codepoint32 (unicode character), fallback to '?' if not found 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Rectangle GetGlyphAtlasRec(Font font, int32 codepoint);

	// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int* LoadCodepoints(char8* text, int32 * count);

	// Unload codepoints data from memory 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadCodepoints(int32 * codepoints);

	// Get total number of codepoints in a UTF-8 encoded string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetCodepointCount(char8* text);

	// Get next codepoint32 in a UTF-8 encoded string, 0x3f('?') is returned on failure 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetCodepoint(char8* text, int32 * bytesProcessed);

	// Encode one codepoint32 into UTF-8 byte array (array length returned as parameter) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* CodepointToUTF8(int32 codepoint, int32 * byteSize);

	// Encode text as codepoints array into UTF-8 text string (WARNING: memory must be freed!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextCodepointsToUTF8(int32 * codepoints, int32 length);

	// Copy one string to another, returns bytes copied 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 TextCopy(char8* dst, char8* src);

	// Check if two text string are equal 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool TextIsEqual(char8* text1, char8* text2);

	// Get text length, checks for '\0' ending 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern uint32 TextLength(char8* text);

	// Text formatting with variables (sprintf() style) 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern char8* TextFormat(char8* text, ... args);

	// Get a piece of a text string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextSubtext(char8* text, int32 position, int32 length);

	// Replace text string (WARNING: memory must be freed!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextReplace(char8* text, char8* replace, char8* by);

	// Insert text in a position (WARNING: memory must be freed!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextInsert(char8* text, char8* insert, int32 position);

	// Join text strings with delimiter 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextJoin(char8** textList, int32 count, char8* delimiter);

	// Split text into multiple strings 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8** TextSplit(char8* text, char8 delimiter, int32 * count);

	// Append text at specific position and move cursor! 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void TextAppend(char8* text, char8* append_, int32 * position);

	// Find first text occurrence within a string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 TextFindIndex(char8* text, char8* find);

	// Get upper case version of provided string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextToUpper(char8* text);

	// Get lower case version of provided string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextToLower(char8* text);

	// Get Pascal case notation version of provided string 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern char8* TextToPascal(char8* text);

	// Get integer value from text (negative values not supported) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 TextToInteger(char8* text);

	// Draw a line in 3D world space 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);

	// Draw a point32 in 3D space, actually a small line 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPoint3D(Vector3 position, Color color);

	// Draw a circle in 3D world space 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);

	// Draw a color-filled triangle (vertex in counter-clockwise order!) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);

	// Draw a triangle strip defined by points 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawTriangleStrip3D(Vector3 * points, int32 pointCount, Color color);

	// Draw cube 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCube(Vector3 position, float width, float height, float length, Color color);

	// Draw cube (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeV(Vector3 position, Vector3 size, Color color);

	// Draw cube wires 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);

	// Draw cube wires (Vector version) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);

	// Draw cube textured 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);

	// Draw cube with a region of a texture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCubeTextureRec(Texture2D texture, Rectangle source, Vector3 position, float width, float height, float length, Color color);

	// Draw sphere 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawSphere(Vector3 centerPos, float radius, Color color);

	// Draw sphere with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawSphereEx(Vector3 centerPos, float radius, int32 rings, int32 slices, Color color);

	// Draw sphere wires 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawSphereWires(Vector3 centerPos, float radius, int32 rings, int32 slices, Color color);

	// Draw a cylinder/cone 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int32 slices, Color color);

	// Draw a cylinder with base at startPos and top at endPos 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int32 sides, Color color);

	// Draw a cylinder/cone wires 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int32 slices, Color color);

	// Draw a cylinder wires with base at startPos and top at endPos 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int32 sides, Color color);

	// Draw a plane XZ 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);

	// Draw a ray line 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawRay(Ray ray, Color color);

	// Draw a grid (centered at (0, 0, 0)) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawGrid(int32 slices, float spacing);

	// Load model from files (meshes and materials) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Model LoadModel(char8* fileName);

	// Load model from generated mesh (default material) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Model LoadModelFromMesh(Mesh mesh);

	// Unload model (including meshes) from memory (RAM and/or VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadModel(Model model);

	// Unload model (but not meshes) from memory (RAM and/or VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadModelKeepMeshes(Model model);

	// Compute model bounding box limits (considers all meshes) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern BoundingBox GetModelBoundingBox(Model model);

	// Draw a model (with texture if set) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawModel(Model model, Vector3 position, float scale, Color tint);

	// Draw a model with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

	// Draw a model wires (with texture if set) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawModelWires(Model model, Vector3 position, float scale, Color tint);

	// Draw a model wires (with texture if set) with extended parameters 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);

	// Draw bounding box (wires) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawBoundingBox(BoundingBox box_, Color color);

	// Draw a billboard texture 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint);

	// Draw a billboard texture defined by source 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);

	// Draw a billboard texture defined by source and rotation 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);

	// Upload mesh vertex data in GPU and provide VAO/VBO ids 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UploadMesh(Mesh * mesh, bool dynamic);

	// Update mesh vertex data in GPU for a specific buffer index 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateMeshBuffer(Mesh mesh, int32 index, void* data, int32 dataSize, int32 offset);

	// Unload mesh data from CPU and GPU 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadMesh(Mesh mesh);

	// Draw a 3d mesh with material and transform 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawMesh(Mesh mesh, Material material, Matrix transform);

	// Draw multiple mesh instances with material and different transforms 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void DrawMeshInstanced(Mesh mesh, Material material, Matrix * transforms, int32 instances);

	// Export mesh data to file, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportMesh(Mesh mesh, char8* fileName);

	// Compute mesh bounding box limits 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern BoundingBox GetMeshBoundingBox(Mesh mesh);

	// Compute mesh tangents 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void GenMeshTangents(Mesh * mesh);

	// Generate polygonal mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshPoly(int32 sides, float radius);

	// Generate plane mesh (with subdivisions) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshPlane(float width, float length, int32 resX, int32 resZ);

	// Generate cuboid mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshCube(float width, float height, float length);

	// Generate sphere mesh (standard sphere) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshSphere(float radius, int32 rings, int32 slices);

	// Generate half-sphere mesh (no bottom cap) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshHemiSphere(float radius, int32 rings, int32 slices);

	// Generate cylinder mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshCylinder(float radius, float height, int32 slices);

	// Generate cone/pyramid mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshCone(float radius, float height, int32 slices);

	// Generate torus mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshTorus(float radius, float size, int32 radSeg, int32 sides);

	// Generate trefoil knot mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshKnot(float radius, float size, int32 radSeg, int32 sides);

	// Generate heightmap mesh from image data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshHeightmap(Image heightmap, Vector3 size);

	// Generate cubes-based map mesh from image data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);

	// Load materials from model file 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Material* LoadMaterials(char8* fileName, int32 * materialCount);

	// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Material LoadMaterialDefault();

	// Unload material from GPU memory (VRAM) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadMaterial(Material material);

	// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMaterialTexture(Material * material, int32 mapType, Texture2D texture);

	// Set material for a mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetModelMeshMaterial(Model * model, int32 meshId, int32 materialId);

	// Load model animations from file 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern ModelAnimation* LoadModelAnimations(char8* fileName, uint32 * animCount);

	// Update model animation pose 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateModelAnimation(Model model, ModelAnimation anim, int32 frame);

	// Unload animation data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadModelAnimation(ModelAnimation anim);

	// Unload animation array data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadModelAnimations(ModelAnimation * animations, uint32 count);

	// Check model animation skeleton match 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsModelAnimationValid(Model model, ModelAnimation anim);

	// Check collision between two spheres 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2);

	// Check collision between two bounding boxes 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);

	// Check collision between box and sphere 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool CheckCollisionBoxSphere(BoundingBox box_, Vector3 center, float radius);

	// Get collision info between ray and sphere 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);

	// Get collision info between ray and box 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RayCollision GetRayCollisionBox(Ray ray, BoundingBox box_);

	// Get collision info between ray and mesh 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);

	// Get collision info between ray and triangle 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);

	// Get collision info between ray and quad 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4);

	// Initialize audio device and context 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void InitAudioDevice();

	// Close the audio device and context 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void CloseAudioDevice();

	// Check if audio device has been initialized successfully 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsAudioDeviceReady();

	// Set master volume (listener) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMasterVolume(float volume);

	// Load wave data from file 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Wave LoadWave(char8* fileName);

	// Load wave from memory buffer, fileType refers to extension: i.e. '.wav' 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Wave LoadWaveFromMemory(char8* fileType, uint8* fileData, int32 dataSize);

	// Load sound from file 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Sound LoadSound(char8* fileName);

	// Load sound from wave data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Sound LoadSoundFromWave(Wave wave);

	// Update sound buffer with new data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateSound(Sound sound, void* data, int32 sampleCount);

	// Unload wave data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadWave(Wave wave);

	// Unload sound 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadSound(Sound sound);

	// Export wave data to file, returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportWave(Wave wave, char8* fileName);

	// Export wave sample data to code (.h), returns true on success 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportWaveAsCode(Wave wave, char8* fileName);

	// Play a sound 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PlaySound(Sound sound);

	// Stop playing a sound 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void StopSound(Sound sound);

	// Pause a sound 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PauseSound(Sound sound);

	// Resume a paused sound 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ResumeSound(Sound sound);

	// Play a sound (using multichannel buffer pool) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PlaySoundMulti(Sound sound);

	// Stop any sound playing (using multichannel buffer pool) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void StopSoundMulti();

	// Get number of sounds playing in the multichannel 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern int32 GetSoundsPlaying();

	// Check if a sound is currently playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsSoundPlaying(Sound sound);

	// Set volume for a sound (1.0 is max level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetSoundVolume(Sound sound, float volume);

	// Set pitch for a sound (1.0 is base level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetSoundPitch(Sound sound, float pitch);

	// Set pan for a sound (0.5 is center) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetSoundPan(Sound sound, float pan);

	// Copy a wave to a new wave 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Wave WaveCopy(Wave wave);

	// Crop a wave to defined samples range 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void WaveCrop(Wave * wave, int32 initSample, int32 finalSample);

	// Convert wave data to desired format 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void WaveFormat(Wave * wave, int32 sampleRate, int32 sampleSize, int32 channels);

	// Load samples data from wave as a 32bit float data array 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float* LoadWaveSamples(Wave wave);

	// Unload samples data loaded with LoadWaveSamples() 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadWaveSamples(float * samples);

	// Load music stream from file 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Music LoadMusicStream(char8* fileName);

	// Load music stream from data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern Music LoadMusicStreamFromMemory(char8* fileType, uint8* data, int32 dataSize);

	// Unload music stream 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadMusicStream(Music music);

	// Start music playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PlayMusicStream(Music music);

	// Check if music is playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsMusicStreamPlaying(Music music);

	// Updates buffers for music streaming 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateMusicStream(Music music);

	// Stop music playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void StopMusicStream(Music music);

	// Pause music playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PauseMusicStream(Music music);

	// Resume playing paused music 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ResumeMusicStream(Music music);

	// Seek music to a position (in seconds) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SeekMusicStream(Music music, float position);

	// Set volume for music (1.0 is max level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMusicVolume(Music music, float volume);

	// Set pitch for a music (1.0 is base level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMusicPitch(Music music, float pitch);

	// Set pan for a music (0.5 is center) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetMusicPan(Music music, float pan);

	// Get music time length (in seconds) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetMusicTimeLength(Music music);

	// Get current music time played (in seconds) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern float GetMusicTimePlayed(Music music);

	// Load audio stream (to stream raw audio pcm data) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern AudioStream LoadAudioStream(uint32 sampleRate, uint32 sampleSize, uint32 channels);

	// Unload audio stream and free memory 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UnloadAudioStream(AudioStream stream);

	// Update audio stream buffers with data 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void UpdateAudioStream(AudioStream stream, void* data, int32 frameCount);

	// Check if any audio stream buffers requires refill 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsAudioStreamProcessed(AudioStream stream);

	// Play audio stream 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PlayAudioStream(AudioStream stream);

	// Pause audio stream 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void PauseAudioStream(AudioStream stream);

	// Resume audio stream 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void ResumeAudioStream(AudioStream stream);

	// Check if audio stream is playing 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern bool IsAudioStreamPlaying(AudioStream stream);

	// Stop audio stream 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void StopAudioStream(AudioStream stream);

	// Set volume for audio stream (1.0 is max level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetAudioStreamVolume(AudioStream stream, float volume);

	// Set pitch for audio stream (1.0 is base level) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetAudioStreamPitch(AudioStream stream, float pitch);

	// Set pan for audio stream (0.5 is centered) 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetAudioStreamPan(AudioStream stream, float pan);

	// Default size for new audio streams 
	[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	public static extern void SetAudioStreamBufferSizeDefault(int32 size);

	// Audio thread callback to request new data 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void SetAudioStreamCallback(AudioStream stream, AudioCallback callback);

	// 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor);

	// 
	//[Import("raylib.lib"), CLink, CallingConvention(.Cdecl)]
	//public static extern void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor);


}
