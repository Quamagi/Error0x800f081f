# Ejecutar como administrador

# Comprobación de archivos del sistema
Write-Host "Iniciando System File Checker (sfc /scannow)..."
sfc /scannow
Write-Host "Finalizado SFC."

# Limpieza de componentes
Write-Host "Iniciando limpieza de componentes con DISM..."
Dism.exe /online /Cleanup-Image /StartComponentCleanup
Write-Host "Limpieza de componentes finalizada."

# Restaurar imagen de Windows
Write-Host "Iniciando restauración de imagen de Windows con DISM..."
Dism.exe /Online /Cleanup-Image /RestoreHealth
Write-Host "Restauración de imagen finalizada."

# Reinicio del sistema
Write-Host "El sistema se reiniciará en 10 segundos para aplicar los cambios..."
Start-Sleep -Seconds 10
Restart-Computer
