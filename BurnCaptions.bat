@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM =====================================
REM BurnCaptions.bat
REM Burns SRT captions into .mov videos as hardcoded MP4s
REM
REM USAGE:
REM   Double-click        -> processes ALL pairs in this folder
REM   Drag a .mov onto it -> processes that video (SRT must have same name)
REM
REM Output: Captioned Renders\ subfolder, named {file}_captioned.mp4
REM =====================================

set "SCRIPTDIR=%~dp0"
set "SCRIPT=%SCRIPTDIR%burn_captions.py"

if not exist "%SCRIPT%" (
  echo.
  echo ERROR: burn_captions.py not found at: %SCRIPT%
  echo.
  pause
  exit /b 1
)

REM ── No files dropped: process entire folder ────────────────
if "%~1"=="" (
  echo.
  echo === BurnCaptions - Full Folder Mode ===
  echo Folder: %SCRIPTDIR%
  echo.
  py "%SCRIPT%" --input-dir "%SCRIPTDIR:~0,-1%"
  echo.
  pause
  exit /b 0
)

REM ── Files dropped onto .bat ────────────────────────────────
echo.
echo === BurnCaptions - Drag and Drop Mode ===
echo.

REM Collect unique parent folders from all dropped files
set "DONE_DIRS=|"
for %%F in (%*) do (
  set "VIDDIR=%%~dpF"
  REM Remove trailing backslash
  set "VIDDIR=!VIDDIR:~0,-1!"

  REM Skip if we already processed this directory
  echo !DONE_DIRS! | findstr /i /c:"|!VIDDIR!|" >nul 2>&1
  if errorlevel 1 (
    set "DONE_DIRS=!DONE_DIRS!!VIDDIR!|"
    echo Folder: !VIDDIR!
    py "%SCRIPT%" --input-dir "!VIDDIR!"
    echo.
  )
)

echo =====================================
echo DONE
echo =====================================
echo.
pause
exit /b 0
