@echo off
setlocal

set a=1
echo a: %a%

set /a a=%a%+1
echo a: %a%


@REM set b=02
@REM set /a b=%b%
set /a b=00
echo b: %b%

set /a b=%b%+8
call :Fn_Padding %b% p
echo b: %p%


set /a b=%b%+2
call :Fn_Padding %b% p
echo b: %p%

endlocal
exit /b


REM ------------------
REM Fn_Padding num paddinged
REM ------------------
:Fn_Padding
setlocal enableDelayedExpansion

set num=0%~1
set num=!num:~-2!

endlocal & (set %~2=%num%) & exit /b

