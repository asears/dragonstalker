@echo off
echo ========================================
echo   DRAGON STALKER - Night Stalker Clone
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python not found! Please install Python first.
    echo Download from: https://www.python.org/downloads/
    pause
    exit /b
)

echo Starting local web server...
echo.
echo Game will be available at: http://localhost:8080
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

cd /d "%~dp0"
python -m http.server 8080

pause
