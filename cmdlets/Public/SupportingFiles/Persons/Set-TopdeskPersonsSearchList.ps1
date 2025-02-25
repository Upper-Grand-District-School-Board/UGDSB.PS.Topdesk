function Set-TopdeskPersonsSearchList{
  [CmdletBinding()]
  [OutputType([System.Collections.Generic.List[PSObject]])]
  param(
    [Parameter(Mandatory = $true)][ValidateRange(1, 2)][int]$tab,
    [Parameter(Mandatory = $true)][ValidateRange(1, 5)][int]$searchList,
    [Parameter(Mandatory = $true)][string]$name
  )
  $endpoint = "/tas/api/persons/free_fields/$($tab)/searchlists/$($searchList)"
  $body = @{
    "name" = $name
  }
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method POST -body ($body | ConvertTo-Json) -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }  
  return $results.results    
}