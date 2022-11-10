using System;

namespace Raylib;

public struct Gamepad
{
	public int32 id;

	// Gamepad buttons 
	[AllowDuplicates]
	public enum Button : int32
	{
		UNKNOWN = 0,
		LEFT_FACE_UP = 1,
		LEFT_FACE_RIGHT = 2,
		LEFT_FACE_DOWN = 3,
		LEFT_FACE_LEFT = 4,
		RIGHT_FACE_UP = 5,
		RIGHT_FACE_RIGHT = 6,
		RIGHT_FACE_DOWN = 7,
		RIGHT_FACE_LEFT = 8,
		LEFT_TRIGGER_1 = 9,
		LEFT_TRIGGER_2 = 10,
		RIGHT_TRIGGER_1 = 11,
		RIGHT_TRIGGER_2 = 12,
		MIDDLE_LEFT = 13,
		MIDDLE = 14,
		MIDDLE_RIGHT = 15,
		LEFT_THUMB = 16,
		RIGHT_THUMB = 17,
	}

	// Gamepad axis 
	[AllowDuplicates]
	public enum Axis : int32
	{
		LEFT_X = 0,
		LEFT_Y = 1,
		RIGHT_X = 2,
		RIGHT_Y = 3,
		LEFT_TRIGGER = 4,
		RIGHT_TRIGGER = 5,
	}

	// Check if a gamepad is available 
	[CallingConvention(.Cdecl), LinkName("IsGamepadAvailable"), NoShow]
	public static extern bool IsAvailable(int32 gamepad);
	public bool IsAvailable() { return IsAvailable(id); }

	// Get gamepad internal name id 
	[CallingConvention(.Cdecl), LinkName("GetGamepadName"), NoShow]
	public static extern char8* GetName(int32 gamepad);
	public char8* Name
	{
		get
		{
			return GetName(id);
		}
	}

	// Check if a gamepad button has been pressed once 
	[CallingConvention(.Cdecl), LinkName("IsGamepadButtonPressed"), NoShow]
	public static extern bool IsButtonPressed(int32 gamepad, Button button);
	public bool IsButtonPressed(Button button) { return IsButtonPressed(id, button); }

	// Check if a gamepad button is being pressed 
	[CallingConvention(.Cdecl), LinkName("IsGamepadButtonDown"), NoShow]
	public static extern bool IsButtonDown(int32 gamepad, Button button);
	public bool IsButtonDown(Button button) { return IsButtonDown(id, button); }

	// Check if a gamepad button has been released once 
	[CallingConvention(.Cdecl), LinkName("IsGamepadButtonReleased"), NoShow]
	public static extern bool IsButtonReleased(int32 gamepad, Button button);
	public bool IsButtonReleased(Button button) { return IsButtonReleased(id, button); }

	// Check if a gamepad button is NOT being pressed 
	[CallingConvention(.Cdecl), LinkName("IsGamepadButtonUp"), NoShow]
	public static extern bool IsButtonUp(int32 gamepad, Button button);
	public bool IsButtonUp(Button button) { return IsButtonUp(id, button); }

	// Get the last gamepad button pressed 
	[CallingConvention(.Cdecl), LinkName("GetGamepadButtonPressed")]
	public static extern Button GetButtonPressed();

	// Get gamepad axis count for a gamepad 
	[CallingConvention(.Cdecl), LinkName("GetGamepadAxisCount"), NoShow]
	public static extern int32 GetAxisCount(int32 gamepad);
	public int32 GetAxisCount() { return GetAxisCount(id); }

	// Get axis movement value for a gamepad axis 
	[CallingConvention(.Cdecl), LinkName("GetGamepadAxisMovement"), NoShow]
	public static extern float GetAxisMovement(int32 gamepad, Axis axis);
	public float GetAxisMovement(Axis axis) { return GetAxisMovement(id, axis); }

	// Set internal gamepad mappings (SDL_GameControllerDB) 
	[CallingConvention(.Cdecl), LinkName("SetGamepadMappings")]
	public static extern int32 SetMappings(char8* mappings);
}