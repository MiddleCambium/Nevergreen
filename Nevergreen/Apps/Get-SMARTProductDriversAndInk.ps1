# Ste - 29/04/2022
# Link to the main download page https://support.smarttech.com/docs/software/product-drivers-ink/12-5/en/downloads/drink-windows-download.cshtml
# link address on the download webpage "https://downloads.smarttech.com/software/driversink/12_18/smartproductdrivers12_18ink5_11.exe"

try {

    $URL = Get-Link -Uri 'https://support.smarttech.com/docs/software/product-drivers-ink/12-5/en/downloads/drink-windows-download.cshtml' -MatchProperty href -Pattern '.exe'
    #URL returns https://downloads.smarttech.com/software/driversink/12_18/smartproductdrivers12_18ink5_11.exe

    $Version = Get-Version -Uri 'https://support.smarttech.com/docs/software/product-drivers-ink/12-5/en/downloads/drink-windows-download.cshtml' -Pattern 'SMART&#160;Product Drivers: ((?:\d+\.)+(\d+\.)+(\d+\.)+(\d+))'
    # $Version returns 12.18.245.0

    New-NevergreenApp -Name 'SMART Product Drivers And Ink' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}