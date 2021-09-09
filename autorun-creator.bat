@echo off
Title KZL's Tools - Autorun Creator
goto main

:main
cls
set ver=1.0.0
set license-file=license.txt
set github=https://github.com/KZL00/Autorun-Creator
cd Generated
if not exist dir.autorun-creator goto fc
if exist dir.autorun-creator goto fc2

:fc
mkdir Generated
cd Generated
echo DONT DELETE THIS FILE; >> dir.autorun-creator
cd ..
goto menu

:fc2
cd ..
goto menu

:menu
Title KZL's Tools - Autorun Creator %ver%
cls
echo [ Autorun Creator ]=====================================================================================================
echo Welcome to Autorun creator!
echo.
echo Using the numeric field, select the option that you want.
echo.
echo 01 - Create a new autorun
echo.
echo 02 - About the program
echo 03 - Open a Page on GitHub
echo.
echo 04 - End session
choice /c 1234 /n
if %errorlevel%==1 goto new
if %errorlevel%==2 goto info
if %errorlevel%==3 goto github
if %errorlevel%==4 exit

:github
cls
start %github%
goto menu

:info
cls
echo 	KZL's Tools
echo 	Autorun Creator
echo 	by KZL Software
echo    	     (KZL00)
echo.
echo.
echo Github: %github%
pause
goto menu

:new
cls
echo [ Autorun Creator ]=====================================================================================================
echo Select the type of device you want to copy the AUTORUN file to from the list below:
echo.
echo 01 - CD or DVD
echo 02 - Flash Drive
echo 03 - Mass Space Device
echo 04 - Other
echo.
choice /c 1234 /n
if %errorlevel%==1 set DeviceType=CD or DVD
if %errorlevel%==2 set DeviceType=Flash Drive
if %errorlevel%==3 set DeviceType=Mass Space Device
if %errorlevel%==4 set DeviceType=Other
cls
echo [ Autorun Creator ]=====================================================================================================
echo Enter the name of the executable (or other type) along with the extension (the EXE file must be contained on the drive where AUTORUN will be located):
echo.
set /p "EXEFile=>>"
cls
echo [ Autorun Creator ]=====================================================================================================
echo Enter the name of the icon file (extension "*.ICO", the icon file must be contained on the drive where AUTORUN will be located):
set /p "ICOFile=>>"
cls
echo [ Autorun Creator ]=====================================================================================================
echo Check that the following information is valid:
echo.
echo Device Type:	%deviceType%
echo File to Run:	%EXEFile%
echo Icon File  :	%ICOFile%
echo.
echo 01 - Start generating AUTORUN file
echo 02 - Back to menu
echo.
choice /c 12 /n
if %errorlevel%==1 goto generate
if %errorlevel%==2 goto menu

:generate
cls
echo [ Autorun Creator ]=====================================================================================================
echo.
echo [X] Preparing
echo [ ] Data validation
echo [ ] Saving
cd Generated
set FN=%date%
mkdir %FN%
cd %FN%
echo [autorun] >> autorun.inf
echo. >> autorun.inf
timeout 1 \nul
cls
echo [ Autorun Creator ]=====================================================================================================
echo.
echo [ ] Preparing
echo [X] Data validation
echo [ ] Saving
if not exist autorun.inf goto err
timeout 1 \nul
cls
echo [ Autorun Creator ]=====================================================================================================
echo.
echo [ ] Preparing
echo [ ] Data validation
echo [X] Saving
echo open=%EXEFile% >> autorun.inf
echo. >> autorun.inf
echo icon=%ICOFile% >> autorun.inf
timeout 1 \nul
goto comp

:err
cls
echo [ Autorun Creator ]=====================================================================================================
echo.
echo Something went wrong!
echo.
echo Try generating the AUTORUN file again. If the problem persists, please report the problem on GitHub!
pause
goto menu

:comp
cd ..
cd ..
cls
start .\Generated
echo [ Autorun Creator ]=====================================================================================================
echo.
echo Your AUTORUN file was successfully generated. Copy the AUTORUN file to your storage medium.
echo.
pause
goto menu