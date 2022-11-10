// NOTE(pJotoro): It is recommended that you do not use anything in Misc.bf, since it is all functionality
// better supported by corelib. That said, if for whatever reason you really want to use these functions,
// you absolutely can as they are all public. To incentivize not using these, they are all excluded
// from auto-completion with the NoShow attribute. 

using System;

namespace Raylib;

// File path list 
[CRepr, NoShow]
public struct FilePathList
{
	public uint32 capacity;
	public uint32 count;
	public char8** paths;
}

static
{
	// Internal memory allocator 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void* MemAlloc(int32 size);

	// Internal memory reallocator 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void* MemRealloc(void * ptr, int32 size);

	// Internal memory free 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void MemFree(void * ptr);

	// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int* LoadCodepoints(char8* text, int32 * count);

	// Unload codepoints data from memory 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void UnloadCodepoints(int32 * codepoints);

	// Get total number of codepoints in a UTF-8 encoded string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetCodepointCount(char8* text);

	// Get next codepoint32 in a UTF-8 encoded string, 0x3f('?') is returned on failure 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetCodepoint(char8* text, int32 * bytesProcessed);

	// Encode one codepoint32 into UTF-8 byte array (array length returned as parameter) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* CodepointToUTF8(int32 codepoint, int32 * byteSize);

	// Encode text as codepoints array into UTF-8 text string (WARNING: memory must be freed!) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextCodepointsToUTF8(int32 * codepoints, int32 length);

	// Copy one string to another, returns bytes copied 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 TextCopy(char8* dst, char8* src);

	// Check if two text string are equal 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool TextIsEqual(char8* text1, char8* text2);

	// Get text length, checks for '\0' ending 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern uint32 TextLength(char8* text);

	// Text formatting with variables (sprintf() style) 
	//[CLink, CallingConvention(.Cdecl)]
	//public static extern char8* TextFormat(char8* text, ... args);

	// Get a piece of a text string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextSubtext(char8* text, int32 position, int32 length);

	// Replace text string (WARNING: memory must be freed!) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextReplace(char8* text, char8* replace, char8* by);

	// Insert text in a position (WARNING: memory must be freed!) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextInsert(char8* text, char8* insert, int32 position);

	// Join text strings with delimiter 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextJoin(char8** textList, int32 count, char8* delimiter);

	// Split text into multiple strings 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8** TextSplit(char8* text, char8 delimiter, int32 * count);

	// Append text at specific position and move cursor! 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void TextAppend(char8* text, char8* append_, int32 * position);

	// Find first text occurrence within a string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 TextFindIndex(char8* text, char8* find);

	// Get upper case version of provided string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextToUpper(char8* text);

	// Get lower case version of provided string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextToLower(char8* text);

	// Get Pascal case notation version of provided string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* TextToPascal(char8* text);

	// Get integer value from text (negative values not supported) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 TextToInteger(char8* text);

	// Load file data as byte array (read) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern uint8* LoadFileData(char8* fileName, uint32 * bytesRead);

	// Unload file data allocated by LoadFileData() 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void UnloadFileData(uint8* data);

	// Save data to file from byte array (write), returns true on success 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool SaveFileData(char8* fileName, void * data, uint32 bytesToWrite);

	// Export data to code (.h), returns true on success 
	[CLink, CallingConvention(.Cdecl)]
	public static extern bool ExportDataAsCode(char8* data, uint32 size, char8* fileName);

	// Load text data from file (read), returns a '\0' terminated string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* LoadFileText(char8* fileName);

	// Unload file text data allocated by LoadFileText() 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void UnloadFileText(char8* text);

	// Save text data to file (write), string must be '\0' terminated, returns true on success 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool SaveFileText(char8* fileName, char8* text);

	// Check if file exists 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool FileExists(char8* fileName);

	// Check if a directory path exists 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool DirectoryExists(char8* dirPath);

	// Check file extension (including point: .png, .wav) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool IsFileExtension(char8* fileName, char8* ext);

	// Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetFileLength(char8* fileName);

	// Get pointer to extension for a filename string (includes dot: '.png') 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8*  GetFileExtension(char8* fileName);

	// Get pointer to filename for a path string 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetFileName(char8* filePath);

	// Get filename string without extension (uses static string) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetFileNameWithoutExt(char8* filePath);

	// Get full path for a given fileName with path (uses static string) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetDirectoryPath(char8* filePath);

	// Get previous directory path for a given path (uses static string) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetPrevDirectoryPath(char8* dirPath);

	// Get current working directory (uses static string) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetWorkingDirectory();

	// Get the directory if the running application (uses static string) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern char8* GetApplicationDirectory();

	// Change working directory, return true on success 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool ChangeDirectory(char8* dir);

	// Check if a given path is a file or a directory 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool IsPathFile(char8* path);

	// Load directory filepaths 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern FilePathList LoadDirectoryFiles(char8* dirPath);

	// Load directory filepaths with extension filtering and recursive directory scan 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern FilePathList LoadDirectoryFilesEx(char8* basePath, char8* filter, bool scanSubdirs);

	// Unload filepaths 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void UnloadDirectoryFiles(FilePathList files);

	// Check if a file has been dropped into window 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern bool IsFileDropped();

	// Load dropped filepaths 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern FilePathList LoadDroppedFiles();

	// Unload dropped filepaths 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void UnloadDroppedFiles(FilePathList files);

	// Get file modification time (last write time) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetFileModTime(char8* fileName);

	// Get a random value between min and max (both included) 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern int32 GetRandomValue(int32 min, int32 max);

	// Set the seed for the random number generator 
	[CLink, CallingConvention(.Cdecl), NoShow]
	public static extern void SetRandomSeed(uint32 seed);
}