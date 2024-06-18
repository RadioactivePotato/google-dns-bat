@echo off
:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb runAs"
    exit /b
)

:: Set DNS for IPv4
netsh interface ipv4 set dns name="Wifi" static 8.8.8.8
netsh interface ipv4 add dns name="Wifi" 8.8.4.4 index=2

:: Set DNS for IPv6
netsh interface ipv6 set dns name="Wifi" static 2001:4860:4860::8888
netsh interface ipv6 add dns name="Wifi" 2001:4860:4860::8844 index=2

echo DNS settings updated successfully.
pause
