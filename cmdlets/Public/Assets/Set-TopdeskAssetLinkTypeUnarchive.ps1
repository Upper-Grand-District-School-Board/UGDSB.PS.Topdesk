function Set-TopdeskAssetLinkTypeUnarchive{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$id
  )
  $endpoint = "/tas/api/assetmgmt/capabilities/$($id)/unarchive"
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -Verbose:$VerbosePreference
  return $results.Results    
}