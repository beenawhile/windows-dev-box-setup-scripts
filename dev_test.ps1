# Description: Boxstarter Script
# Author: Microsoft
# Common dev settings for machine learning using Windows and Linux native tools

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
  Param ([string]$script)
  write-host "executing $helperUri/$script ..."
  Invoke-Expression ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
# executeScript "FileExplorerSettings.ps1";
# executeScript "RemoveDefaultApps.ps1";
# executeScript "CommonDevTools.ps1";
# executeScript "HyperV.ps1";
# executeScript "WSL.ps1";
# executeScript "Docker.ps1";
executeScript "TestDevTools.ps1";
# executeScript "vscode/VscodeExtSettings.ps1";


write-host "Installing tools inside the WSL distro..."


write-host "Finished installing tools inside the WSL distro"

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
