@echo off
setlocal enabledelayedexpansion

set count=66
:loop
set /a count+=1
md .\data\stage\images\!count!
if %count% neq 98 goto loop
endlocal



echo.
echo Press any key to exit...
pause >nul