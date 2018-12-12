@echo off
Pushd "%~dp0"

set input=%~1
set tempFile=processed-data.csv
set GNULIBHOME=..\GnuLib\bin


REM Convert from UTF-16 LE with BOM to UTF-8 with BOM
echo Converting file to UTF-8...
for /f %%i in ('%GNULIBHOME%\file.exe -b --mime-encoding %input%') do set ENCODING=%%i
%GNULIBHOME%\iconv.exe -f %ENCODING% -t utf-8 "%input%" > "%tempFile%"
REM Remove BOM
%GNULIBHOME%\sed.exe -i "1s/^\xEF\xBB\xBF//" "%tempFile%"

echo Removing quotation marks...
REM Remove first double quotation mark
%GNULIBHOME%\sed.exe -i -E "s/^\"//" "%tempFile%"
REM Remove last double quotation mark
%GNULIBHOME%\sed.exe -i -E "s/\"$//" "%tempFile%"
REM Remove all intermediate double quotation mark
%GNULIBHOME%\sed.exe -i -E "s/\"\t/\t/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/\t\"/\t/g" "%tempFile%"
REM Replace all escaped quotation mars with one single quotation mark
%GNULIBHOME%\sed.exe -i -E "s/\"\"/\"/g" "%tempFile%"

REM Escape all characters that are special in LaTeX
echo Escaping LaTeX special characters...

%GNULIBHOME%\sed.exe -i -E "s/\{/\x0{\x0/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/\}/\x0}\x0/g" "%tempFile%"

%GNULIBHOME%\sed.exe -i -E "s/\\/\\textbackslash{}/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/#/\\#/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/\$/\\$/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/&/\\&/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/\^/\\textasciicircum{}/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/_/\\_/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/~/\\textasciitilde{}/g" "%tempFile%"

%GNULIBHOME%\sed.exe -i -E "s/\x0\{\x0/\\{/g" "%tempFile%"
%GNULIBHOME%\sed.exe -i -E "s/\x0\}\x0/\\}/g" "%tempFile%"

%GNULIBHOME%\sed.exe -i -E "s/%%/\\%%/g" "%tempFile%"

echo Converting and escaping done.

popd