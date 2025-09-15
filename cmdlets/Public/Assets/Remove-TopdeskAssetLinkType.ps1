function Remove-TopdeskAssetLinkType{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$id
  )
  $endpoint = "/tas/api/assetmgmt/capabilities/$($id)"
  Get-TopdeskAPIResponse -endpoint $endpoint -method Delete -Verbose:$VerbosePreference  | Out-Null
}