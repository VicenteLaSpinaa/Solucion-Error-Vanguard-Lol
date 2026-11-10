@echo off
setlocal enabledelayedexpansion
title Limpieza de residuos de LoL, Riot Client y Vanguard

:: ---------------------------------------------------------------
:: Elimina League of Legends, Riot Client y Riot Vanguard junto con
:: sus carpetas, servicios, claves de registro y accesos directos.
:: Debe ejecutarse como Administrador. El borrado es PERMANENTE.
:: ---------------------------------------------------------------

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este archivo necesita permisos de Administrador.
    echo Haz clic derecho sobre el .bat y elige "Ejecutar como administrador".
    pause
    exit /b 1
)

echo Esto va a borrar de forma permanente League of Legends, Riot Client
echo y Riot Vanguard de este equipo.
choice /c SN /m "Quieres continuar"
if errorlevel 2 (
    echo Cancelado. No se borro nada.
    pause
    exit /b 0
)

echo.
echo === Cerrando procesos ===
for %%P in (LeagueClient.exe LeagueClientUx.exe LeagueClientUxRender.exe "League of Legends.exe" RiotClientServices.exe RiotClientUx.exe RiotClientUxRender.exe RiotClientCrashHandler.exe vgtray.exe) do taskkill /f /im %%P >nul 2>&1

echo === Deteniendo y eliminando servicios de Vanguard ===
sc stop vgc >nul 2>&1
sc stop vgk >nul 2>&1
sc delete vgc >nul 2>&1
sc delete vgk >nul 2>&1

echo === Eliminando carpetas ===
for %%D in (
 "%ProgramFiles%\Riot Vanguard"
 "%ProgramFiles%\Riot Games"
 "%ProgramFiles(x86)%\Riot Games"
 "%ProgramData%\Riot Games"
 "%ProgramData%\Riot Vanguard"
 "%LOCALAPPDATA%\Riot Games"
 "%LOCALAPPDATA%\Riot Vanguard"
 "%APPDATA%\Riot Games"
 "%APPDATA%\Riot Client"
 "%APPDATA%\riot-client-ux"
 "%USERPROFILE%\AppData\LocalLow\Riot Games"
 "%USERPROFILE%\Documents\Riot Games"
 "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Riot Games"
 "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Riot Games"
) do call :borrar %%D

:: Busca instalaciones en la raiz de cada disco y en la carpeta Games
for %%L in (C D E F G H) do (
    if exist "%%L:\" (
        call :borrar "%%L:\Riot Games"
        call :borrar "%%L:\Games\Riot Games"
    )
)

echo === Eliminando accesos directos ===
for %%F in (
 "%PUBLIC%\Desktop\League of Legends.lnk"
 "%USERPROFILE%\Desktop\League of Legends.lnk"
 "%PUBLIC%\Desktop\Riot Client.lnk"
 "%USERPROFILE%\Desktop\Riot Client.lnk"
 "%PUBLIC%\Desktop\Cliente de Riot.lnk"
 "%USERPROFILE%\Desktop\Cliente de Riot.lnk"
) do del /f /q %%F >nul 2>&1

echo === Limpiando registro ===
reg delete "HKCU\Software\Riot Games" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Riot Games" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Riot Games" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\vgc" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\vgk" /f >nul 2>&1

echo.
echo Listo. Reinicia el PC para completar la eliminacion de Vanguard.
pause
exit /b 0

:borrar
if exist %1 (
    echo Borrando %1
    takeown /f %1 /r /d y >nul 2>&1
    icacls %1 /grant administrators:F /t >nul 2>&1
    rd /s /q %1
)
exit /b 0
