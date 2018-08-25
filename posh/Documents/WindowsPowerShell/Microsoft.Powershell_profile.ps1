function Ip-A {
    (Get-NetAdapter | Where {$_.Status -Match "Up"} | Get-NetIPAddress).IPv4Address
}

function W-Get-File ($url, $out) {
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

Set-Alias ipa Ip-A
Set-Alias wgetf W-Get-File 

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias nvim C:\tools\neovim\Neovim\bin\nvim.exe
Set-Alias nvim-qt C:\tools\neovim\Neovim\bin\nvim-qt.exe
