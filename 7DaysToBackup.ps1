$gameActive = Get-Process "7DaysToDie" -ErrorAction SilentlyContinue

If ($gameActive) {
    $versionControl = $True

    #Get Username
    $me = whoami
    $me = $me.split("\\")[1]

    #build save path string
    $savePath = "C:\Users\$me\AppData\Roaming\7DaysToDie\Saves"
    $savePath

    #Create backups folder if it does not exist
    $backupPath = "$savePath\Backups"
    If (!(Test-Path -Path $backupPath)){
        New-Item -ItemType directory -Path "$backupPath"
        New-Item -ItemType directory -Path "$backupPath\Navezgane"
        New-Item -ItemType directory -Path "$backupPath\Random Gen"
    }

    #Get most recent save files
    $navezganeSave = Get-ChildItem "$savePath\Navezgane" | sort LastWriteTime | select -last 1
    $randSave = Get-ChildItem "$savePath\Random Gen" | sort LastWriteTime | select -last 1
    
    #Get date to append to file for multiple backup versions
    $now = Get-Date -Format "yyyy-MM-dd hh:mm tt"
    $now = $now -replace ":"
    If ($navezganeSave.LastWriteTime -gt $randSave.LastWriteTime) {
        
        $sourcePath = $navezganeSave.FullName
        $destPath = "$backupPath\Navezgane\$($navezganeSave.Name)"
        If ($versionControl) {
            $destPath = "$destPath $now"
        }
        Copy-Item -Path $sourcePath -Dest $destPath -Recurse -Force
    } Else {
        $sourcePath = $randSave.FullName
        $destPath = "$backupPath\Random Gen\$($randSave.Name)"
        If ($versionControl) {
            $destPath = "$destPath $now"
        }
        Copy-Item -Path $sourcePath -Dest $destPath -Recurse -Force
    }
}
