mklink C:\Users\rsdenni\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 C:\Users\rsdenni\Github\dotfiles\shells\powerShell\Microsoft.PowerShell_profile.ps1
mklink C:\Users\rsdenni\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1 C:\Users\rsdenni\Github\dotfiles\shells\powerShell\Microsoft.PowerShell_profile.ps1
mklink C:\Users\rsdenni\AppData\Roaming\Code\User\settings.json C:\Users\rsdenni\Github\dotfiles\editors\vscode\settings.json
mklink C:\Users\rsdenni\AppData\Roaming\Code\User\keybindings.json C:\Users\rsdenni\Github\dotfiles\editors\vscode\keybindings.json
mklink ~\.vim\.vimrc ~\Repositories\GitHub\raydennis\dotfiles\editors\vim\.vimrc

:: Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

cinst vim virtualbox vagrant poshgit powertoys firacodenf git
winget install "Windows Terminal" JanDeDobbeleer.OhMyPosh
:: make sure this is in your $PROFILE
:: $ oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PSReadLine

:: to setup "nested virtualization" on windows 
vboxmanage modifyvm "containers_default_1639768674562_36214" -- nested-hw-virt on
