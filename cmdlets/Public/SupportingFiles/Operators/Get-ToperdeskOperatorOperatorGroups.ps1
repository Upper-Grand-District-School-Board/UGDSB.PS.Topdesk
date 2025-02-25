function Get-ToperdeskOperatorOperatorGroups{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter(Mandatory = $true)][string]$id,
    [Parameter()][ValidateNotNullOrEmpty()][string]$query
  )   
  $endpoint = "/tas/api/operators/id/$($id)/operatorgroups"
  # Create a list of the URI parts that we would add the to the endpoint
  $uriparts = [System.Collections.Generic.List[PSCustomObject]]@()  
  # If query is not null, then add to URI parts
  if ($PSBoundParameters.ContainsKey("query")) { $uriparts.add("query=$($query)") }    
  # Generate the final API endppoint URI
  $endpoint = "$($endpoint)?$($uriparts -join "&")"      
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Verbose:$VerbosePreference
  }
  catch {
    throw $_
  }    
  $results.Results    
}