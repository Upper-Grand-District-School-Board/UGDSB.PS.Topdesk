function Set-TopdeskAssetLinkType{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True)][ValidateNotNullOrEmpty()][string]$id,
    [Parameter()][ValidateNotNullOrEmpty()][string]$name,
    [Parameter()][ValidateNotNullOrEmpty()][bool]$inheritLocation,
    [Parameter()][ValidateNotNullOrEmpty()][bool]$inheritPerson
  )
  $endpoint = "/tas/api/assetmgmt/capabilities/$($id)"
  $body = @{}
  if ($PSBoundParameters.ContainsKey("name")) {
    $body.name = $name
  }
  if ($PSBoundParameters.ContainsKey("inheritLocation") -or $PSBoundParameters.ContainsKey("inheritPerson")) {
    $body.inheritance = @{}
    if ($PSBoundParameters.ContainsKey("inheritLocation")){
      $body.inheritance.location = $inheritLocation
    }
    if ($PSBoundParameters.ContainsKey("inheritPerson")) {
      $body.inheritance.person = $inheritPerson
    }
    
  }  
  $results = Get-TopdeskAPIResponse -endpoint $endpoint -method Post -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference
  return $results.Results
}
<#
    $body.inheritance.Add("location",$inheritLocation)
  }
  if ($PSBoundParameters.ContainsKey("inheritPerson")) {
    $body.inheritance.Add("person", $inheritPerson)

#>