@echo off
SETLOCAL

:: 1. Setup paths
SET "W64_URL=https://github.com/skeeto/w64devkit/releases/download/v2.6.0/w64devkit-x64-2.6.0.7z.exe" 
SET "TARGET_DIR=%~dp0gcc1" 
SET "EXE_FILE=%TARGET_DIR%\w64devkit.exe" 

:: 2. Create the target folder
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" 

echo [1/3] Downloading w64devkit v2.6.0...
curl.exe -L "%W64_URL%" -o "%EXE_FILE%" 

echo [2/3] Extracting (Self-extracting archive)...
:: Running the .exe with -o specifies the output directory
:: The -y flag ensures it runs in "assume yes" (silent) mode
"%EXE_FILE%" -o"%TARGET_DIR%" -y >nul

echo [3/3] Cleaning up and organizing...
:: w64devkit extracts into a subfolder named 'w64devkit'
:: We move contents to \gcc1 and remove the extra folder
for /d %%i in ("%TARGET_DIR%\w64devkit*") do (
    xcopy "%%i\*" "%TARGET_DIR%\" /E /H /Y >nul
    rd "%%i" /s /q
)

del "%EXE_FILE%" 

echo.
echo [Done] GCC/w64devkit is ready in: %TARGET_DIR% 
:: Verify installation
"%TARGET_DIR%\bin\gcc.exe" --version 

pause