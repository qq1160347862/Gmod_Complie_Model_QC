@echo off
set param=-quiet -outdir "%~dp0" -parsecompletion -Drelease 1

cd /d "%~dp0characterQC" || (
    echo [ERROR] characterQC folder not found.
    pause
    exit /b 1
)

set "build_alyx=0"
set "build_alyx_ep2=0"
set "build_alyx_interior=0"
set "build_alyx_intro=0"
set "build_female_npc=0"
set "build_female_pm=0"
set "build_male_npc=0"
set "build_male_pm=0"

echo ========== Select QC Files to Compile ==========
echo Enter y to compile, n to skip. Not case-sensitive.
echo.

:Ask_alyx
set "usrInput="
set /p "usrInput=Compile alyx.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_alyx=1" & goto Next_alyx)
if /i "%usrInput%"=="n" (set "build_alyx=0" & goto Next_alyx)
echo Invalid input, please enter y or n.
goto Ask_alyx
:Next_alyx
echo.

:Ask_alyx_ep2
set "usrInput="
set /p "usrInput=Compile alyx_ep2.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_alyx_ep2=1" & goto Next_alyx_ep2)
if /i "%usrInput%"=="n" (set "build_alyx_ep2=0" & goto Next_alyx_ep2)
echo Invalid input, please enter y or n.
goto Ask_alyx_ep2
:Next_alyx_ep2
echo.

:Ask_alyx_interior
set "usrInput="
set /p "usrInput=Compile alyx_interior.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_alyx_interior=1" & goto Next_alyx_interior)
if /i "%usrInput%"=="n" (set "build_alyx_interior=0" & goto Next_alyx_interior)
echo Invalid input, please enter y or n.
goto Ask_alyx_interior
:Next_alyx_interior
echo.

:Ask_alyx_intro
set "usrInput="
set /p "usrInput=Compile alyx_intro.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_alyx_intro=1" & goto Next_alyx_intro)
if /i "%usrInput%"=="n" (set "build_alyx_intro=0" & goto Next_alyx_intro)
echo Invalid input, please enter y or n.
goto Ask_alyx_intro
:Next_alyx_intro
echo.

:Ask_female_npc
set "usrInput="
set /p "usrInput=Compile female_npc.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_female_npc=1" & goto Next_female_npc)
if /i "%usrInput%"=="n" (set "build_female_npc=0" & goto Next_female_npc)
echo Invalid input, please enter y or n.
goto Ask_female_npc
:Next_female_npc
echo.

:Ask_female_pm
set "usrInput="
set /p "usrInput=Compile female_pm.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_female_pm=1" & goto Next_female_pm)
if /i "%usrInput%"=="n" (set "build_female_pm=0" & goto Next_female_pm)
echo Invalid input, please enter y or n.
goto Ask_female_pm
:Next_female_pm
echo.

:Ask_male_npc
set "usrInput="
set /p "usrInput=Compile male_npc.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_male_npc=1" & goto Next_male_npc)
if /i "%usrInput%"=="n" (set "build_male_npc=0" & goto Next_male_npc)
echo Invalid input, please enter y or n.
goto Ask_male_npc
:Next_male_npc
echo.

:Ask_male_pm
set "usrInput="
set /p "usrInput=Compile male_pm.qc? [y/n]: "
if /i "%usrInput%"=="y" (set "build_male_pm=1" & goto Next_male_pm)
if /i "%usrInput%"=="n" (set "build_male_pm=0" & goto Next_male_pm)
echo Invalid input, please enter y or n.
goto Ask_male_pm
:Next_male_pm
echo.

echo ========== Start Compiling Selected Files ==========
echo.

if "%build_alyx%"=="1" (
    echo Compiling alyx.qc ...
    nekomdl %param% alyx.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] alyx.qc compiled.
    echo.
)

if "%build_alyx_ep2%"=="1" (
    echo Compiling alyx_ep2.qc ...
    nekomdl %param% alyx_ep2.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] alyx_ep2.qc compiled.
    echo.
)

if "%build_alyx_interior%"=="1" (
    echo Compiling alyx_interior.qc ...
    nekomdl %param% alyx_interior.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] alyx_interior.qc compiled.
    echo.
)

if "%build_alyx_intro%"=="1" (
    echo Compiling alyx_intro.qc ...
    nekomdl %param% alyx_intro.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] alyx_intro.qc compiled.
    echo.
)

if "%build_female_npc%"=="1" (
    echo Compiling female_npc.qc ...
    nekomdl %param% female_npc.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] female_npc.qc compiled.
    echo.
)

if "%build_female_pm%"=="1" (
    echo Compiling female_pm.qc ...
    nekomdl %param% female_pm.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] female_pm.qc compiled.
    echo.
)

if "%build_male_npc%"=="1" (
    echo Compiling male_npc.qc ...
    nekomdl %param% male_npc.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] male_npc.qc compiled.
    echo.
)

if "%build_male_pm%"=="1" (
    echo Compiling male_pm.qc ...
    nekomdl %param% male_pm.qc
    IF %ERRORLEVEL% NEQ 0 goto CompileFailed
    echo [OK] male_pm.qc compiled.
    echo.
)

echo All selected QC files compiled successfully.
goto End

:CompileFailed
echo.
echo [ERROR] Compile failed! Check output above for details.
pause
exit /b 1

:End
pause