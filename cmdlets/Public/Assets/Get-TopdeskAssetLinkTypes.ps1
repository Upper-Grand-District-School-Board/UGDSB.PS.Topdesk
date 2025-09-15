function Get-TopdeskAssetLinkTypes{
  [CmdletBinding()]
  param(
    [Parameter()][ValidateNotNullOrEmpty()][string]$id
  )  
  $endpoint = "/tas/api/assetmgmt/capabilities"
  if ($PSBoundParameters.ContainsKey("id")) {
    $endpoint = "$($endpoint)/$($id)"
  }
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
  if ($PSBoundParameters.ContainsKey("id")) {
    return $results.Results
  }
  else{
    return $results.Results.dataSet
  }
}