# 7DaysToBackup

### Small Powershell App to Backup Saves in 7 Days to Die


It is possible that the execution policy on your computer prevents you from runing scripts. If that is the case you should get an error that looks something like the following:

> File C:\Users\<user>\Desktop\PowerShell\7DaysToBackup.ps1 cannot be loaded because running
scripts is disabled on this system. For more information, see about_Execution_Policies at 
https:/go.microsoft.com/fwlink/?LinkID=135170.
>	+ CategoryInfo          : SecurityError: (:) [], ParentContainsErrorRecordException
>	+ FullyQualifiedErrorId : UnauthorizedAccess

If that is the case and you could like to be able to run this and other scripts, you can do so by opening powershell, pasting the following command into it, and pressing enter.

> Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass
