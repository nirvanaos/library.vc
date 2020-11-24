$solution = "Library.sln"
nuget restore "$solution" -Source "\\NAS\Home\NuGet"
&"$Env:VSINSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Debug|x86"
&"$Env:VSINSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Release|x86"
&"$Env:VSINSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Debug|x64"
&"$Env:VSINSTALLDIR\Common7\IDE\devenv.com" "$solution" /build "Release|x64"
Write-NuGetPackage .\CoApp\Library.vc.autopkg
Write-NuGetPackage .\CoApp\googletest.vc.autopkg
Write-NuGetPackage .\CoApp\LibMock.vc.autopkg
Write-NuGetPackage .\CoApp\CoreImport.vc.autopkg
Move-Item -Path *.nupkg -Destination \\NAS\Home\NuGet -Force
