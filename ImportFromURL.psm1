function ImportFromURL {

 param(
    [Parameter(Mandatory = $false,ValueFromPipeLine = $true)]
    [string]$URL,
    [Parameter(Mandatory = $false)]
    [switch]$DLL,
    [Parameter(Mandatory = $false)]
    [switch]$Ps1,
    [Parameter(Mandatory = $false)]
    [switch]$Psm1
  )

  process {

    if (($URL -as [System.URI]).IsAbsoluteUri -eq $False) {

        Write-Verbose "URL is Missing http:// or https://"

        break

    }

  if ($URL -match ".DLL" -or $DLL -eq $true) {
 
    try{
        Import-Module ([System.Reflection.Assembly]::Load((Invoke-WebRequest -UseBasicParsing -Uri $URL).content)) -ErrorAction SilentlyContinue > $null
    }catch{
        Write-Verbose "Import-Module Failed to Import DLL, Make sure the Url is a direct link to the file."
    }

    break

  }

  if ($URL -match ".psm1" -or $Psm1 -eq $true) {
 
    try{
        New-Module -Name "$URL" -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString($URL))) -ErrorAction SilentlyContinue > $null
    }catch{
        Write-Verbose "Import-Module Failed to Import Psm1 Module, Make sure the Url is a direct link to the raw code"
    }

    break

  }

  if ($URL -match ".ps1" -or $Ps1 -eq $true) {

    iex ((New-Object System.Net.WebClient).DownloadString($URL))
    Write-Verbose "Attempting to invoke the Ps1 script (There is no error handling for .Ps1 scripts)"
    Write-Verbose "Windows Bug Tip: If a script prompts for UAC and then force closes the Session, Try running the session as admin"
    
    break

  }

  Write-Verbose "The URL does not conatin any of file extensions: .DLL, .Ps1, or Psm1, or is Invailed."
  Write-Verbose "Please add the -DLL, -Ps1 or -Psm1 parameter to let the function know what file type it is."

  }

}
