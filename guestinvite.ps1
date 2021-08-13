##################### Invites Guests from a CSV and adds them to a specific group##############################
$Credential = Get-Credential
Connect-AzureAD -Credential $Credential
$Group = "ID HERE"
#$CSVrecords = Import-Csv C:\Users\path\csv -Delimiter ","
Foreach ($Guest in $CSVrecords)
{New-AzureADMSInvitation -InvitedUserDisplayName $Guest.Name -InvitedUserEmailAddress $Guest.Email -InviteRedirectURL https://myapps.microsoft.com -SendInvitationMessage $true
Start-Sleep -Seconds 5
$Nutzer = Get-AzureADUser -Filter "DisplayName eq '$($Guest.Name)'" |where {$_.UserType -eq 'Guest'}
Add-AzureADGroupMember -ObjectId $VerdeEltern -RefObjectId $Nutzer.Objectid 
Clear-Variable Nutzer
}
