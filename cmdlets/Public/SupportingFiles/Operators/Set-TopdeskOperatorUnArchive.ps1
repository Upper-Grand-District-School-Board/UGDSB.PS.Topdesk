function Set-TopdeskOperatorUnArchive {
  [CmdletBinding()]
  [OutputType([System.Collections.Generic.List[PSObject]])]
  param(
    [Parameter(Mandatory = $true)][string]$id
  )
  $endpoint = "/tas/api/operators/id/$($id)/unarchive"
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method PUT -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }  
  return $results.results  
}