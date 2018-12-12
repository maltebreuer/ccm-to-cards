Pushd "%~dp0"

if exist "..\miktex\texmfs\install\miktex\bin\lualatex.exe" (
    echo Found MiKTeX installation.
) else (
    echo Could not find MiKTeX installation.
    call install.bat
)

popd