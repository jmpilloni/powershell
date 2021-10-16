#### Read Information from specific VMs (VMWare)
Connect-VIServer $Server
$VMs = Get-VM |
Where-Object{$_.ExtensionData.Config.GuestFullname -notmatch "win"} |
  Sort-Object -Property Name| 
Select-Object Name,
    @{N="Configured OS";E={$_.ExtensionData.Config.GuestFullname}},
    @{N="IPAdress";E={ $_.guest.ipAddress[0]}},
    @{N="Running OS";E={$_.Guest.OsFullName}}, 
    @{N="CPU";E={$_.numCpu}},
    @{N="Memory";E={$_.MemoryGB}},
    @{N="VMHost";E={$_.VMHost}},
    @{N="Powered On";E={ $_.PowerState -eq “PoweredOn”}},
    @{n="LUN ID"; E={$_.GuestOsFullName}}
 

Select-Object Name
#Write-Host $VMs  
$VMs | Export-Csv "C:\Temp\info.csv" -NoTypeInformation

