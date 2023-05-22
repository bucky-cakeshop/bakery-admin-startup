$CurrentDirectory = Get-Location

# Absolute path to backend repository
cd c:\Code\bucky-cakeshop\bakery-admin-backend\
git pull
python manage.py migrate
python manage.py runserver &

# Absolute path to frontend repository
cd c:\Code\bucky-cakeshop\bakery-admin-frontend\
git pull
npm install
npm start &

Write-Host "Wite while server is loading"
Read-Host -Prompt "Press any key to continue..."

cd $CurrentDirectory
