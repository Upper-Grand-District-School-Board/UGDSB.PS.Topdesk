function New-TopdeskAssetLinkType{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$name
  )    
  $endpoint = "/tas/api/assetmgmt/capabilities"
  $body = @{
    name = $name
  }
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference
  return $results.Results
}