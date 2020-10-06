function Get-EdiFiles {
  Param(
    [Parameter(Mandatory, ParameterSetName = 'NewerThan')]
    [datetime]$NewerThan,
    [Parameter(Mandatory, ParameterSetName = 'OlderThan')]
    [datetime]$OlderThan
  )
  if ($null -eq $OlderThan) {
    Get-ChildItem '\\edi\c$\isoft\reports\08925485US00\' | Where-Object LastWriteTime -gt $NewerThan
  }
  else {
    Get-ChildItem '\\edi\c$\isoft\reports\08925485US00\' | Where-Object LastWriteTime -lt $OlderThan
  }
}
