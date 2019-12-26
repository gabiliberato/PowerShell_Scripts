<#
    Script: UsersRemoveTemp.ps1
    Propósito: Remover usuários desativados no AD por "x" tempo definido por $datecutoff
        1. Usuários desativados no AD
        2. Definição de tempo.
#>

#Variavel de tempo
$datecutoff = (Get-Date).AddDays(-60)

#Busca de usuários desabilitados do AD
#Parametro de LastLogonDate
#Retorno de Informações dos usuários
Search-ADAccount -UsersOnly -AccountDisable |where {$_.LastLogonDate -lt $datecutoff} |Select-Object Name, DistinguishedName,Enabled, UserPrincipalName,LastLogonDate 

#Remoção de usuários 
#Search-ADAccount -UsersOnly -AccountDisable |where {$_.LastLogonDate -lt $datecutoff} |Select-Object Name, DistinguishedName,Enabled, UserPrincipalName,LastLogonDate | Remove-ADUser -Confirm

#Variavel de Parametros
$users = Search-ADAccount -UsersOnly -AccountDisable | where {$_.LastLogonDate -lt $datecutoff} 

#Quantidade de usuários desabilitados
Write-Host "Quantidade de Usuários Desativados: $($users.count)"