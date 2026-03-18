@echo off
SETLOCAL

:: 1. Define paths
SET "JAVA_URL=https://download.java.net/java/GA/jdk26/c3cc523845074aa0af4f5e1e1ed4151d/35/GPL/openjdk-26_windows-x64_bin.zip"
SET "TARGET_DIR=%~dp0java1"
SET "ZIP_FILE=%TARGET_DIR%\openjdk26.zip"

:: 2. Create the folder
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

echo [1/3] Downloading OpenJDK 26...
curl.exe -L "%JAVA_URL%" -o "%ZIP_FILE%"

echo [2/3] Extracting to %TARGET_DIR%...
:: Using PowerShell's Expand-Archive to unzip
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%TARGET_DIR%' -Force"

echo [3/3] Cleaning up...
:: Remove the zip file to save space
del "%ZIP_FILE%"

:: Move files up if they are nested inside a subfolder (standard for JDK zips)
for /d %%i in ("%TARGET_DIR%\jdk*") do (
    move "%%i\*.*" "%TARGET_DIR%\" >nul
    for /d %%j in ("%%i\*") do move "%%j" "%TARGET_DIR%\" >nul
    rd "%%i"
)

echo.
echo [Done] Java 26 is ready in: %TARGET_DIR%
"%TARGET_DIR%\bin\java.exe" -version
pause