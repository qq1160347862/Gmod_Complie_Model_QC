set param=-quiet -outdir "%~dp0" -parsecompletion -Drelease 1
@echo off

cd ./characterQC

@REM nekomdl %param% -Dmain_mdl 1 Bill_namvet.qc
@REM IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% alyx.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% alyx_ep2.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% alyx_interior.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% alyx_intro.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% female_npc.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% female_pm.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% male_npc.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

nekomdl %param% male_pm.qc
IF %ERRORLEVEL% NEQ 0 ( goto CompileFailed )

goto End

:CompileFailed
echo CompileFailed
pause

:End
