@echo off
setlocal enabledelayedexpansion
set sum=0

:ia
if %1 leq 4 (
    set /a sum=!sum!+%1
    exit /b %1
)

set /a t=%1-1
call :ia %t%
set a=%errorlevel%

set /a y=%1-2
call :ia %y%
set b=%errorlevel%

rem might not need next line or set a b
set /a r=%a%+%b%
exit /b %sum%