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
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
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

    filter "configurations:Release"
        defines "KITFORGE_RELEASE"
        symbols "On"

    filter "configurations:Dist"
        defines "KITFORGE_DIST"
        symbols "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"

    language "C++"
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
        staticruntime "On"
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
        symbols "On"

    filter "configurations:Dist"
        defines "KITFORGE_DIST"
        symbols "On"
