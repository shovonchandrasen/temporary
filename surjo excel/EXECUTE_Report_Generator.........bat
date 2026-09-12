@echo off
setlocal

echo Checking for Python...

:: Check if python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python not found. Please download and install it from https://www.python.org/downloads/
    echo Make sure to check the box "Add Python to PATH" during installation.
    pause
    exit /b
) else (
    echo Python is already installed.
)

echo Checking for required libraries...

:: Check if pandas is installed
python -c "import pandas" >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing pandas...
    pip install pandas
) else (
    echo pandas is already installed.
)

:: Check if openpyxl is installed
python -c "import openpyxl" >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing openpyxl...
    pip install openpyxl
) else (
    echo openpyxl is already installed.
)

echo.
echo Running logic_update_for_excel.py...
python logic_update_for_excel.py

pause