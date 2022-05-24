
# Ste - 24/05/2022
# Link to the main download page https://www.barco.com/en/Support/software/R33050093
# link address on the download webpage https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R33050093&TdeType=3&MajorVersion=01&MinorVersion=02&PatchVersion=00&BuildVersion=006&ShowDownloadPage=False

try {

    $URL = Get-Link -Uri 'https://www.barco.com/en/Support/software/R33050093' -MatchProperty href -Pattern 'TdeFiles' -PrefixDomain


    $Version = Get-Version -Uri 'https://www.barco.com/en/Support/software/R33050093' -Pattern 'ClickShare Extension Pack v((?:\d+\.)+(\d+\.)+(\d))'


    New-NevergreenApp -Name 'Barco ClickShare Extension Pack' -Version $Version -Uri $URL -Architecture 'x86' -Type 'zip'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}