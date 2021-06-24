try{
    $adComputer = Get-ADComputer -Filter { Name -eq $name }
    HID-Write-Status -Message "Found AD computer [$name]" -Event Information
    HID-Write-Summary -Message "Found AD computer [$name]" -Event Information
} catch {
    HID-Write-Status -Message "Could not find AD computer [$name]. Error: $_" -Event Error
    HID-Write-Summary -Message "Failed to find AD computer [$name]" -Event Failed
}

try{
    Remove-ADObject -Identity $adComputer.DistinguishedName -Recursive -Confirm:$false
    HID-Write-Status -Message "Finished deleting AD computer [$name]" -Event Success
    HID-Write-Summary -Message "Successfully deleted AD computer [$name]" -Event Success
} catch {
    HID-Write-Status -Message "Could not delete AD computer [$name]. Error: $_" -Event Error
    HID-Write-Summary -Message "Failed to delete AD computer [$name]" -Event Failed
}
