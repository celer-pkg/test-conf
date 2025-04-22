@echo off
set "PYTHON_DIR=%cd%\downloads\tools\python-3.11.9-embed-amd64"
set "PYTHON_VERSION=python311"

REM Check if already initialized.
if exist "%PYTHON_DIR%\Scripts\pip.exe" (
    echo Python has been initialized.
    goto :eof
)

REM Enable 'import site'
powershell -Command "(Get-Content '%PYTHON_DIR%\%PYTHON_VERSION%._pth') -replace '#\s*import site','import site' | Set-Content '%PYTHON_DIR%\%PYTHON_VERSION%._pth'"

REM Download get-pip.py
curl -o "%PYTHON_DIR%\get-pip.py" https://bootstrap.pypa.io/get-pip.py

REM Install pip
"%PYTHON_DIR%\python.exe" "%PYTHON_DIR%\get-pip.py"

REM Show version
"%PYTHON_DIR%\python.exe" -m pip --version

REM Install dependencies.
"%PYTHON_DIR%\python.exe" -m pip install pre-commit