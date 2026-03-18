@echo off
SETLOCAL

:: 1. Setup paths
SET "DOTNET_URL=https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.201/dotnet-sdk-10.0.201-win-x64.zip"
SET "TARGET_DIR=%~dp0dotnet1"
SET "ZIP_FILE=%TARGET_DIR%\dotnet.zip"

:: 2. Create the target folder
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

echo [1/3] Downloading .NET 10.0.201 SDK...
:: Using built-in curl to grab the zip
curl.exe -L "%DOTNET_URL%" -o "%ZIP_FILE%"

if %ERRORLEVEL% neq 0 (
    echo [Error] Download failed. Check your internet connection or URL.
    pause
    exit /b
)

echo [2/3] Extracting binaries to %TARGET_DIR%...
:: PowerShell handles the unzipping
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%TARGET_DIR%' -Force"

echo [3/3] Cleaning up...
del "%ZIP_FILE%"

echo.
echo [Done] .NET 10 SDK is ready in: %TARGET_DIR%
:: Verify the version from the new folder
"%TARGET_DIR%\dotnet.exe" --version

pause