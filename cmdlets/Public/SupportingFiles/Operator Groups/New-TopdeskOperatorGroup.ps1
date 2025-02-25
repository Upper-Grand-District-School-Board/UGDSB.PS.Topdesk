function New-TopdeskOperatorGroup{
  [CmdletBinding()]
  [OutputType([System.Collections.Generic.List[PSObject]])]
  param(
    [Parameter(Mandatory = $true)][String]$groupName,
    [Parameter(Mandatory = $true)][String]$branch_id,
    [Parameter()][String]$contact_id,
    [Parameter()][String]$contact_department_id,
    [Parameter()][String]$contact_department_name,
    [Parameter()][String]$contact_telephone,
    [Parameter()][String]$contact_faxNumber,
    [Parameter()][String]$contact_email,
    [Parameter()][String]$accessRoles_href,
    [Parameter()][String]$accessRoles_type        
  ) 
  # The endpoint to get assets
  $endpoint = "/tas/api/operatorgroups"   
  $body = @{}
  foreach($p in $PSBoundParameters.GetEnumerator()){
    if($p.key -in ("id","Verbose","Debug","ErrorAction","WarningAction","InformationAction","ErrorVariable","WarningVariable","InformationVariable","OutVariable","OutBuffer")){continue}
    if($p.key -match "_"){
      $split = $p.key -split "_"
      $nested = @{}
      for($i = ($split.length -1); $i -gt 0; $i--){
        if($i -eq ($split.length -1)){
          $nested = @{$split[$i] = $p.value}
        }
        else{
          $nested = @{$split[$i] = $nested}
        }
      }
      $body.Add($split[0],$nested)
    }
    elseif($p.key -match "password"){
      $body.add($p.key,(ConvertFrom-SecureString -SecureString $p.value -AsPlainText))
    }
    else{
      $body.add($p.key,$p.value)
    }    
  }
  try {
    $results = Get-TopdeskAPIResponse -endpoint $endpoint -Method "POST" -body ($body | ConvertTo-JSON) -Verbose:$VerbosePreference -AllowInsecureRedirect
    Write-Verbose "Updating Operator." 
  } 
  catch {
    throw $_
  } 
  return $results.results     
}