Get-Content extensions.list | ForEach-Object { code --install-extension $_ }


$vsCodePath = [System.IO.Path]::Combine((Resolve-Path $env:USERPROFILE).path, "AppData\Roaming\Code\User");
$vsCodeSnippetPath = [System.IO.Path]::Combine($vsCodePath, "snippets");


Copy-Item -Path .\settings.json -destination $vsCodePath

Copy-Item -Path .\snippets\* -destination $vsCodeSnippetPath -recurse
