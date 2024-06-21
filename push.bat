@echo off
REM Ensure the required environment variables are set
if "%TIDBYT_KEY%"=="" (
    echo Error: TIDBYT_KEY environment variable is not set.
    exit /b 1
)

if "%TIDBYT_ID%"=="" (
    echo Error: TIDBYT_ID environment variable is not set.
    exit /b 1
)

REM Variables
set STAR_SCRIPT=app.star
set RENDERED_FILE=app.webp

REM Check if STAR_SCRIPT exists
if not exist "%STAR_SCRIPT%" (
    echo Error: Star script not found: %STAR_SCRIPT%
    exit /b 1
)

REM Render the Star script to a WebP file
echo Rendering %STAR_SCRIPT%...
pixlet render "%STAR_SCRIPT%"
if errorlevel 1 (
    echo Error: Failed to render %STAR_SCRIPT%
    exit /b 1
)

REM Check if the rendered file was created
if not exist "%RENDERED_FILE%" (
    echo Error: Rendered file not found: %RENDERED_FILE%
    exit /b 1
)

REM Push the rendered file to Tidbyt device
echo Pushing %RENDERED_FILE% to Tidbyt device...
pixlet push --api-key "%TIDBYT_KEY%" "%TIDBYT_ID%" "%RENDERED_FILE%"
if errorlevel 1 (
    echo Error: Failed to push %RENDERED_FILE% to Tidbyt device
    exit /b 1
)

echo Successfully pushed %RENDERED_FILE% to Tidbyt device
pause
