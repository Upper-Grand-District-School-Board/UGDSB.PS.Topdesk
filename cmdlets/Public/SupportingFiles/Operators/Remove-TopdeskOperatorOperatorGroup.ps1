function Remove-TopdeskOperatorOperatorGroup{
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter(Mandatory = $true)][string]$id,
    [Parameter(Mandatory = $true)][string]$operatorgroup_id
  )
  $endpoint = "/tas/api/operators/id/$($id)/operatorgroups"
  $body = [System.Collections.Generic.List[PSCustomObject]]@()
  $body.Add(@([PSCustomObject]@{
    id = $operatorgroup_id
  }))
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method DELETE -body ($body | ConvertTo-Json) -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }  
  return $results.results   
}