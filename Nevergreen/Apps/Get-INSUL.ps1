# Ste - 05/05/2022
# Link to the main download page https://www.insul.co.nz/download/
# example link address on the download webpage https://www.insul.co.nz/media/29690/setup.exe

try {

    # href contains /media/29690/setup.exe, add the domain onto the front to complete the link
    $URL = Get-Link -Uri 'https://www.insul.co.nz/download/' -MatchProperty href -Pattern '.exe' -PrefixDomain

    # $Version returns 9.0.23
    $Version = Get-Version -Uri 'https://www.insul.co.nz/download/' -Pattern 'Windows, base install ((?:\d+\.)+(\d+\.)+(\d*))'


    New-NevergreenApp -Name 'INSUL' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}