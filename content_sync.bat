@echo off
REM Archivo: content_sync.bat
REM Ejecuta el script de PowerShell content_sync.ps1 y mantiene la consola abierta

powershell -NoProfile -ExecutionPolicy Bypass -File "content_sync.ps1"

echo.
echo Presiona cualquier tecla para cerrar...
pause > nul