@echo off
setlocal

:: Prompt user for the audio file name
set /p audiofile=Please enter the name of the audio file (with extension, e.g., audiofile.mp3): 

:: If user input is empty, search for the MP3 file in the current directory
if "%audiofile%"=="" (
    for %%f in (*.mp3) do set audiofile=%%f
)

:: Check if the file exists
if not exist "%audiofile%" (
    echo The file "%audiofile%" does not exist.
    exit /b 1
)

echo Using audio file: %audiofile%

:: Run the ffmpeg command
ffmpeg -loop 1 -i logo.jpg -i "%audiofile%" -c:v libx264 -c:a copy -shortest output.mp4

:: Check if the command was successful
if %errorlevel% neq 0 (
    echo There was an error in creating the video.
    exit /b 1
)

echo Video created successfully as output.mp4
endlocal
pause
