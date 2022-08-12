$name = $form.gridComputers.name

try{
    $adComputer = Get-ADComputer -Filter { Name -eq $name }
    Write-Information -Message "Found AD computer [$name]"
} catch {
    Write-Error -Message "Failed to find AD computer account [$name]. Error: $_"
}

try{
    Remove-ADObject -Identity $adComputer.DistinguishedName -Recursive -Confirm:$false
    Write-Information -Message "Successfully deleting AD computer account [$name]"
    $Log = @{
        Action = "DeleteResource"
        System = "ActiveDirectory"
        Message = "Deleted computer account with name [$name]"
        IsError = $false
        TargetDisplayName = $name
        TargetIdentifier = $adComputer.SID
    }
    Write-Information -Tags "Audit" -MessageData $Log
} catch {
    Write-Error -Message "Failed to delete AD computer account [$name]. Error: $_"
    $Log = @{
        Action = "DeleteResource"
        System = "ActiveDirectory"
        Message = "Failed to delete AD computer account [$name]. Error: $_"
        IsError = $true
        TargetDisplayName = $name
        TargetIdentifier = $adComputer.SID
    }
    Write-Information -Tags "Audit" -MessageData $Log
}
