rem Deployment and Imaging Tools Environment

cd "..\Windows Preinstallation Environment"

set PE=C:\PE
set ARCH=amd64
md %PE%
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

Dism /Image:%MOUNT% /Add-Driver /Driver:%DRIVER%\vbox\%ARCH% /Recurse

rem UMOUNT

Dism /Unmount-Image /MountDir:%MOUNT% /commit
Dism /Cleanup-Image
dism /Cleanup-Wim

rem BOOT






rem dism /Mount-Wim /WimFile:%WIM% /index:1 /MountDir:%MOUNT%



set TOOL=%PE%\tool
md %TOOL%

xcopy /e /y %TOOL%   %MOUNT%\tool\
xcopy /e /y %PE%\SDI %MOUNT%\SDI\
xcopy /e /y %PE%\FAR %MOUNT%\FAR\

dism /Unmount-Wim /MountDir:%MOUNT% /Commit
rem dism /Unmount-Wim /MountDir:%MOUNT% /Discard
dism /Cleanup-Wim

set ISO=%PE%\iso
md %ISO%

oscdimg -n -b%PE%\%ARCH%\fwfiles\etfsboot.com %PE%\%ARCH%\media %ISO%\winPE_%ARCH%.iso

