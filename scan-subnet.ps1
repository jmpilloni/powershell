1..254 | ForEach-Object {Get-WmiObject Win32_PingStatus -Filter $Subnet and Timeout=200 and ResolveAddressNames='true' and StatusCode=0" | select ProtocolAddress*}
