@echo off

NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
	echo This setup needs admin permissions. Please run this file as admin.
	pause
	exit
)

set NODE_VER=null
node -v >tmp.txt
set /p NODE_VER=<tmp.txt
del tmp.txt
echo %NODE_VER%

SET CUR_DIR=%~dp0
cd %CUR_DIR%
mkdir zipados

echo ---------------------------------------------------
echo ----- Compiling and zipping CREATE CAMPAIGN Lambda...
echo ---------------------------------------------------

cd %CUR_DIR%\CreateCampaign
call npm install
call tar.exe -a -cf createcampaign.zip index.js node_modules package.json
move createcampaign.zip %CUR_DIR%\zipados\

echo ---------------------------------------------------
echo ----- Compiling and zipping GET CAMPAIGN Lambda...
echo ---------------------------------------------------

cd %CUR_DIR%\GetCampaign
call npm install
call tar.exe -a -cf getcampaign.zip index.js node_modules package.json
move getcampaign.zip %CUR_DIR%\zipados\

echo ---------------------------------------------------
echo ----- Terraform scripts
echo ---------------------------------------------------

cd %CUR_DIR%\terraform
call terraform init
call terraform apply -auto-approve

echo ------------ ALL ABOARD !!!
pause


