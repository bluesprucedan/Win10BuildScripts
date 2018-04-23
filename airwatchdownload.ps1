powershell -command “& { iwr https://awagent.com/Home/DownloadWinPcAgentApplication -OutFile C:\Windows\Temp\AirWatchAgent.msi }”

Start-Process C:\Windows\Temp\AirWatchAgent.msi /passive
#Mess around with file location
