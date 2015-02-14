Function RunIt {
  Param([Parameter(Mandatory=$true)] [scriptblock] $Action)
  &$Action
  if ($LastExitCode -ne 0) { throw "Command failed with exit code $LastExitCode" }
}

Write-Host "Install Chocolatey"
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Install Git"
RunIt { choco install git.install }

Write-Host "Install Notepad"
RunIt { choco install notepadplusplus.install }

Write-Host "Install 7-zip"
RunIt { choco install 7zip.install }

Write-Host "Install Putty"
RunIt { choco install putty }

