function Add-TopdeskOperatorFilterCategory{
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter(Mandatory = $true)][string]$id,
    [Parameter(Mandatory = $true)][string]$filter_id
  )
  $endpoint = "/tas/api/operators/id/$($id)/filters/category"
  $body = [System.Collections.Generic.List[PSCustomObject]]@()
  $body.Add(@([PSCustomObject]@{
    id = $filter_id
  }))
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method POST -body ($body | ConvertTo-Json) -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }  
  return $results.results   
}