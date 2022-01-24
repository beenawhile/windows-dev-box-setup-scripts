
###############################################################################
### PowerShell Console                                                        #
###############################################################################
Write-Host "Configuring Console..." -ForegroundColor "Yellow"

# Make '3270-Medium Nerd Font Complete' an available Console font
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont' 000 'Hack Nerd Font'

@(`
    "HKCU:\Console\%SystemRoot%_System32_bash.exe", `
    "HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe", `
    "HKCU:\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe", `
    "HKCU:\Console\Windows PowerShell (x86)", `
    "HKCU:\Console\Windows PowerShell", `
    "HKCU:\Console"`
) | ForEach-Object {
  If (!(Test-Path $_)) {
    New-Item -path $_ -ItemType Folder | Out-Null
  }


}

Write-Output "Done. Note that some of these changes require a logout/restart to take effect."
