function Get-TopdeskOperatorGroupOperators{
  [CmdletBinding()]
  [OutputType([System.Collections.Generic.List[PSObject]])]
  param(
    [Parameter(Mandatory = $true)][string]$id
  )  
  $endpoint = "/tas/api/operatorgroups/id/$($id)/operators"
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results    
}