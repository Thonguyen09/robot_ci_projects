@echo off
cd /d D:\Learning\RobotFramework\robot_ci_projects

echo Current directory: %cd%
dir results

echo Jenkins workspace: %cd%

:: Create results folder if it doesn't exist
if not exist results mkdir results

:: Run the PowerShell script
powershell -ExecutionPolicy Bypass -File run_tests.ps1

xcopy /s /y /i "results" "C:\Users\Tho Nguyen\AppData\Local\Jenkins\.jenkins\workspace\RobotFramework_CI\workspace_results"

pause
