# $beServerJobName = BE_SERVER
# $feServerJobName = FE_SERVER
. .\configs.ps1

Stop-Job $beServerJobName
Stop-Job $feServerJobName
Remove-Job $beServerJobName
Remove-Job $feServerJobName