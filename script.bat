rem Deployment and Imaging Tools Environment

set PE=C:\PE
set ARCH=amd64
md %PE%

cd "..\Windows Preinstallation Environment\%ARCH%"

copype.cmd %ARCH% %PE%\%ARCH%\

rem MOUNT

set MOUNT=C:\mount
md %MOUNT%
start %MOUNT%

set WIM=%PE%\%ARCH%\media\sources\boot.wim
Dism /Mount-Image /ImageFile:%WIM% /index:1 /MountDir:%MOUNT%

rem DRIVERS

set DRIVER=%PE%\driver
md %DRIVER%

md %DRIVER%
md %DRIVER%\vbox
md %DRIVER%\vbox\%ARCH%
rem D:\VBoxWindowsAdditions-%ARCH%.exe /extract /D=%PE%\driver\vbox

Dism /Image:%MOUNT% /Add-Driver /Driver:%DRIVER%\vbox\%ARCH% /Recurse /ForceUnsigned
Dism /Image:%MOUNT% /Get-Drivers

rem UMOUNT

Dism /Unmount-Image /MountDir:%MOUNT% /commit
dism /Cleanup-Wim

rem BOOT

set ISO=%PE%\iso
md %ISO%
MakeWinPEMedia /ISO %PE%\%ARCH% %ISO%\w10iot_%ARCH%.iso




set TOOL=%PE%\tool
md %TOOL%

xcopy /e /y %TOOL%   %MOUNT%\tool\
xcopy /e /y %PE%\SDI %MOUNT%\SDI\
xcopy /e /y %PE%\FAR %MOUNT%\FAR\

oscdimg -n -b%PE%\%ARCH%\fwfiles\etfsboot.com %PE%\%ARCH%\media %ISO%\winPE_%ARCH%.iso

