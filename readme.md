# Python 3.11.9 Installation Script

This script automates the installation process of Python 3.11.9 on your system and automatically adds Python to the system PATH.

## Prerequisites

- Windows operating system
- Internet connection

## How to Download the Repo for First-Time Users

- Click the link to read [**Instructions**](https://www.gitprojects.fnbubbles420.org/how-to-download-repos).

## Usage

1. Download the script (`install_python_3.11.9.bat`) to your desired location.
2. Double-click on the script to run it.

## Instructions

- Upon running the script, it will prompt you to confirm whether to continue with the installation.
- If you choose to continue (`Y`), it will download the Python 3.11.9 installer from the official Python website and install it silently.
- If you choose not to continue (`N`), the installation will be cancelled.
- After installation, Python 3.11.9 will be available on your system.

## Usage Example

```batch
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
