. .\configs.ps1

# Absolute path to backend repository
write-host "------------ BACKEND SERVER ------------" -BackgroundColor DarkGreen
write-host "" -BackgroundColor Black
Set-Location c:\Code\bucky-cakeshop\bakery-admin-backend\
git pull
python manage.py migrate
pip install -r .\requirements.txt


# Absolute path to frontend repository
write-host "------------ FRONTEND SERVER ------------" -BackgroundColor DarkGreen
write-host "" -BackgroundColor Black
Set-Location c:\Code\bucky-cakeshop\bakery-admin-frontend\
git pull
npm install

Set-Location $CurrentDirectory

