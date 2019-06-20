@echo off

rem set    zip=capitol.zip
rem set ifiles=cp1.45+cp2.46+cp3.47+cp4.48+cp5.49+cp6.50+cp7.51+cp8.52+cp11.23+cp12.24+cp9.39+cp10.40+ic40.prm+ic41.prm
rem set  ofile=a.capitol.rom

set    zip=pleiads.zip
set ifiles=ic47.r1+ic48.r2+ic47.bin+ic48.bin+ic51.r5+ic50.bin+ic53.r7+ic52.bin+ic23.bin+ic24.bin+ic39.bin+ic40.bin+7611-5.33+7611-5.26
set  ofile=a.pleiads.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
