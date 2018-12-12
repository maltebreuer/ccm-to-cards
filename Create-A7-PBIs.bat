@echo off
Pushd "%~dp0"

set FORMAT=A7
set OUT=%FORMAT%.pdf
set input=%~1

TITLE Creating %FORMAT% PBI cards
ECHO Creating %FORMAT% PBI cards.

del PBI.pdf 2>nul
del %OUT% 2>nul

call "processing\convert.bat" "%input%"

REM Checking if there is a MiKTeX installation
call miktex-install\check.bat

ECHO Compiling...
cd latex

REM Compiling twice to make sure calculations are correct.
"..\miktex\texmfs\install\miktex\bin\lualatex.exe" -interaction=nonstopmode -aux-directory="tmp" -output-directory=".." PBI.tex -paper-format=%FORMAT%
"..\miktex\texmfs\install\miktex\bin\lualatex.exe" -interaction=nonstopmode -aux-directory="tmp" -output-directory=".." PBI.tex -paper-format=%FORMAT%

cd ..
ren PBI.pdf %OUT%

pause
popd