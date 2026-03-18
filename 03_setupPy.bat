@echo off
SETLOCAL

:: 1. Define paths (Absolute paths are safer)
SET "UV_EXE=%~dp0uv1\uv.exe"
SET "PYTHON_DIR=%~dp0python1"

:: 2. Check if uv actually exists before running
if not exist "%UV_EXE%" (
    echo [Error] uv.exe not found in uv1\bin. Did the previous install fail?
    pause
    exit /b
)

echo [Action] Requesting Python 3.13 via uv...

:: 3. Create the virtual environment with the specific python version
:: --python 3.13 tells uv which version to fetch
:: The final argument is the target directory
"%UV_EXE%" venv "%PYTHON_DIR%" --python 3.13

echo.
echo [Done] Python 3.13 environment created in: %PYTHON_DIR%
echo To use it, run: %PYTHON_DIR%\Scripts\activate.bat

pause