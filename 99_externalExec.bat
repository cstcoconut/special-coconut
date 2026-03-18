@echo off
SETLOCAL EnableDelayedExpansion

:: 1. READ THE LINKAGE DESTINATION
if not exist "npCorePath.txt" (
    echo [Error] npCorePath.txt missing in this folder!
    exit /b 1
)
set /p CORE_PATH=<npCorePath.txt 
if "%CORE_PATH:~-1%"=="\" set "CORE_PATH=%CORE_PATH:~0,-1%" 

:: 2. CAPTURE THE COMMAND
:: We use %* to capture everything passed after the script name
SET "USER_CMD=%~1"

IF "%USER_CMD%"=="" (
    echo Usage: 99_externalExec.bat "command"
    echo Example: 99_externalExec.bat "python -m pip install requests"
    exit /b 1
)

:: 3. DEFINE ABSOLUTE TOOL PATHS
SET "P_UV=%CORE_PATH%\uv1" 
SET "P_PY=%CORE_PATH%\python1\Scripts" 
SET "P_JV=%CORE_PATH%\java1\bin" 
SET "P_DN=%CORE_PATH%\dotnet1" 
SET "P_BN=%CORE_PATH%\bun1" 
SET "P_GC=%CORE_PATH%\gcc1\bin" 

:: 4. INJECT PATHS
SET "PATH=%P_UV%;%P_PY%;%P_JV%;%P_DN%;%P_BN%;%P_GC%;%PATH%" [cite: 6]
SET "JAVA_HOME=%CORE_PATH%\java1" [cite: 6]
SET "DOTNET_ROOT=%CORE_PATH%\dotnet1" [cite: 6]

:: 5. EXECUTE THE COMMAND
:: We use cmd /c so the command executes and then returns control to the script
echo [External Exec] %USER_CMD%
echo -----------------------------------------------------
cmd /c %USER_CMD%

ENDLOCAL