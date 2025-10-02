# content_sync.ps1 - versión multi-archivo con comprobación de Content
# Define aquí los IDs de Google Drive de los ZIPs que quieras descargar
$DriveFileIds = @(
    "ID_DEL_PRIMER_ZIP",
    "ID_DEL_SEGUNDO_ZIP",
    "ID_DEL_TERCER_ZIP"
)

# Carpeta donde se descomprimirán los contenidos
$contentPath = "Content"

# Verificar que la carpeta Content exista
if (-not (Test-Path -Path $contentPath)) {
    throw "❌ Error: la carpeta '$contentPath' no existe. Debe existir antes de ejecutar este script."
}

# Bucle sobre cada archivo
foreach ($fileId in $DriveFileIds) {
    # Nombre temporal del ZIP
    $zipPath = "temp_$fileId.zip"

    # URL directa de descarga de Google Drive
    $downloadUrl = "https://drive.google.com/uc?export=download&id=$fileId"

    Write-Output "📥 Descargando archivo con ID: $fileId..."
    Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

    Write-Output "📂 Descomprimiendo $zipPath en $contentPath..."
    Expand-Archive -Path $zipPath -DestinationPath $contentPath -Force

    Write-Output "🗑 Eliminando archivo temporal $zipPath..."
    Remove-Item $zipPath

    Write-Output "✅ Archivo $fileId procesado correctamente.`n"
}

Write-Output "🎉 Todos los recursos se han sincronizado correctamente."