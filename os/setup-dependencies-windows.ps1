# https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup

rm C:\Users\ray\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 
cmd /c mklink C:\Users\ray\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 I:\Ray\Repositories\GitHub\raydennis\dotfiles\shells\powerShell\Microsoft.PowerShell_profile.ps1

rm C:\Users\ray\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1 
cmd /c mklink C:\Users\ray\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1 I:\Ray\Repositories\GitHub\raydennis\dotfiles\shells\powerShell\Microsoft.PowerShell_profile.ps1

rm C:\Users\Ray\AppData\Local\nvim\init.lua
md -Force C:\Users\Ray\AppData\Local\nvim
cmd /c mklink C:\Users\Ray\AppData\Local\nvim\init.lua I:\Ray\Repositories\GitHub\raydennis\dotfiles\editors\neovim\init.lua

# These can be used to keep the settings in sync, but for now I'm using the vscode built in sync.
# rm C:\Users\ray\AppData\Roaming\Code\User\settings.json 
# cmd /c mklink C:\Users\ray\AppData\Roaming\Code\User\settings.json I:\Ray\Repositories\GitHub\raydennis\dotfiles\editors\vscode\settings.json

# rm C:\Users\ray\AppData\Roaming\Code\User\keybindings.json 
# cmd /c mklink C:\Users\ray\AppData\Roaming\Code\User\keybindings.json I:\Ray\Repositories\GitHub\raydennis\dotfiles\editors\vscode\keybindings.json
# mklink ~\.vim\.vimrc ~\Repositories\GitHub\raydennis\dotfiles\editors\vim\.vimrc

# Install Chocolatey
#
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]#SecurityProtocol = [System.Net.ServicePointManager]#SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

cinst neovim virtualbox vagrant poshgit powertoys firacodenf git pwsh

# Setup the terminal profile for pwsh
## Setup oh-my-posh

## This installs the windows store version of oh-my-posh, which updates automatically
winget install XP8K0HKJFRXGCK

Install-Module PowershellGet -Force
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PSReadLine


PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
PowerShellGet\Install-Module z -Scope CurrentUser -Force
oh-my-posh font install firacode


# to setup "nested virtualization" on windows 
vboxmanage modifyvm "containers_default_1639768674562_36214" -- nested-hw-virt on
