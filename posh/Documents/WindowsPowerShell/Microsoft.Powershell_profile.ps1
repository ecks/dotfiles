function Ip-A {
    (Get-NetAdapter | Where {$_.Status -Match "Up"} | Get-NetIPAddress).IPv4Address
}

function W-Get-File ($url, $out) {
    (New-Object System.Net.WebClient).DownloadFile($url, $out)
}

function D-Nvim {
    docker run -u hasenov -w /data -it -v d:/:/data ecks/nvim:version2 /bin/bash
}

function D-Nvim-V {
    $Status = docker-machine status

    if($Status -eq "Stopped")
    {
      docker-machine start
    }

    $Mount = docker-machine ssh default "ls"
    
    if($Mount -ne "d")
    {
      docker-machine ssh default "mkdir d"
      docker-machine ssh default "sudo mount -t vboxsf d ~/d"
    }

    & "C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe" env | Invoke-Expression
    docker run -u hasenov -w /data -it -v /home/docker/d:/data ecks/nvim:version2 /bin/bash
}

function status-hyperv {
    Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

function enable-hyperv {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V–All
}

function disable-hyperv {
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
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
Set-Alias dnvim D-Nvim
Set-Alias dnvimv D-Nvim-V

Set-Alias shv status-hyperv
Set-Alias ehv status-hyperv
Set-Alias dhv status-hyperv

Set-Alias csc C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe
Set-Alias python3 C:\Users\hasenov\AppData\Local\Programs\Python\Python36-32\python.exe
