function Get-TopdeskAssetLinkRelations{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$sourceid,
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$targetId
  )  
  $endpoint = '/tas/api/assetmgmt/assetLinks'
  $body = @{
    sourceId = $sourceid
    targetId = $targetId
  }
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference
  return $results.Results    
}