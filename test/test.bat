@echo off
title Polibuda Sync App
cd /d "C:\Users\zuzan\Desktop\polibuda"

:menu
cls
echo ================================
echo        POLIBUDA SYNC APP
echo ================================
echo.
echo 1. Pobierz z GitHub (git pull)
echo 2. Wyslij na GitHub (git add/commit/push)
echo 3. Pokaz zmienione pliki
echo 4. Pobierz wybrany plik
echo 5. Wyjdz
echo.
set /p choice=Wybor: 

if "%choice%"=="1" goto pull
if "%choice%"=="2" goto push
if "%choice%"=="3" goto list
if "%choice%"=="4" goto checkout
if "%choice%"=="5" exit
goto menu

:pull
cls
echo Pobieranie zmian...
git pull
echo.
pause
goto menu

:push
cls
echo Wysylanie zmian...
git add -A
git commit -m "Zmiany z aplikacji BAT" --allow-empty
git push
echo.
pause
goto menu

:list
cls
echo Lista zmienionych plikow:
echo --------------------------------
git fetch >nul
git diff --name-only origin/master
echo --------------------------------
echo.
pause
goto menu

:checkout
cls
set /p plik