@echo off
REM One-command push to GitHub (Windows)
set DEFAULT_USER=nagabheema
set /p GH_USER=GitHub username [%DEFAULT_USER%]: 
if "%GH_USER%"=="" set GH_USER=%DEFAULT_USER%
set /p REPO=Repository name (e.g. my-project): 
set /p MSG=Commit message [Update]: 
if "%MSG%"=="" set MSG=Update

if not exist .git git init
git add -A
git commit -m "%MSG%"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/%GH_USER%/%REPO%.git
git push -u origin main

echo.
echo If push failed: create an EMPTY repo first at https://github.com/new
echo Then enable Pages: Repo - Settings - Pages - Source = GitHub Actions
echo Your site will be live in 1-2 minutes at:
echo https://%GH_USER%.github.io/%REPO%/
pause
