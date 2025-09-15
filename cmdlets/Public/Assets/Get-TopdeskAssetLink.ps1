function Get-TopdeskAssetLink{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$sourceid,
    [Parameter()][ValidateNotNullOrEmpty()][string]$targetId,
    [Parameter()][ValidateNotNullOrEmpty()][string]$capabilityId
  )
  $endpoint = '/tas/api/assetmgmt/assetLinks'
  $params = [System.Collections.Generic.List[string]]::new()
  $params.Add("sourceId=$($sourceid)")
  if ($PSBoundParameters.ContainsKey("targetId")) {
    $params.Add("targetId=$($targetId)")
  }
  if ($PSBoundParameters.ContainsKey("capabilityId")) {
    $params.Add("capabilityId=$($capabilityId)")
  }
  $uri = "$($endpoint)?$($params -join "&")"
  $results = Get-TopdeskAPIResponse -endpoint $uri -Verbose:$VerbosePreference
  return $results.Results
}