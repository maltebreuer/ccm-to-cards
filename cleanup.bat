@ECHO off

Pushd "%~dp0"

del /q *.pdf
del /q latex\tmp\*
del /q processing\sed*
exit

popd