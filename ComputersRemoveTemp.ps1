<#
    Script: ComputersRemoveTemp.ps1
    Propósito: Remover máquinas desativados no AD por "x" tempo definido por $datecutoff
        1. Máquinas desativados no AD
        2. Definição de tempo.
#>

#Variavel de tempo
$datecutoff = (Get-Date).AddDays(-30)

#Busca de Máquinas desabilitadas do AD
#Parametro de LastLogonDate
#Retorno de Informações dos usuário
#Exportar lista para arquivo csv

Get-ADComputer -Filter {(Enabled -eq $False)} -Properties LastLogonDate | where {$_.LastLogonDate -lt $datecutoff} | Select-Object Name, SamAccountName, LastLogonDate | Out-File C:\Users\gabrielle\Desktop\Scripts\DisableComputersTemp_Script.csv 

#Get-ADComputer -Filter {(Enabled -eq $False)} -Properties LastLogonDate | where {$_.LastLogonDate -lt $datecutoff} | Select-Object Name, SamAccountName, LastLogonDate | Remove-Computer -Confirm $True

$computers = Get-ADComputer -Filter {(Enabled -eq $False)} | where {$_.LastLogonDate -lt $datecutoff} 

Write-Host "Quantidade de Máquinas Desativados: $($computers.count)"

