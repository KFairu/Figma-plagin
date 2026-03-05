@echo off
:: 3D Reveal Pro — Start Depth Map Server (Windows)

cd /d "%~dp0"

echo.
echo ==========================================
echo    3D Reveal Pro -- Depth Map Server
echo ==========================================
echo.

:: Use venv if it exists
if exist ".venv\Scripts\activate.bat" (
    call .venv\Scripts\activate.bat
    echo [OK] Using virtual environment
) else (
    echo [INFO] Virtual environment not found, using system Python.
    echo        Run setup-windows.bat first for a clean install.
)

echo.
echo Starting server on http://localhost:5000
echo First launch downloads the depth model (~200 MB) -- please wait.
echo.
echo Keep this window open while using the Figma plugin.
echo Press Ctrl+C to stop the server.
echo.

python server.py

if errorlevel 1 (
    echo.
    echo [ERROR] Server failed to start.
    echo Make sure you ran setup-windows.bat first.
    pause
)
