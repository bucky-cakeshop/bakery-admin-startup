. .\configs.ps1
. .\get_latest_all.ps1

# Absolute path to backend repository
Set-Location c:\Code\bucky-cakeshop\bakery-admin-backend\
Start-Job -ScriptBlock {python manage.py runserver} -Name $beServerJobName

# Absolute path to frontend repository
Set-Location c:\Code\bucky-cakeshop\bakery-admin-frontend\
Start-Job -ScriptBlock {npm start} -Name $feServerJobName

Write-Host "Wite while server is loading"
Read-Host -Prompt "Press any key to continue..."

Set-Location $CurrentDirectory
Get-Job
