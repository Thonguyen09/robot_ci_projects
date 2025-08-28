# ps1 file
# Navigate to project directory
Set-Location "D:\Learning\RobotFramework\robot_ci_projects"
# Set-Location -Path $PSScriptRoot

# Clean up old results
if (Test-Path -Path ".\results") {
    Remove-Item -Path ".\results\*" -Recurse -Force
} else {
    New-Item -ItemType Directory -Path ".\results" | Out-Null
}
 
# Run Robot Framework tests
Push-Location .\results
robot `
    --outputdir . `
    --logtitle "Search Test Log" `
    --reporttitle "Search Test Report" `
    ..\tests\open_google.robot
Pop-Location

# # Run Robot Framework tests and save output to results folder
# & "C:\Users\Tho Nguyen\AppData\Local\Programs\Python\Python313\python.exe" -m robot --outputdir results tests

# Check for failure in output.xml
$logContent = Get-Content "results\output.xml"
if ($logContent -match 'status="FAIL"') {
    Write-Host "❌ Some tests failed."
    exit 1
} else {
    Write-Host "✅ All tests passed."
    exit 0
}

#!/bin/bash

# sh file
# # Navigate to your project directory
# cd /mnt/d/Learning/RobotFramework/robot_ci_projects || exit 1

# # Create results folder if it doesn't exist
# mkdir -p results

# # Run Robot Framework tests and save output to results/
# python3 -m robot --outputdir results tests/

# # Check for test failures
# if grep -q 'status="FAIL"' results/output.xml; then
#     echo "❌ Some tests failed."
#     exit 1
# else
#     echo "✅ All tests passed."
#     exit 0
# fi
