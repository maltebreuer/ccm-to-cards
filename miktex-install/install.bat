REM @echo off
Pushd "%~dp0"

echo Installing portable MiKTeX...
start /b /wait miktex-portable-2.9.6942.exe -o"..\miktex" -y
echo Installation completed.

popd