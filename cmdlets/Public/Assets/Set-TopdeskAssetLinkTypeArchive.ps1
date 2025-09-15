function Set-TopdeskAssetLinkTypeArchive{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$id
  )
  $endpoint = "/tas/api/assetmgmt/capabilities/$($id)/archive"
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -Verbose:$VerbosePreference
  return $results.Results  
}