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

function lss {
  param(
    [string]$Path = ".\",
    [int]$In = 1KB
  )
  
  Get-ChildItem $Path | Select-Object Name, @{name = "Size in $In"; expression = { $_.Length / $In } } | Format-Table
} 
