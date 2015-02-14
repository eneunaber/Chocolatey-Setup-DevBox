Function RunIt {
  Param([Parameter(Mandatory=$true)] [scriptblock] $Action)
  &$Action
  if ($LastExitCode -ne 0) { throw "Command failed with exit code $LastExitCode" }
}

Write-Host "Un-Install Git"
RunIt { cuninst git.install }

Write-Host "Un-Install Notepad"
RunIt { cuninst notepadplusplus.install }

Write-Host "Un-Install 7-zip"
RunIt { cuninst 7zip.install }

Write-Host "Un-Install Putty"
RunIt { cuninst putty }

Function Remove-Chocolatey{
	Remove-Item Env:\ChocolateyInstall
	$strFolderName="C:\ProgramData\chocolatey\"
	If (Test-Path $strFolderName){
		Remove-Item $strFolderName
	}	
}

Write-Host "Un-Install Chocolatey"
Remove-Chocolatey