Import-Module PSReadline
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-a4faccd\src\posh-git.psd1'
Import-Module z
$DC = "ent153cdc01.colleges.ad.unm.edu"
function dcconnect
{
    runas /netonly /user:"colleges\raditsvc" powershell.exe
}
function start-mmcdsa
{
    mmc dsa.msc /server=$DC
}

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward