$CurrentDirectory = Get-Location

# Absolute path to backend repository
cd c:\Code\bucky-cakeshop\bakery-admin-backend\
python -ArgumentList manage.py runserver &

# Absolute path to frontend repository
cd c:\Code\bucky-cakeshop\bakery-admin-frontend\
npm -ArgumentList start &

Write-Host "Wite while server is loading"
Read-Host -Prompt "Press any key to continue..."

cd $CurrentDirectory
