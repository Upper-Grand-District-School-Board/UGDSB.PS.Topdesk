function Remove-TopdeskAssetLink{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$relationId
  )
  $endpoint = "/tas/api/assetmgmt/assetLinks/$($relationId)"
  Get-TopdeskAPIResponse -endpoint $endpoint -method Delete -Verbose:$VerbosePreference | Out-Null
}