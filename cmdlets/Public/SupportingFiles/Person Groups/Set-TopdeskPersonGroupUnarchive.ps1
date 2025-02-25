function Set-TopdeskPersonGroupUnarchive{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Alias("id")][Parameter(Mandatory = $true)][string]$personGroupID
  )
  # The endpoint to get assets
  $endpoint = "/tas/api/persongroups/$($personGroupID)/unarchive"
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method Post -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results
}