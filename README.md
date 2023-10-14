# Software Installation Script

This PowerShell script automates the download and installation of multiple software applications and checks the installation status. It also provides an English version of the messages displayed during the process.

## Usage

1. Clone or download the repository to your local machine.

2. Open a PowerShell terminal on your Windows computer.

   **Important:** Before running the script, it is recommended to open a PowerShell terminal with administrator privileges to ensure successful execution. To do this, follow these steps:

   - Press `Win + X` on your keyboard.
   - Select "Windows Terminal (Admin)" or "Command Prompt (Admin)" from the menu. You can also search for "PowerShell" or "Command Prompt" in the Start menu, right-click, and choose "Run as administrator."

3. Navigate to the directory where you have placed the script.

4. Modify the script to include the software download URLs and installation paths according to your requirements. Update the following variables in the script:
   - `$firefoxUrl`
   - `$chromeUrl`
   - `$puttyUrl`
   - `$vscodeUrl`
   - `$slackUrl`
   - `$authyUrl`
   - `$firefoxInstallerPath`
   - `$chromeInstallerPath`
   - `$puttyInstallerPath`
   - `$slackInstallerPath`
   - `$vsCodeInstallerPath`
   - `$authyUrlInstallerPath`

5. Run the script using the following command:
   ```powershell
   .\install_software.ps1
   ```

6. The script will download the software installers, perform silent installations, and check the installation status for each software.

7. The script will display messages indicating whether the installation was successful or failed with an exit code.

8. The downloaded installer files will be removed automatically after the installation process.

## Notes

- Make sure to have an active internet connection during the script execution, as it requires downloading software installers from the provided URLs.

- The script can be customized to add or remove software installations as needed.

- Before running the script, ensure that PowerShell execution policy allows script execution. You may need to set it to `RemoteSigned` or `Unrestricted` if it's restricted. To do this, open a PowerShell terminal with administrator privileges and run:
  ```powershell
  Set-ExecutionPolicy RemoteSigned
  ```

- This script is intended for use on Windows systems and may require modifications for other operating systems.

- Ensure that you have the necessary permissions to install software on your system.

- Always be cautious when executing scripts from the internet. Verify the content of the script to ensure it is safe and does not contain malicious code.

## License

This script is provided under the [MIT License](LICENSE).
```

Dengan penambahan ini, pengguna akan diberikan petunjuk tentang bagaimana membuka PowerShell terminal dengan hak administrator sebelum menjalankan skrip.
