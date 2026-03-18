@echo off
TITLE Portable Dev Suite - Local Session
SETLOCAL

:: 1. Define the root directory (where this script is located)
SET "ROOT_DIR=%~dp0"

:: 2. Build the new PATH by appending our local folders
:: We include the /bin subfolders where applicable
SET "LOCAL_PATH=%ROOT_DIR%uv1"
SET "LOCAL_PATH=%LOCAL_PATH%;%ROOT_DIR%python1\Scripts"
SET "LOCAL_PATH=%LOCAL_PATH%;%ROOT_DIR%java1\bin"
SET "LOCAL_PATH=%LOCAL_PATH%;%ROOT_DIR%dotnet1"
SET "LOCAL_PATH=%LOCAL_PATH%;%ROOT_DIR%bun1"
SET "LOCAL_PATH=%LOCAL_PATH%;%ROOT_DIR%gcc1\bin"

:: 3. Set specific Home variables for Java and .NET to ensure they behave
SET "JAVA_HOME=%ROOT_DIR%java1"
SET "DOTNET_ROOT=%ROOT_DIR%dotnet1"
:: Opt-out of .NET telemetry for this portable session
SET "DOTNET_CLI_TELEMETRY_OPTOUT=1"

:: 4. Finalize the PATH (adds our tools to the front of the existing system path)
SET "PATH=%LOCAL_PATH%;%PATH%"

echo =====================================================
echo    PORTABLE DEV SUITE ACTIVATED (SESSION ONLY)
echo =====================================================
echo  UV:
uv --version
echo  PYTHON:
python --version
echo  JAVA:
java --version
echo  DOTNET:
dotnet --version
echo  BUN:
bun --version
echo  GCC:
gcc --version
echo =====================================================
echo.

:: Launch a fresh CMD that stays open
cmd /k