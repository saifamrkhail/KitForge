#pragma once

#ifdef KITFORGE_PLATFORM_WINDOWS
	#ifdef KITFORGE_BUILD_DLL
		#define KITFORGE_API __declspec(dllexport)
	#else
		#define KITFORGE_API __declspec(dllimport)
	#endif
#else
	#error KitForge only supports Windows!
#endif

#ifdef KITFORGE_ENABLE_ASSERTS
	#define KITFORGE_ASSERT(x, ...) { if(!(x)) { HZ_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define KITFORGE_CORE_ASSERT(x, ...) { if(!(x)) { HZ_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define KITFORGE_ASSERT(x, ...)
	#define KITFORGE_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)