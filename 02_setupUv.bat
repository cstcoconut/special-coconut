@echo off
SETLOCAL

:: 1. Setup paths
SET "TARGET_DIR=%~dp0uv1"
SET "INSTALLER=%TARGET_DIR%\install.ps1"

:: 2. Create the folder
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

echo [1/2] Downloading installer to %INSTALLER%...
:: Using built-in curl to save the file (-o)
curl.exe -sSfL https://astral.sh/uv/install.ps1 -o "%INSTALLER%"

echo [2/2] Running local installer...
:: Set the environment variable in the same scope as the execution
SET "UV_INSTALL_DIR=%TARGET_DIR%"

powershell.exe -ExecutionPolicy Bypass -File "%INSTALLER%"

echo.
echo [Check] Searching for uv.exe in %TARGET_DIR%...
dir /s /b "%TARGET_DIR%\uv.exe"

pause