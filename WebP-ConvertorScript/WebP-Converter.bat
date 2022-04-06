:: Title: WebP-Converter
:: Description: Encodes and decodes WebP images into PNGs and vice versa.
:: Dependencies: cwebp and dwebp executables https://developers.google.com/speed/webp/docs/using
:: Last Modified: 4/5/2022 (Tonia Sanzo) sanzo.tonia@gmail.com
:: -------------------------------------------------------------------------------------
::  No Copyright
::
::  The person who associated a work with this deed has dedicated the work to the public
::  domain by waiving all of his or her rights to the work worldwide under copyright 
::  law, including all related and neighboring rights, to the extent allowed by law.
::
::  You can copy, modify, distribute and perform the work, even for commercial purposes,
::  all without asking permission.
:: -------------------------------------------------------------------------------------
@echo off
SET /p confirmation= Do you want to run WebP-Convertor [y/n]:
if %confirmation%==y goto WEBP_CONVERTOR  
goto :eof

:WEBP_CONVERTOR
	SET /p conversion_type= Would you like to [e]ncode or [d]ecode:

	if %conversion_type%==e goto ENCODE
	if %conversion_type%==d goto DECODE
	goto :eof
	
:ENCODE
	SET /p full_path= Enter target image path:
	
	:: If the user string was surronded by quotes remove them 
	for /f "useback tokens=*" %%a in ('%full_path%') do set full_path=%%~a
	
	:: Parse the directory path and file name from the user input
	for %%A in ("%full_path%") do (
		SET directory_path=%%~dpA
		SET file_name=%%~nA)

	SET out_file=%directory_path%%file_name%.webp
	cwebp "%full_path%" -q 100 -lossless -o "%out_file%" 
	pause
	goto :eof
:DECODE
	SET /p full_path= Enter target image path:
	
	:: If the user string was surronded by quotes remove them 
	for /f "useback tokens=*" %%a in ('%full_path%') do set full_path=%%~a
	
	:: Parse the directory path and file name from the user input
	for %%A in ("%full_path%") do (
		SET directory_path=%%~dpA
		SET file_name=%%~nA)
		
	SET out_file=%directory_path%%file_name%.png
	dwebp "%full_path%" -o "%out_file%"
	pause
	goto :eof
	
goto :eof
