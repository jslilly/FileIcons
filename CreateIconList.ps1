
Write-Host "Updating iconlist.txt..." -ForegroundColor Cyan -NoNewline

$solDir = (Split-Path (Get-Variable MyInvocation).Value.MyCommand.Path)
$path = $solDir + "\src\icons.pkgdef"
$content = Get-Content $path

$list = ([regex]'\\([^\\\]]+)]').Matches($content) `
		| Sort-Object `
		| foreach {"- " + $_.groups[1].value}

"## Supported File Extensions`n`n" + ($list -join "`r`n") | Set-Content ($solDir + "\FileExtenions.md")

Write-Host "OK" -ForegroundColor Green