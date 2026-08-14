@echo off
REM ============================================================================
REM  rotki_CryptoSteuer - Web-Dev-Modus Starter
REM ============================================================================
REM  Startet die Entwicklungsumgebung ohne Installer:
REM    - Backend (rotkehlchen) via uv run
REM    - Frontend via Vite (im Browser unter http://localhost:8080)
REM    - Starling + Colibri (Rust-Services) fuer Preis-Queries
REM
REM  Aenderungen am Python-Code werden nach Backend-Neustart aktiv
REM  (Strg+C im Backend-Fenster, dann dieses Skript neu ausfuehren).
REM  Frontend-Aenderungen werden via Hot-Reload sofort sichtbar.
REM
REM  Usage: Doppelklick auf start-dev.bat  ODER  cmd /c start-dev.bat
REM ============================================================================

setlocal enabledelayedexpansion

echo === Setting up development environment ===

REM --- Strawberry Perl (muss vor Git-Bash-Perl im PATH stehen, fuer openssl) ---
set "PATH=C:\Strawberry\perl\bin;%PATH%"

REM --- Rust toolchain (cargo wird fuer Starling/Colibri benoetigt) ---
set "PATH=C:\Users\jwt\.cargo\bin;%PATH%"

REM --- fnm (Node Version Manager) ---
set "FNM=C:\Users\jwt\AppData\Local\Microsoft\WinGet\Packages\Schniz.fnm_Microsoft.Winget.Source_8wekyb3d8bbwe"
set "PATH=%FNM%;%PATH%"

REM --- Node 24 via fnm aktivieren (Rotki fordert ^24 <25) ---
for /f "tokens=*" %%i in ('fnm env --shell cmd') do call %%i
call fnm use 24
if errorlevel 1 (
    echo ERROR: fnm use 24 failed
    pause
    exit /b 1
)

REM --- MSVC nur aktivieren, wenn Rust native bauen muss (meist gecacht) ---
REM --- wird nicht mehr benoetigt, da uv sync die venv schon gebaut hat ---

echo.
echo === Environment ready ===
perl --version 2>nul | findstr "version"
cargo --version
node --version
pnpm --version
echo uv version:
uv --version
echo.

REM --- Ins frontend/ wechseln und dev:web starten ---
cd /d "C:\Users\jwt\dev\projects\jt_rotki\frontend"
echo === Starting rotki web-dev mode ===
echo === Browser oeffnet unter http://localhost:8080 ===
echo === Stoppen mit Strg+C ===
echo.

pnpm run dev:web

set "EXIT_CODE=%ERRORLEVEL%"
echo.
echo === Dev-Modus beendet (exit code %EXIT_CODE%) ===
pause
exit /b %EXIT_CODE%
