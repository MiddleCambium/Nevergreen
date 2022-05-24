

# Ste - 24/05/2022
# Link to the main download page https://support.code42.com/CP/Admin/On-premises/6/Planning_and_installing/Code42_server_and_app_downloads
# example link address on the download webpage https://download.code42.com/installs/client-package-repository/8.2.3/22/install/Code42_8.2.3_1525200006823_22_Win64.msi

try {

    $URL = Get-Link -Uri 'https://support.code42.com/CP/Admin/On-premises/6/Planning_and_installing/Code42_server_and_app_downloads' -MatchProperty href -Pattern 'Win64.msi'


    $Version = Get-Version -Uri 'https://support.code42.com/CP/Admin/On-premises/6/Planning_and_installing/Code42_server_and_app_downloads' -Pattern '((?:\d+\.)+(\d+\.)+(\d))&nbsp;Code42 app'


    New-NevergreenApp -Name 'Code42' -Version $Version -Uri $URL -Architecture 'x64' -Type 'msi'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}