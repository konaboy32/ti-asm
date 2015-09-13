@echo off

cls
color 02
set source=source\%1.asm
set output=exec\%1.8xp
del exec\*.* /Q

if not exist %source% (
	color 04
	echo The file %source% does not exist!
	GOTO:EOF
)

asm\spasm %source% %output% -Iincludes

set emuhome=C:\Users\turtle\AppData\Local\TilEm
%emuhome%\tilem2.exe -r %emuhome%\TI84Plus_OS.rom %output% -p %emuhome%\launch.macro

GOTO:EOF
