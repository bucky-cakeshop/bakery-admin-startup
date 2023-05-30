. .\configs.ps1

# Absolute path to backend repository
Set-Location c:\Code\bucky-cakeshop\bakery-admin-backend\
git pull
python manage.py migrate
pip install -r .\requirements.txt
Start-Job -ScriptBlock {python manage.py runserver} -Name $beServerJobName

# Absolute path to frontend repository
Set-Location c:\Code\bucky-cakeshop\bakery-admin-frontend\
git pull
npm install
Start-Job -ScriptBlock {npm start} -Name $feServerJobName

Write-Host "Wite while server is loading"
Read-Host -Prompt "Press any key to continue..."

Set-Location $CurrentDirectory
Get-Job
