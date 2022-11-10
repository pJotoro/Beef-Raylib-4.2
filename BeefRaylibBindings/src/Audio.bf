using System;

namespace Raylib;

// AudioStream, custom audio stream 
[CRepr]
public struct AudioStream
{
	public void* buffer;
	public void* processor;
	public uint32 sampleRate;
	public uint32 sampleSize;
	public uint32 channels;

	// Load audio stream (to stream raw audio pcm data) 
	[CallingConvention(.Cdecl), LinkName("LoadAudioStream")]
	public static extern AudioStream Load(uint32 sampleRate, uint32 sampleSize, uint32 channels);

	// Unload audio stream and free memory 
	[CallingConvention(.Cdecl), LinkName("UnloadAudioStream"), NoShow]
	public static extern void Unload(AudioStream stream);
	public void Unload()
	{
		Unload(this);
	}

	// Update audio stream buffers with data 
	[CallingConvention(.Cdecl), LinkName("UpdateAudioStream"), NoShow]
	public static extern void Update(AudioStream stream, void* data, int32 frameCount);
	public void Update(void* data, int32 frameCount)
	{
		Update(this, data, frameCount);
	}

	// Check if any audio stream buffers requires refill 
	[CallingConvention(.Cdecl), LinkName("IsAudioStreamProcessed"), NoShow]
	public static extern bool IsProcessed(AudioStream stream);
	public bool IsProcessed() => IsProcessed(this);

	// Play audio stream 
	[CallingConvention(.Cdecl), LinkName("PlayAudioStream"), NoShow]
	public static extern void Play(AudioStream stream);
	public void Play()
	{
		Play(this);
	}

	// Pause audio stream 
	[CallingConvention(.Cdecl), LinkName("PauseAudioStream"), NoShow]
	public static extern void Pause(AudioStream stream);
	public void Pause()
	{
		Pause(this);
	}

	// Resume audio stream 
	[CallingConvention(.Cdecl), LinkName("ResumeAudioStream"), NoShow]
	public static extern void Resume(AudioStream stream);
	public void Resume()
	{
		Resume(this);
	}

	// Check if audio stream is playing 
	[CallingConvention(.Cdecl), LinkName("IsAudioStreamPlaying"), NoShow]
	public static extern bool IsPlaying(AudioStream stream);
	public bool IsPlaying() => IsPlaying(this);

	// Stop audio stream 
	[CallingConvention(.Cdecl), LinkName("StopAudioStream"), NoShow]
	public static extern void Stop(AudioStream stream);
	public void Stop()
	{
		Stop(this);
	}

	// Set volume for audio stream (1.0 is max level) 
	[CallingConvention(.Cdecl), LinkName("SetAudioStreamVolume"), NoShow]
	public static extern void SetVolume(AudioStream stream, float volume);
	public void SetVolume(float volume)
	{
		SetVolume(this, volume);
	}

	// Set pitch for audio stream (1.0 is base level) 
	[CallingConvention(.Cdecl), LinkName("SetAudioStreamPitch"), NoShow]
	public static extern void SetPitch(AudioStream stream, float pitch);
	public void SetPitch(float pitch)
	{
		SetPitch(this, pitch);
	}

	// Set pan for audio stream (0.5 is centered) 
	[CallingConvention(.Cdecl), LinkName("SetAudioStreamPan"), NoShow]
	public static extern void SetPan(AudioStream stream, float pan);
	public void SetPan(float pan)
	{
		SetPan(this, pan);
	}

	// Default size for new audio streams 
	[CallingConvention(.Cdecl), LinkName("SetAudioStreamBufferSizeDefault")]
	public static extern void SetBufferSizeDefault(int32 size);
}

// Sound 
[CRepr]
public struct Sound
{
	public AudioStream stream;
	public uint32 frameCount;

	// Load sound from file 
	[CallingConvention(.Cdecl), LinkName("LoadSound")]
	public static extern Sound Load(char8* fileName);

	// Load sound from wave data 
	[CallingConvention(.Cdecl), LinkName("LoadSoundFromWave")]
	public static extern Sound Load(Wave wave);

	// Update sound buffer with new data 
	[CallingConvention(.Cdecl), LinkName("UpdateSound"), NoShow]
	public static extern void Update(Sound sound, void* data, int32 sampleCount);
	public void Update(void* data, int32 sampleCount)
	{
		Update(this, data, sampleCount);
	}

	// Unload sound 
	[CallingConvention(.Cdecl), LinkName("UnloadSound"), NoShow]
	public static extern void Unload(Sound sound);
	public void Unload()
	{
		Unload(this);
	}

	// Play a sound 
	[CallingConvention(.Cdecl), LinkName("PlaySound"), NoShow]
	public static extern void Play(Sound sound);
	public void Play()
	{
		Play(this);
	}
	
	// Stop playing a sound 
	[CallingConvention(.Cdecl), LinkName("StopSound"), NoShow]
	public static extern void Stop(Sound sound);
	public void Stop()
	{
		Stop(this);
	}

	// Pause a sound 
	[CallingConvention(.Cdecl), LinkName("PauseSound"), NoShow]
	public static extern void Pause(Sound sound);
	public void Pause()
	{
		Pause(this);
	}

	// Resume a paused sound 
	[CallingConvention(.Cdecl), LinkName("ResumeSound"), NoShow]
	public static extern void Resume(Sound sound);
	public void Resume()
	{
		Resume(this);
	}

	// Play a sound (using multichannel buffer pool) 
	[CallingConvention(.Cdecl), LinkName("PlaySoundMulti"), NoShow]
	public static extern void PlayMulti(Sound sound);
	public void PlayMulti()
	{
		PlayMulti(this);
	}

	// Stop any sound playing (using multichannel buffer pool) 
	[CallingConvention(.Cdecl), LinkName("StopSoundMulti")]
	public static extern void StopMulti();

	// Get number of sounds playing in the multichannel 
	[CallingConvention(.Cdecl), LinkName("GetSoundsPlaying"), NoShow]
	public static extern int32 GetPlaying();
	public static int32 Count
	{
		get
		{
			return GetPlaying();
		}
	}

	// Check if a sound is currently playing 
	[CallingConvention(.Cdecl), LinkName("IsSoundPlaying"), NoShow]
	public static extern bool IsPlaying(Sound sound);
	public bool IsPlaying() => IsPlaying(this);

	// Set volume for a sound (1.0 is max level) 
	[CallingConvention(.Cdecl), LinkName("SetSoundVolume"), NoShow]
	public static extern void SetVolume(Sound sound, float volume);
	public void SetVolume(float volume)
	{
		SetVolume(this, volume);
	}

	// Set pitch for a sound (1.0 is base level) 
	[CallingConvention(.Cdecl), LinkName("SetSoundPitch"), NoShow]
	public static extern void SetPitch(Sound sound, float pitch);
	public void SetPitch(float pitch)
	{
		SetPitch(this, pitch);
	}

	// Set pan for a sound (0.5 is center) 
	[CallingConvention(.Cdecl), LinkName("SetSoundPan"), NoShow]
	public static extern void SetPan(Sound sound, float pan);
	public void SetPan(float pan)
	{
		SetPan(this, pan);
	}
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

	// Load music stream from file 
	[CallingConvention(.Cdecl), LinkName("LoadMusicStream")]
	public static extern Music Load(char8* fileName);

	// Load music stream from data 
	[CallingConvention(.Cdecl), LinkName("LoadMusicStreamFromMemory")]
	public static extern Music Load(char8* fileType, uint8* data, int32 dataSize);

	// Unload music stream 
	[CallingConvention(.Cdecl), LinkName("UnloadMusicStream"), NoShow]
	public static extern void Unload(Music music);
	public void Unload()
	{
		Unload(this);
	}

	// Start music playing 
	[CallingConvention(.Cdecl), LinkName("PlayMusicStream"), NoShow]
	public static extern void Play(Music music);
	public void Play()
	{
		Play(this);
	}

	// Check if music is playing 
	[CallingConvention(.Cdecl), LinkName("IsMusicStreamPlaying"), NoShow]
	public static extern bool IsPlaying(Music music);
	public bool IsPlaying() => IsPlaying(this);

	// Updates buffers for music streaming 
	[CallingConvention(.Cdecl), LinkName("UpdateMusicStream"), NoShow]
	public static extern void Update(Music music);
	public void Update()
	{
		Update(this);
	}

	// Stop music playing 
	[CallingConvention(.Cdecl), LinkName("StopMusicStream"), NoShow]
	public static extern void Stop(Music music);
	public void Stop()
	{
		Stop(this);
	}

	// Pause music playing 
	[CallingConvention(.Cdecl), LinkName("PauseMusicStream"), NoShow]
	public static extern void Pause(Music music);
	public void Pause()
	{
		Pause(this);
	}

	// Resume playing paused music 
	[CallingConvention(.Cdecl), LinkName("ResumeMusicStream"), NoShow]
	public static extern void Resume(Music music);
	public void Resume()
	{
		Resume(this);
	}

	// Seek music to a position (in seconds) 
	[CallingConvention(.Cdecl), LinkName("SeekMusicStream"), NoShow]
	public static extern void Seek(Music music, float position);
	public void Seek(float position)
	{
		Seek(this, position);
	}

	// Set volume for music (1.0 is max level) 
	[CallingConvention(.Cdecl), LinkName("SetMusicVolume"), NoShow]
	public static extern void SetVolume(Music music, float volume);
	public void SetVolume(float volume)
	{
		SetVolume(this, volume);
	}

	// Set pitch for a music (1.0 is base level) 
	[CallingConvention(.Cdecl), LinkName("SetMusicPitch"), NoShow]
	public static extern void SetPitch(Music music, float pitch);
	public void SetPitch(float pitch)
	{
		SetPitch(this, pitch);
	}

	// Set pan for a music (0.5 is center) 
	[CallingConvention(.Cdecl), LinkName("SetMusicPan"), NoShow]
	public static extern void SetPan(Music music, float pan);
	public void SetPan(float pan)
	{
		SetPan(this, pan);
	}

	// Get music time length (in seconds) 
	[CallingConvention(.Cdecl), LinkName("GetMusicTimeLength"), NoShow]
	public static extern float GetTimeLength(Music music);
	public float Length
	{
		get
		{
			return GetTimeLength(this);
		}
	}

	// Get current music time played (in seconds) 
	[CallingConvention(.Cdecl), LinkName("GetMusicTimePlayed"), NoShow]
	public static extern float GetTimePlayed(Music music);
	public float GetTimePlayed() => GetTimePlayed(this);
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

	// Load wave data from file 
	[CallingConvention(.Cdecl), LinkName("LoadWave")]
	public static extern Wave Load(char8* fileName);

	// Load wave from memory buffer, fileType refers to extension: i.e. '.wav' 
	[CallingConvention(.Cdecl), LinkName("LoadWaveFromMemory")]
	public static extern Wave Load(char8* fileType, uint8* fileData, int32 dataSize);

	// Unload wave data 
	[CallingConvention(.Cdecl), LinkName("UnloadWave"), NoShow]
	public static extern void Unload(Wave wave);
	public void Unload()
	{
		Unload(this);
	}

	// Export wave data to file, returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportWave"), NoShow]
	public static extern bool Export(Wave wave, char8* fileName);
	public bool Export(char8* fileName) => Export(this, fileName);

	// Export wave sample data to code (.h), returns true on success 
	[CallingConvention(.Cdecl), LinkName("ExportWaveAsCode"), NoShow]
	public static extern bool ExportAsCode(Wave wave, char8* fileName);
	public bool ExportAsCode(char8* fileName) => ExportAsCode(this, fileName);

	// Copy a wave to a new wave 
	[CallingConvention(.Cdecl), LinkName("WaveCopy"), NoShow]
	public static extern Wave Copy(Wave wave);
	public Wave Copy() => Copy(this);

	// Crop a wave to defined samples range 
	[CallingConvention(.Cdecl), LinkName("WaveCrop"), NoShow]
	public static extern void Crop(Wave * wave, int32 initSample, int32 finalSample);
	public void Crop(int32 initSample, int32 finalSample) mut
	{
		Crop(&this, initSample, finalSample);
	}

	// Convert wave data to desired format 
	[CallingConvention(.Cdecl), LinkName("WaveFormat"), NoShow]
	public static extern void Format(Wave * wave, int32 sampleRate, int32 sampleSize, int32 channels);
	public void Format(int32 sampleRate, int32 sampleSize, int32 channels) mut
	{
		Format(&this, sampleRate, sampleSize, channels);
	}

	// Load samples data from wave as a 32bit float data array 
	[CallingConvention(.Cdecl), LinkName("LoadWaveSamples"), NoShow]
	public static extern float* LoadSamples(Wave wave);
	public float* LoadSamples() => LoadSamples(this);

	// Unload samples data loaded with LoadWaveSamples() 
	[CallingConvention(.Cdecl), LinkName("UnloadWaveSamples")]
	public static extern void UnloadSamples(float * samples);
}

static class AudioDevice
{
	// Initialize audio device and context 
	[CallingConvention(.Cdecl), LinkName("InitAudioDevice")]
	public static extern void Init();

	// Close the audio device and context 
	[CallingConvention(.Cdecl), LinkName("CloseAudioDevice")]
	public static extern void Close();

	// Check if audio device has been initialized successfully 
	[CallingConvention(.Cdecl), LinkName("IsAudioDeviceReady")]
	public static extern bool IsReady();
}

static
{
	// Set master volume (listener) 
	[CLink, CallingConvention(.Cdecl)]
	public static extern void SetMasterVolume(float volume);
}