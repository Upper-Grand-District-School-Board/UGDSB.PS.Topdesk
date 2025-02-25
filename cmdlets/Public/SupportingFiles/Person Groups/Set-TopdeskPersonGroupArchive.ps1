function Set-TopdeskPersonGroupArchive{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Alias("id")][Parameter(Mandatory = $true)][string]$personGroupID,
    [Parameter()][string]$archivereasonid
  )
  # The endpoint to get assets
  $endpoint = "/tas/api/persongroups/$($personGroupID)/archive"
  if ($PSBoundParameters.ContainsKey("archivereasonid")) { 
    $body = @{
      id = $archivereasonid
    }
  }   
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method Post -Body ($Body | ConvertTo-JSon) -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results
}