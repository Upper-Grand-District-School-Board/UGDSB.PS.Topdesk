function Get-TopdeskOperatorFilterCategory{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter()][string]$id
  )  
  # The endpoint to get assets
  $endpoint = "/tas/api/operators"  
  if ($PSBoundParameters.ContainsKey("id")) {
    $endpoint = "$($endpoint)/id/$($id)"
  }
  $endpoint = "$($endpoint)/filters/category"  
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results  
}