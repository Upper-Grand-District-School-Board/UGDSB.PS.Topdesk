function Set-TopdeskAssetArchive{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$assetid,
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string]$reasonid
  )
  $endpoint = "/tas/api/assetmgmt/assets/$($assetid)/archive"
  try{
    $body = @{
      "reasonId" = $reasonId
    }    
    # Execute API Call
    Get-TopdeskAPIResponse -endpoint $endpoint -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference -Method "Post" | Out-Null
    Write-Verbose "Archived asset id $($assetid)." 
  } 
  catch{
    throw $_
  }   
}