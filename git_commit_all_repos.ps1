$currentDirectory = Get-Location
$rootPath=$args[0]
$comment=$args[1]

write-host $rootPath
write-host $comment

$files = Get-ChildItem $rootPath
$gitFolder = ".\.git"
for ($i=0; $i -lt $files.Count; $i++) {
    $outfile = $files[$i].FullName
	Set-Location $outfile 
	if (Test-Path -Path $gitFolder) {
		"Git Repository"
		git add .
		git commit -m $comment
		git push
	} else {
		"NO GIT"
	}
	Set-Location ..
}
Set-Location $currentDirectory