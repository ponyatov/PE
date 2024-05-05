set PE=C:\PE
set ARCH=x86
md %PE%
cd "..\Windows Preinstallation Environment"
copype.cmd %ARCH% %PE%\%ARCH%\

dism /Cleanup-Wim
set   WIM=%PE%\%ARCH%\media\sources\boot.wim
set MOUNT=C:\mount
md %MOUNT%

dism /Mount-Wim /WimFile:%WIM% /index:1 /MountDir:%MOUNT%

