Get-Content -Path C:\Users\Administrator\Desktop\OUStructure.csv | ForEach-Object{
    $DomainName = "DC=2kgames,DC=t2,DC=corp"
    $OrgUnitPath = ""
    $OrgUnits = (Split-Path $_ -Parent).Split("\")
    [array]::Reverse($OrgUnits)
    $OrgUnits | ForEach-Object{
    if($_.Length -eq 0){
    return
    }
    $OrgUnitPath = $OrgUnitPath + "OU=" + $_ +","
    }
    $OrgUnitPath +=$DomainName
    $NewOrgUnitName = Split-Path $_ -Leaf
    New-ADOrganizationalUnit -Name "$NewOrgUnitName" -Path "$OrgUnitPath" -ProtectedFromAccidentalDeletion $false

}