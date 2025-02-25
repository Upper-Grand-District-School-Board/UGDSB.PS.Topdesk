function Get-TopdeskLocations{
  [cmdletbinding()]
  [OutputType([System.Collections.Generic.List[PSCustomObject]])]
  param(
    [Parameter()][string]$id,
    [Parameter()][string]$query,
    [Parameter()][string]$fields,
    [Parameter()][int]$page_size
  )  
  # The endpoint to get assets
  $endpoint = "/tas/api/locations"
  if ($PSBoundParameters.ContainsKey("id")) {
    $endpoint = "$($endpoint)/id/$($id)"
  }  
  # Create a list of the URI parts that we would add the to the endpoint
  $uriparts = [System.Collections.Generic.List[PSCustomObject]]@()
  if ($PSBoundParameters.ContainsKey("fields")) { $uriparts.add("`$fields=$($fields)") }     
  if ($PSBoundParameters.ContainsKey("page_size")) { $uriparts.add("page_size=$($page_size)") }     
  if ($PSBoundParameters.ContainsKey("query")) { $uriparts.add("query=$($query)") }         
  # Generate the final API endppoint URI
  $endpoint = "$($endpoint)?$($uriparts -join "&")"  
  try {
    # Array to hold results from the API call
    $data = [System.Collections.Generic.List[PSObject]]@()
    $uri = $endpoint
    do {
      # Execute API Call
      $results = Get-TopdeskAPIResponse -endpoint $uri -Verbose:$VerbosePreference
      # Load results into an array
      foreach ($item in $results.results) {
        $data.Add($item) | Out-Null
      }
      $pagestart += $page_size
      Write-Verbose "Returned $($results.Results.item.Count) results. Current result set is $($data.Count) items."      
      $uri = $uri -replace "start=\d*", "start=$($pagestart)"
    }
    while ($all.IsPresent -and $results.StatusCode -eq 206)
  }
  catch {
    throw $_
  }  
  return $data     
}