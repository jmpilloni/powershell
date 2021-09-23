1..254 | ForEach-Object {Test-Connection -ComputerName "192.168.0.$_" -Count 1 -ErrorAction SilentlyContinue}
