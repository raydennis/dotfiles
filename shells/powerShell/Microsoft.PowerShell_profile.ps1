Import-Module PSReadline
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Import-Module z

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster
$ThemeSettings.colors.AdminIconForegroundColor               = 'DarkYellow'
$ThemeSettings.colors.CommandFailedIconForegroundColor       = 'DarkRed'
$ThemeSettings.colors.DriveForegroundColor                   = 'Blue'
$ThemeSettings.colors.DefaultColor                           = 'DarkGreen'
$ThemeSettings.colors.GitForegroundColor                     = 'Black'
$ThemeSettings.colors.GitLocalChangesColor                   = 'DarkYellow'
$ThemeSettings.colors.GitNoLocalChangesAndAheadAndBehindColor= 'DarkRed'
$ThemeSettings.colors.GitNoLocalChangesAndAheadColor         = 'DarkMagenta'
$ThemeSettings.colors.GitNoLocalChangesAndBehindColor        = 'DarkRed'
$ThemeSettings.colors.PromptBackgroundColor                  = 'Blue'
$ThemeSettings.colors.PromptForegroundColor                  = 'White'
$ThemeSettings.colors.PromptHighlightColor                   = 'Blue'
$ThemeSettings.colors.PromptSymbolColor                      = 'White'
$ThemeSettings.colors.SessionInfoBackgroundColor             = 'Black'
$ThemeSettings.colors.SessionInfoForegroundColor             = 'White'
$ThemeSettings.colors.VirtualEnvBackgroundColor              = 'Red'
$ThemeSettings.colors.VirtualEnvForegroundColor              = 'White'
$ThemeSettings.colors.WithBackgroundColor                    = 'DarkRed'
$ThemeSettings.colors.WithForegroundColor                    = 'White'