$solution = "Library.sln"
nuget restore "$solution" -Source "\\NAS\Home\NuGet"
&"$Env:VS2017INSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Debug|x86"
&"$Env:VS2017INSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Release|x86"
&"$Env:VS2017INSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Debug|x64"
&"$Env:VS2017INSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Release|x64"
Write-NuGetPackage .\CoApp\Library.autopkg
Move-Item -Path *.nupkg -Destination \\NAS\Home\NuGet -Force
