# Beef-Raylib-4.2

Make sure to set "C Library" to "Dynamic Debug" for debug builds and "Dynamic" for release builds. This includes the corelib.

I have set up the bindings to choose the correct version of raylib (debug or release) for you based on whether you're in debug or release mode, so you don't have to worry about that.

There will doubtless be people that dislike these bindings since I've changed the API to be much more beefy, so to speak...

```beef
namespace RaylibBeefGame;
using Raylib;

class Program
{
	public static void Main()
	{
		Window.Init(1280, 720, "Raylib Beef Game");

		FPS.SetTarget(60);

		while (!Window.ShouldClose())
		{
			BeginDrawing();
			ClearBackground(RAYWHITE);
			EndDrawing();
		}
	}
}
```
