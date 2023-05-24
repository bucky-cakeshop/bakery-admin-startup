$currentDirectory = Get-Location
$rootPath=$args[0]
# $comment=$args[1]

$Default_Message = "Última versión, FE BE Commit."
$BE_Message = Read-Host -Prompt "BE commit message"
$FE_Message = Read-Host -Prompt "FE commit message"


$files = Get-ChildItem $rootPath
$gitFolder = ".\.git"
for ($i=0; $i -lt $files.Count; $i++) {
    $outfile = $files[$i].FullName
	$comment = $Default_Message
	if($outfile -like "*frontend*"){
		Write-Host $outfile " IS FE"
		$comment = $FE_Message
	}elseif ($outfile -like "*backend*") {
		Write-Host $outfile " IS BE"
		$comment = $BE_Message
	}

	Set-Location $outfile 
	if (Test-Path -Path $gitFolder) {
		write-host "Git Repository" -BackgroundColor DarkGreen
		write-host ""
		git add .
		git commit -m $comment
		git push
	} else {
		"NO GIT"
	}
	Set-Location ..
}
Set-Location $currentDirectory