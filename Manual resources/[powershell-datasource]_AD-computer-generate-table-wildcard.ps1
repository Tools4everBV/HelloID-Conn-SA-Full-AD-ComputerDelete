try {
    $searchValue = $datasource.searchValue
    $searchQuery = "*$searchValue*"
    
    if(-not [String]::IsNullOrEmpty($searchValue)) {
        Write-information "searchQuery: $searchQuery"
        
        $computers = Get-ADComputer -Filter {Name -like $searchQuery} -properties name,description
        
        $computers = $computers | Sort-Object -Property Name
        $resultCount = @($computers).Count
        Write-information "Result count: $resultCount"
    	
        if(@($computers).Count -gt 0) {
            foreach($computer in $computers)
            {
                $returnObject = @{name=$computer.name; description=$computer.description;}
                Write-output $returnObject
            }
        } else {
            return
        }
    }
} catch {
    Write-error "Error searching AD computer [$searchValue]. Error: $($_.Exception.Message)"
    return
}

