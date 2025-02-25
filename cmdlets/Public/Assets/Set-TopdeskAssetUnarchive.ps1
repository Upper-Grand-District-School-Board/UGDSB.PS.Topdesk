function Set-TopdeskAssetUnarchive{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$assetid
  )
  $endpoint = "/tas/api/assetmgmt/assets/$($assetid)/unarchive"
  try{
    # Execute API Call
    Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference -Method "Post" | Out-Null
    Write-Verbose "Unarchived asset id $($assetid)." 
  } 
  catch{
    throw $_
  }   
}