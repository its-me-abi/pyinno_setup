@echo off

REM Clean build artifacts
if exist dist rmdir /s /q dist
if exist build rmdir /s /q build

for /d %%d in (*.egg-info) do (
    if exist %%d rmdir /s /q %%d
)

REM List all files and folders recursively from current directory
for /r %%i in (*) do echo %%i


python -m build
set TWINE_USERNAME=__token__
set TWINE_PASSWORD=%TESTPYPI_TOKEN%

twine upload --verbose --repository testpypi dist/*

pause