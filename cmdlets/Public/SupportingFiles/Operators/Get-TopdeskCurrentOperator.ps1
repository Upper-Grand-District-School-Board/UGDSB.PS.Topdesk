function Get-TopdeskCurrentOperator{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter()][switch]$settings
  )
  # The endpoint to get assets
  $endpoint = "/tas/api/operators/current"
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
    $current = $results.Results
    if ($PSBoundParameters.ContainsKey("settings")){
      $endpoint = "/tas/api/operators/current/settings"
      $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
      $current | Add-Member -MemberType NoteProperty -Name "Settings" -Value $results.Results      
    }
  }
  catch {
    throw $_
  }  
  return $current
}