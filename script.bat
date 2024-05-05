set PE=C:\PE
set ARCH=x86
md %PE%
cd "..\Windows Preinstallation Environment"
copype.cmd %ARCH% %PE%\%ARCH%\

dism /Cleanup-Wim
set   WIM=%PE%\%ARCH%\media\sources\boot.wim
set MOUNT=C:\mount
md %MOUNT%
start %MOUNT%
dism /Mount-Wim /WimFile:%WIM% /index:1 /MountDir:%MOUNT%

set DRIVER=%PE%\driver
md %DRIVER%

rem %PE%/driver/%ARCH%/vbox
rem D:\VBoxWindowsAdditions-x86.exe   /extract /D=%PE%\driver\x86
rem D:\VBoxWindowsAdditions-amd64.exe /extract /D=%PE%\driver\amd64

dism /Image:%MOUNT% /Add-Driver /Driver:%DRIVER%\%ARCH% /recurse
dism /Image:%MOUNT% /Add-Driver /Driver:%DRIVER%\usb    /recurse

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

