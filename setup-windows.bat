@echo off
:: 3D Reveal Pro — Windows Setup Script
:: Run once: double-click setup-windows.bat

echo.
echo ==========================================
echo    3D Reveal Pro -- Windows Setup
echo ==========================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found!
    echo.
    echo Please install Python 3.8 or newer from:
    echo   https://www.python.org/downloads/windows/
    echo.
    echo IMPORTANT: Check "Add Python to PATH" during installation!
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version') do set PYVER=%%i
echo [OK] Found %PYVER%

echo.
echo [1/3] Creating virtual environment...
python -m venv .venv
if errorlevel 1 (
    echo [ERROR] Failed to create virtual environment.
    pause
    exit /b 1
)

echo [2/3] Activating virtual environment...
call .venv\Scripts\activate.bat

echo [3/3] Installing dependencies (may take several minutes)...
echo       Downloading required packages for depth map generation...
pip install --upgrade pip --quiet
pip install flask flask-cors transformers torch torchvision pillow

if errorlevel 1 (
    echo.
    echo [ERROR] Installation failed.
    echo Try running as Administrator or check your internet connection.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo    Setup complete!
echo ==========================================
echo.
echo To start the AI server, run:
echo   start-server-windows.bat
echo.
pause
