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
  iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "HyperV.ps1";
executeScript "WSL.ps1";

# system and cli
choco install -y curl                --limit-output

# browsers
choco install -y GoogleChrome        --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output
choco install -y GoogleChrome.Canary --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome.Canary --limit-output
choco install -y Firefox             --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output
choco install -y Opera               --limit-output; <# pin; evergreen #> choco pin add --name Opera               --limit-output

#fonts
choco install sourcecodepro                       --limit-output

# dev tools and frameworks
choco install -y vscode                           --limit-output
choco install -y microsoft-windows-terminal --pre --limit-output
choco install -y teamviewer                       --limit-output
choco install -y everything                       --limit-output
choco install -y dropbox                          --limit-output
choco install -y vim                              --limit-output
choco install -y ditto                            --limit-output
choco install -y slack                            --limit-output


write-host "Installing tools inside the WSL distro..."
# Ubuntu1804 run apt install python2.7 python-pip -y 
# Ubuntu1804 run apt install python-numpy python-scipy -y
# Ubuntu1804 run pip install pandas

write-host "Finished installing tools inside the WSL distro"

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula