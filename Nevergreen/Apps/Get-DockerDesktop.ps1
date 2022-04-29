try {

    $Version = Get-Version -Uri 'https://docs.docker.com/desktop/windows/release-notes/' -Pattern 'Docker Desktop ((?:\d+\.)+\d+)'

    $URL = (Get-Link -uri 'https://docs.docker.com/desktop/windows/release-notes/' -MatchProperty 'href' -Pattern '\.exe').Split('?')[0]

    New-NevergreenApp -Name 'Docker Desktop' -Version $Version -Uri $URL -Architecture 'x64' -Type 'Exe'

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}