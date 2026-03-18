@echo off
SETLOCAL EnableDelayedExpansion

:: 1. READ THE LINKAGE DESTINATION
if not exist "npCorePath.txt" (
    echo [Error] npCorePath.txt missing in this folder!
    pause & exit /b
)
set /p CORE_PATH=<npCorePath.txt
if "%CORE_PATH:~-1%"=="\" set "CORE_PATH=%CORE_PATH:~0,-1%"

:: 2. JUMP TO PROJECT FOLDER
IF "%~1"=="" (echo no file detected! & pause & exit /b)
pushd "%~dp1"

:: 3. DEFINE ABSOLUTE TOOL PATHS
SET "P_UV=%CORE_PATH%\uv1\uv.exe"
SET "P_PY=%CORE_PATH%\python1\Scripts\python.exe"
SET "P_JV=%CORE_PATH%\java1\bin\java.exe"
SET "P_DN=%CORE_PATH%\dotnet1\dotnet.exe"
SET "P_BN=%CORE_PATH%\bun1\bun.exe"
SET "P_GC=%CORE_PATH%\gcc1\bin\gcc.exe"

echo =====================================================
echo  LINKAGE VALIDATION: %CORE_PATH%
echo =====================================================

:: 4. VALIDATE EVERY SINGLE TOOL
:: UV
if exist "%P_UV%" (
    for /f "tokens=*" %%a in ('"%P_UV%" --version') do echo  [OK] UV:      %%a
) else (echo  [!!] UV:      NOT FOUND at %P_UV%)

:: PYTHON
if exist "%P_PY%" (
    for /f "tokens=*" %%a in ('"%P_PY%" --version') do echo  [OK] PYTHON:  %%a
) else (echo  [!!] PYTHON:  NOT FOUND at %P_PY%)

:: JAVA
if exist "%P_JV%" (
    for /f "tokens=*" %%a in ('"%P_JV%" --version') do echo  [OK] JAVA:    %%a
) else (echo  [!!] JAVA:    NOT FOUND at %P_JV%)

:: .NET
if exist "%P_DN%" (
    for /f "tokens=*" %%a in ('"%P_DN%" --version') do echo  [OK] DOTNET:  %%a
) else (echo  [!!] DOTNET:  NOT FOUND at %P_DN%)

:: BUN
if exist "%P_BN%" (
    for /f "tokens=*" %%a in ('"%P_BN%" --version') do echo  [OK] BUN:     v%%a
) else (echo  [!!] BUN:     NOT FOUND at %P_BN%)

:: GCC
if exist "%P_BN%" (
    for /f "tokens=*" %%a in ('"%P_GC%" --version') do echo  [OK] GCC:     v%%a
) else (echo  [!!] GCC:     NOT FOUND at %P_GC%)


echo =====================================================
echo.

:: 5. INJECT PATHS AND EXECUTE
SET "PATH=%CORE_PATH%\uv1;%CORE_PATH%\python1\Scripts;%CORE_PATH%\java1\bin;%CORE_PATH%\dotnet1;%CORE_PATH%\bun1;%CORE_PATH%\gcc1\bin;%PATH%"
SET "JAVA_HOME=%CORE_PATH%\java1"
SET "DOTNET_ROOT=%CORE_PATH%\dotnet1"

echo [Executing] %~nx1
echo -----------------------------------------------------
call "%~1"

echo -----------------------------------------------------
echo [Done] LINKAGE Closing.
pause
popd
ENDLOCAL