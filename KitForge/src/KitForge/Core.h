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

#define BIT(x) (1 << x)