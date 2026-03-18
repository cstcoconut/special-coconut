@echo off
SETLOCAL

:: Get the current directory where the script is located
:: %~dp0 includes the trailing backslash
SET "CURRENT_DIR=%~dp0"

:: Remove the trailing backslash for a cleaner path (optional)
IF "%CURRENT_DIR:~-1%"=="\" SET "CURRENT_DIR=%CURRENT_DIR:~0,-1%"

:: Write the path to npCorePath.txt adjacent to the script
echo %CURRENT_DIR%>"%~dp0npCorePath.txt"

echo [Done] Path saved to npCorePath.txt:
echo %CURRENT_DIR%

pause