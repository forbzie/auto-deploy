$VerbosePreference = 'continue'

if (get-command choco.exe -ErrorAction SilentlyContinue)
{
    $chocoVersion = choco --version
    Write-Verbose ("Chcolately version {0} Installed"-f $chocoVersion)
}
else
{
    Write-Verbose "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))  
}

try
{
    choco install Notepadplusplus --x86 -y
    choco install virtualbox -y
    choco install vagrant -y
    choco install googlechrome -y
    choco install git -y
    choco install github -y
}
catch
{
    write-verbose $_
}