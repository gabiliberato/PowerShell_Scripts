$datecutoff = (Get-Date).AddDays(-180)
Get-ADComputer -Properties LastLogonDate -Filter {LastLogonDate -lt $datecutoff} | Set-ADComputer -Enabled $false | Out-File ComputerLastLogon180.txt
