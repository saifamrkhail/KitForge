workspace "KitForge"
    startproject "Sandbox"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- inlcude dirs relatie to root folder (solution dir)
IncludeDir = {}
IncludeDir["GLFW"] = "KitForge/vendor/GLFW/include"

include "KitForge/vendor/GLFW"

project "KitForge"
    location "KitForge"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "kitforgepch.h"
    pchsource "KitForge/src/kitforgepch.cpp"

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }

    links 
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        runtime "Debug"
        systemversion "latest"

        defines
        {
            "KITFORGE_PLATFORM_WINDOWS",
            "KITFORGE_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "KITFORGE_DEBUG"
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        defines "KITFORGE_RELEASE"
        optimize "On"
        runtime "Release"

    filter "configurations:Dist"
        defines "KITFORGE_DIST"
        optimize "On"
        runtime "Release"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"

    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "KitForge/vendor/spdlog/include",
        "KitForge/src"
    }

    links
    {
        "KitForge"
    }

    filter "system:windows"
        cppdialect "C++17"
        runtime "Debug"
        systemversion "latest"

        defines
        {
            "KITFORGE_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "KITFORGE_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "KITFORGE_RELEASE"
        optimize "On"
        runtime "Release"

    filter "configurations:Dist"
        defines "KITFORGE_DIST"
        optimize "On"
        runtime "Release"
