@echo off
setlocal enabledelayedexpansion

REM Set the name of the original text file
set "input_file=filelist.txt"

REM Set the name of the output text file
set "output_file=new_file.txt"

REM Set the directory where your .tif files are located
set "source_dir=%~dp0"

REM Set the directory where you want to save the .jpg files
set "destination_dir=%source_dir%converted"

REM Create the destination directory if it does not exist
if not exist "%destination_dir%" mkdir "%destination_dir%"

REM Clear the output file if it already exists
if exist "%output_file%" del "%output_file%"

REM Read the input file line by line
for /f "delims=" %%f in (%input_file%) do (
    set "filename=%%~nf"
    set "extension=%%~xf"

    REM Check if the file has a .tif extension
    if /i "!extension!"==".tif" (
        REM Remove the trailing _1 if it exists
        set "base_name=!filename:_1=!"
        
        REM Convert the .tif file to .jpg
        convert "%source_dir%!filename!.tif" "%destination_dir%!base_name!.jpg"

        REM Write the new file name with .jpg extension to the output file
        echo !base_name!.jpg >> %output_file%
    )
)

echo Conversion and file update completed!
pause
