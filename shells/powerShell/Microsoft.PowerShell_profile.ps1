oh-my-posh init pwsh --config "I:\Ray\Repositories\GitHub\raydennis\dotfiles\shells\powerShell\nord-agnoster.omp.json" | Invoke-Expression
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward