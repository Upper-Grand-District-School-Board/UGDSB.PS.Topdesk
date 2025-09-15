function Add-TopdeskAssetLink{
  [cmdletbinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$sourceid,
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$targetId,
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$capabilityId,
    [Parameter(Mandatory = $True)][ValidateSet("parent","child")][string]$linktype
  )
  $endpoint = '/tas/api/assetmgmt/assetLinks'
  $body = @{
    sourceId = $sourceid
    targetId = $targetId
    capabilityId = $capabilityId
    linkType = $linktype
  }
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference
  return $results.Results  
}