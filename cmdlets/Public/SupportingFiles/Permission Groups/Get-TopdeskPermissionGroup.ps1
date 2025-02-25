function Get-TopdeskPermissionGroup{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
  )  
  # The endpoint to get assets
  $endpoint = "/tas/api/permissiongroups"  
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results  
}