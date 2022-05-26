
# Ste - 26/05/2022
# Link to the main download page https://velocio.net/vbuilder/
# example link address on the download webpage https://velocio.net/vBuilder.exe


try {

     $URL = Get-Link -Uri 'https://velocio.net/vbuilder' -MatchProperty href -Pattern '.exe'

     $Version = Get-Version -Uri 'https://velocio.net/vbuilder' -Pattern 'Current Version: ((?:\d+\.)+(\d*))'

    New-NevergreenApp -Name 'Velocio Networks vBuilder' -Version $Version -Uri $URL -Architecture 'x86' -Type 'exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}