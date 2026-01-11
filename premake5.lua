include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"
    location (path.join(project_root, "build"))

    targetdir ("%{bindir}/%{prj.name}")
    objdir ("%{intdir}/%{prj.name}")

    files
    {
       "msdf-atlas-gen/**.h",
       "msdf-atlas-gen/**.hpp",
       "msdf-atlas-gen/**.cpp"
    }

    includedirs
    {
       "msdf-atlas-gen",
       "msdfgen",
       "msdfgen/include",
       "artery-font-format"
    }

    defines
    {
       "_CRT_SECURE_NO_WARNINGS"
    }

    links
    {
       "msdfgen"
    }

    filter "system:linux or system:macosx"
        pic "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:DebugEditor"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:ReleaseEditor"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"

