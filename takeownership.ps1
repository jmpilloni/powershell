# Takes ownership of all files
# Define the owner account/group
$Account = New-Object -TypeName System.Security.Principal.NTAccount -ArgumentList '####USER HERE#####';

# Get a list of folders and files
$ItemList = Get-ChildItem -Path E:\Users\Shari\Dropbox\mic\Kamera-Uploads -Recurse;

# Iterate over files/folders
foreach ($Item in $ItemList) {
    $Acl = $null; # Reset the $Acl variable to $null
    $Acl = Get-Acl -Path $Item.FullName; # Get the ACL from the item
    $Acl.SetOwner($Account); # Update the in-memory ACL
    Set-Acl -Path $Item.FullName -AclObject $Acl;  # Set the updated ACL on the target item 
    }
