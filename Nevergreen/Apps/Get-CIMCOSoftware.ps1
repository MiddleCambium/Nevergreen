
# Ste - 24/05/2022
# main download page address is available after registering, however it seems that this link is not restricted
# in any way so we can use it from any device once we know it. https://www.cimco.com/download/public/
# example link address on the download webpage https://www.cimco.com/getfile.php?t=cimco&p=software&v=8.12.29

try {

    # The download page address ends in the version number of the downloadable app, so we need to get that first
    $Version = Get-Version -Uri 'https://www.cimco.com/download/public/' -Pattern 'edit&v=((?:\d+\.)+(\d+\.)+(\d*))'

    $DownloadPage = "https://www.cimco.com/download/registration/complete/?p=software&v=" + $Version

    $URL = Get-Link -Uri $DownloadPage -MatchProperty href -Pattern 'getfile\.php\?t=cimco'

    New-NevergreenApp -Name 'CIMCO Software' -Version $Version -Uri $URL -Architecture 'x86' -Type 'exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}