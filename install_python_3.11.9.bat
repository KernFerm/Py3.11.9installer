@echo off

echo This script will install Python 3.11.9 on your system.
echo Do you want to continue with the installation? (Y/N)

set /p choice=
if /i "%choice%"=="Y" (
    echo Downloading Python 3.11.9...
    bitsadmin /transfer myDownloadJob /download /priority normal https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe "%cd%\python-3.11.9.exe"
    if exist "%cd%\python-3.11.9.exe" (
        echo Installing Python 3.11.9...
        "%cd%\python-3.11.9.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
        if %ERRORLEVEL% EQU 0 (
            echo Python 3.11.9 has been installed successfully.
            echo Adding Python Scripts directory to system PATH...
            setx PATH "%PATH%;%ProgramFiles%\Python311\Scripts"
            echo Python Scripts directory has been added to the system PATH.
        ) else (
            echo Installation failed.
        )
    ) else (
        echo Download failed.
    )
) else (
    echo Installation cancelled.
)

pause
