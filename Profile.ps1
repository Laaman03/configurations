Set-Alias -Name gj -Value Get-Job
Set-Alias -Name rj -Value Receive-Job
Set-Alias -Name rmj -Value Remove-Job
Set-Alias -Name vim -Value nvim

function Nvim-All {
  Invoke-Expression "nvim -p $((Get-ChildItem -file).Name -join " ")"
}

function Configure-Up {
  Push-Location $HOME\configurations
  git pull
  . .\Profile.ps1
  Pop-Location
}

