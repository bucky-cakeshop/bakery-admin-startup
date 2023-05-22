$currentDirectory = Get-Location
$rootPath=$args[0]
$comment=$args[1]

write-host $rootPath
write-host $comment

$files = Get-ChildItem $rootPath
$gitFolder = ".\.git"
for ($i=0; $i -lt $files.Count; $i++) {
    $outfile = $files[$i].FullName
	#write-host $outfile
	Set-Location $outfile 
	#Get-ChildItem
	if (Test-Path -Path $gitFolder) {
		"Git Repository"
		git add .
		git commit -m $comment
		git push
	} else {
		"NO GIT"
	}
	Set-Location ..
	
    #Get-Content $files[$i].FullName | Where-Object { ($_ -match 'step4' -or $_ -match 'step9') } | Set-Content $outfile
}
cd $currentDirectory


#for (DIR in `ls $rootPath`);
#do
#    if [ -d $DIR/.git ];
#    then
#            echo "updating location: " $DIR;
#            cd $DIR
            # your commands here...
            # git add .
            # git commit -m $comment
			#git push

            #cd ..
    #fi
#done
