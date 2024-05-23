# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#oh-my-posh
#Import-Module posh-git
#$omp_config = Join-Path $PSScriptRoot ".\xube.omp.json"
#oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

#starship
$ENV:STARSHIP_CONFIG = "$HOME\starship.toml"
Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias cr clear
Set-Alias -Name home -Value ('~/.config/powershell/home.ps1')

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Define a custom function to mimic Nushell's ls output
function Show-Directory {
    param (
        [string]$Path = "."
    )
    
    Get-ChildItem -Path $Path | Select-Object Name, @{Name='Size';Expression={($_.Length / 1KB).ToString("N0") + ' KB'}}, @{Name='Type';Expression={if ($_.PSIsContainer) {'Directory'} else {'File'}}}, LastWriteTime |
    Format-Table -AutoSize
}


