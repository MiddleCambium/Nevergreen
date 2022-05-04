# Ste - 04/05/2022
# Link to the main download page https://www.karenware.com/powertools/karens-directory-printer
# link address on the download webpage https://www.karenware.com//d/Karens-Directory-Printer-v5.4.4-Setup.exe

try {

    # href contains /d/Karens-Directory-Printer-v5.4.4-Setup.exe, add the domain onto the front to complete the link
    $URL = Get-Link -Uri 'https://www.karenware.com/powertools/karens-directory-printer' -MatchProperty href -Pattern '.exe' -PrefixDomain

    # $Version returns 5.4.4
    $Version = Get-Version -Uri 'https://www.karenware.com/powertools/karens-directory-printer' -Pattern 'Version ((?:\d+\.)+(\d+\.)+(\d))'


    New-NevergreenApp -Name 'Karens Directory Printer' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}