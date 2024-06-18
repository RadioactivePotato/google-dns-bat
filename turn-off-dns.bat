@echo off
:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb runAs"
    exit /b
)

:: Set DNS for IPv4 to DHCP
netsh interface ipv4 set dns name="Wifi" dhcp

:: Set DNS for IPv6 to DHCP
netsh interface ipv6 set dns name="Wifi" dhcp

echo DNS settings reset to DHCP successfully.
pause
