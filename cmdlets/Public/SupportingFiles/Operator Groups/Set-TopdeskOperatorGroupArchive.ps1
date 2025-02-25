function Set-TopdeskOperatorGroupArchive{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Alias("id")][Parameter(Mandatory = $true)][string]$operatorGroupID,
    [Parameter()][string]$archivereasonid
  )
  # The endpoint to get assets
  $endpoint = "/tas/api/operatorgroups/id/$($operatorGroupID)/archive"
  if ($PSBoundParameters.ContainsKey("archivereasonid")) { 
    $body = @{
      id = $archivereasonid
    }
  }   
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method PATCH -Body ($Body | ConvertTo-JSon) -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results
}