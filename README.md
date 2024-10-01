# Windows Update Fix Script

Este repositorio contiene scripts en PowerShell y Batch que automatizan el proceso de reparación de errores durante la instalación de actualizaciones de Windows. Los scripts utilizan las herramientas **System File Checker (SFC)** y **DISM** para escanear, reparar y restaurar archivos del sistema dañados.

## Scripts Disponibles

- `fix_windows_update.ps1`: Script de PowerShell.
- `fix_windows_update.bat`: Script Batch.

### Instrucciones

1. **Descargar el script:**
   - Puedes descargar cualquiera de los dos scripts desde este repositorio:
     - [PowerShell Script (`fix_windows_update.ps1`)](fix_windows_update.ps1)
     - [Batch Script (`fix_windows_update.bat`)](fix_windows_update.bat)

2. **Ejecutar como Administrador:**
   - Asegúrate de ejecutar el script con permisos de administrador para que pueda realizar las operaciones necesarias.

## Detalles del Script

Ambos scripts siguen estos pasos:

1. Ejecutan el **System File Checker (SFC)** con el comando `sfc /scannow` para verificar y reparar archivos del sistema.
2. Ejecutan la herramienta **DISM** para:
   - Limpiar los componentes de Windows: `Dism.exe /online /Cleanup-Image /StartComponentCleanup`.
   - Restaurar la imagen de Windows: `Dism.exe /Online /Cleanup-Image /RestoreHealth`.
3. Reinician el sistema automáticamente después de completar los pasos anteriores.

### PowerShell Script (`fix_windows_update.ps1`)

```powershell
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
