function Set-TopdeskOperatorGroupUnarchive{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Alias("id")][Parameter(Mandatory = $true)][string]$operatorGroupID
  )
  # The endpoint to get assets
  $endpoint = "/tas/api/operatorgroups/id/$($operatorGroupID)/unarchive"
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method PATCH -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results
}