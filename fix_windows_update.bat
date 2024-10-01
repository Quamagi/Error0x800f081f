@echo off
echo Iniciando System File Checker (sfc /scannow)...
sfc /scannow
echo Finalizado SFC.

echo Iniciando limpieza de componentes con DISM...
Dism.exe /online /Cleanup-Image /StartComponentCleanup
echo Limpieza de componentes finalizada.

echo Iniciando restauración de imagen de Windows con DISM...
Dism.exe /Online /Cleanup-Image /RestoreHealth
echo Restauración de imagen finalizada.

echo El sistema se reiniciará en 10 segundos para aplicar los cambios...
timeout /t 10
shutdown /r /t 0
