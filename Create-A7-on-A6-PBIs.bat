@echo off
Pushd "%~dp0"

set FORMAT=A6
set ITEMS=2
set OUT=A7-on-%FORMAT%.pdf
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
"..\miktex\texmfs\install\miktex\bin\lualatex.exe" -interaction=nonstopmode -aux-directory="tmp" -output-directory=".." PBI.tex -paper-format=%FORMAT% -items-per-page=%ITEMS%
"..\miktex\texmfs\install\miktex\bin\lualatex.exe" -interaction=nonstopmode -aux-directory="tmp" -output-directory=".." PBI.tex -paper-format=%FORMAT% -items-per-page=%ITEMS%

cd ..
ren PBI.pdf %OUT%

pause
popd