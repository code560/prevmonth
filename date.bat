@echo off
setlocal

set a=%1
call :Fn_Padding %1 aa
echo a: %aa%

call :Fn_PrevMonth %a% b overyear
call :Fn_Padding %b% bb
echo b: %bb%

if %overyear% neq 0 (
  echo îNÇÇ‹ÇΩÇ¨Ç‹ÇµÇΩÅB
)

endlocal
exit /b


REM ------------------
REM Fn_Padding num paddinged
REM ------------------
:Fn_Padding
setlocal

set num=0%~1
set num=%num:~-2%

endlocal & (set %~2=%num%) & exit /b


REM ------------------
REM Fn_PrevMonth month previous overyear
REM ------------------
:Fn_PrevMonth
setlocal

call :Fn_Padding %1 val
set /a val=1%val% - 100
set overyear=0
set res=1
if %val% equ 1 set overyear=1
if %val% leq 1 (
  set res=12
) else if %val% gtr 13 (
  set res=12
) else (
  set /a res=%val% - 1
)

endlocal & (
  set %~2=%res%
  set %~3=%overyear%
  ) & exit /b
