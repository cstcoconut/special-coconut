@echo off
SETLOCAL

:: 1. Setup paths
SET "BUN_URL=https://github.com/oven-sh/bun/releases/download/bun-v1.3.10/bun-windows-x64.zip"
SET "TARGET_DIR=%~dp0bun1"
SET "ZIP_FILE=%TARGET_DIR%\bun.zip"

:: 2. Create the target folder
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

echo [1/3] Downloading Bun v1.3.10...
curl.exe -L "%BUN_URL%" -o "%ZIP_FILE%"

echo [2/3] Extracting...
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%TARGET_DIR%' -Force"

echo [3/3] Cleaning up and organizing...
:: Bun zips usually have a subfolder like bun-windows-x64
:: We move everything from the subfolder to bun1
for /d %%i in ("%TARGET_DIR%\bun-windows*") do (
    move "%%i\*" "%TARGET_DIR%\" >nul
    rd "%%i" /s /q
)

del "%ZIP_FILE%"

echo.
echo [Done] Bun is ready in: %TARGET_DIR%
:: Verify installation
"%TARGET_DIR%\bun.exe" --version

pause