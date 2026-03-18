@echo off
SETLOCAL

:: 1. Define paths
SET "UV_EXE=%~dp0uv1\uv.exe"
SET "PYTHON_DIR=%~dp0python1"

:: 2. Check if a file was actually dropped
IF "%~1"=="" (
    echo [Error] Please drag and drop a requirements.txt file onto this script.
    pause
    exit /b
)

:: 3. Check if uv exists
if not exist "%UV_EXE%" (
    echo [Error] uv.exe not found in uv1\bin.
    pause
    exit /b
)

echo [Action] Syncing %PYTHON_DIR% with %~nx1...
echo This will remove any packages NOT in your text file.
echo.

:: 4. Use 'uv pip sync' 
:: --python points to your env, and %1 is the file you dropped
"%UV_EXE%" pip sync "%~1" --python "%PYTHON_DIR%"

echo.
echo [Done] Environment is now a perfect match for your requirements!
pause
cmd /k