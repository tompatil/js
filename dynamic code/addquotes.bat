@echo off
setlocal enabledelayedexpansion

:: Check if the data.txt file exists
if not exist paste_here.txt (
    echo data.txt not found!
    exit /b
)

:: Create or clear the output.txt file
> output.txt echo.

:: Read each line of data.txt and add single quotes around it, with a comma at the end
for /f "delims=" %%A in (paste_here.txt) do (
    set line=%%A
    echo '!line!', >> output.txt
)

echo Process completed. Check output.txt for results.
pause
