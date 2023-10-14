# Define the software download URLs
$firefoxUrl = "https://ftp.mozilla.org/pub/firefox/releases/10.0.2/win32/en-US/Firefox%20Setup%2010.0.2.exe"
$chromeUrl = "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
$puttyUrl  = "https://the.earth.li/~sgtatham/putty/0.79/w64/putty-64bit-0.79-installer.msi"
$vscodeUrl = "https://update.code.visualstudio.com/1.61.2/win32-x64-user/stable"
$slackUrl = "https://slack.com/ssb/download-win64-msi"
$authyUrl = "https://pkg.authy.com/authy/stable/2.4.1/win32/x32/Authy%20Desktop%20Setup%202.4.1.exe"

# Define installation paths
$firefoxInstallerPath = "$env:USERPROFILE\Downloads\firefox-installer.exe"
$chromeInstallerPath = "$env:USERPROFILE\Downloads\chrome-installer.exe"
$puttyInstallerPath = "$env:USERPROFILE\Downloads\putty-installer.msi"
$slackInstallerPath = "$env:USERPROFILE\Downloads\slack-installer.msi"
$vsCodeInstallerPath = "$env:USERPROFILE\Downloads\vscode-installer.exe"
$authyUrlInstallerPath = "$env:USERPROFILE\Downloads\authy-installer.exe"

# Start the downloads
Invoke-WebRequest -Uri $firefoxUrl -OutFile $firefoxInstallerPath
Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstallerPath
Invoke-WebRequest -Uri $puttyUrl -OutFile $puttyInstallerPath
Invoke-WebRequest -Uri $slackUrl -OutFile $slackInstallerPath
Invoke-WebRequest -Uri $vscodeUrl -OutFile $vsCodeInstallerPath
Invoke-WebRequest -Uri $authyUrl -OutFile $authyUrlInstallerPath

# Perform installations and check return status
$firefoxInstallStatus = Start-Process -FilePath $firefoxInstallerPath -ArgumentList /S -Wait -PassThru
$chromeInstallStatus = Start-Process -FilePath $chromeInstallerPath -ArgumentList /silent /install -Wait -PassThru
$puttyInstallStatus = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$puttyInstallerPath`" /qn" -Wait -PassThru
$vscodeInstallStatus = Start-Process -FilePath $vsCodeInstallerPath -ArgumentList --silent -Wait -PassThru
$slackInstallStatus = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$slackInstallerPath`" /qn" -Wait -PassThru
$authyInstallStatus = Start-Process -FilePath $authyUrlInstallerPath /S -Wait -PassThru

# Function to check return status
function CheckInstallStatus($status) {
    if ($status.ExitCode -eq 0) {
        Write-Host "Installation successful."
    } else {
        Write-Host "Installation failed with exit code: $($status.ExitCode)"
    }
}

# Check installation status for each software
CheckInstallStatus $firefoxInstallStatus
CheckInstallStatus $chromeInstallStatus
CheckInstallStatus $puttyInstallStatus
CheckInstallStatus $vscodeInstallStatus
CheckInstallStatus $slackInstallStatus
CheckInstallStatus $authyInstallStatus

# Remove downloaded files
Remove-Item -Path $firefoxInstallerPath
Remove-Item -Path $chromeInstallerPath
Remove-Item -Path $puttyInstallerPath
Remove-Item -Path $slackInstallerPath
Remove-Item -Path $vsCodeInstallerPath
Remove-Item -Path $authyUrlInstallerPath
