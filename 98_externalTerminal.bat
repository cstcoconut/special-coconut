@echo off
SETLOCAL EnableDelayedExpansion

:: 1. Read the path from the text file
if not exist "npCorePath.txt" (
    echo [Error] npCorePath.txt not found!
    echo Please create it and paste the path to your npCore folder inside.
    pause
    exit /b
)

set /p CORE_PATH=<npCorePath.txt

:: Remove trailing backslash if user added one
if "%CORE_PATH:~-1%"=="\" set "CORE_PATH=%CORE_PATH:~0,-1%"

:: 2. Verify the path actually exists
if not exist "%CORE_PATH%\uv1" (
    echo [Error] The path in npCorePath.txt seems wrong.
    echo Current content: "%CORE_PATH%"
    pause
    exit /b
)

:: 3. Build the PATH using the external location
SET "P_UV=%CORE_PATH%\uv1"
SET "P_PY=%CORE_PATH%\python1\Scripts"
SET "P_JV=%CORE_PATH%\java1\bin"
SET "P_DN=%CORE_PATH%\dotnet1"
SET "P_BN=%CORE_PATH%\bun1"
SET "P_GC=%CORE_PATH%\gcc1\bin"

:: 4. Apply to current session
SET "PATH=%P_UV%;%P_PY%;%P_JV%;%P_DN%;%P_BN%;%P_GC%;%PATH%"
SET "JAVA_HOME=%CORE_PATH%\java1"
SET "DOTNET_ROOT=%CORE_PATH%\dotnet1"

:: 5. Launch
CLS
echo =====================================================
echo  PROJECT: %~p0
echo  ENGINE:  %CORE_PATH%
echo =====================================================
echo  uv , python , java , dotnet , bun , gcc --- READY.
echo =====================================================
cmd /k