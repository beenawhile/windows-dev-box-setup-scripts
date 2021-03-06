#--- Uninstall unnecessary applications that come with Windows out of the box ---
Write-Host "Uninstall some applications that come with Windows out of the box" -ForegroundColor "Yellow"

#Referenced to build script
# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1

function removeApp {
  Param ([string]$appName)
  Write-Output "Trying to remove $appName"
  Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
  Get-AppXProvisionedPackage -Online | Where-Object DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
  "Microsoft.3DBuilder"
  "Microsoft.Microsoft.WindowsAlarms"
  "Microsoft.BingFinance"
  "Microsoft.BingNews"
  "Microsoft.BingSports"
  "Microsoft.BingWeather"
  "Microsoft.WindowsFeedbackHub"
  "Microsoft.CommsPhone"
  "Microsoft.Getstarted"
  "Microsoft.WindowsMaps"
  "Microsoft.Windows.Photos"
  "Microsoft.SkypeApp"
  "*MarchofEmpires*"
  "Microsoft.GetHelp"
  "Microsoft.Messaging"
  "microsoft.windowscommunicationsapps"
  "*Minecraft*"
  "Microsoft.MicrosoftOfficeHub"
  "Microsoft.OneConnect"
  "Microsoft.Office.OneNote"
  "Microsoft.People"
  "Microsoft.Microsoft3DViewer"
  "Microsoft.MixedReality.Portal*"
  "*Skype*"
  "Microsoft.WindowsPhone"
  "Microsoft.WindowsSoundRecorder"
  "*Solitaire*"
  "Microsoft.MicrosoftStickyNotes"
  "Microsoft.Office.Sway"
  "Microsoft.XboxApp"
  "Microsoft.XboxIdentityProvider"
  "Microsoft.XboxGameOverlay"
  "Microsoft.XboxGamingOverlay"
  "Microsoft.ZuneMusic"
  "Microsoft.ZuneVideo"
  "Microsoft.NetworkSpeedTest"
  "Microsoft.FreshPaint"
  "Microsoft.Print3D"
  "king.com.CandyCrush*"
  "*Autodesk*"
  "*.AutodeskSketchBook"
  "*BubbleWitch*"
  "king.com*"
  "G5*"
  "*Dell*"
  "*Facebook*"
  "*Instagram*"
  "*Keeper*"
  "*Netflix*"
  "*Twitter*"
  "*Plex*"
  "*Spotify*"
  "*TikTok*"
  "*Amazon*"
  "*Roblox*"
  "*.Duolingo-LearnLanguagesforFree"
  "*.EclipseManager"
  "ActiproSoftwareLLC.562882FEEB491" # Code Writer
  "*AdobePhotoshop*"
  "*.AdobePhotoshopExpress"
  "*AdobePhotoshopExpress*"
);

foreach ($app in $applicationList) {
  removeApp $app
}
