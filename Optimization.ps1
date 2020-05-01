Write-Output "`n Optimize .NET?"
$ex = read-host
if($ex -eq "y"){
C:\Windows\Microsoft.NET\Framework64\v2.0.50727\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework\v2.0.50727\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe executequeueditems
}
Write-Output "`n Scan Health DISM? (y/n)"
$ex = read-host
if($ex -eq "y"){
DISM /Online /Cleanup-Image /ScanHealth
 Write-Output "`n There is problem? Restore? (y/n)"
 $ex = read-host
 if($ex -eq "y"){
  DISM /Online /Cleanup-Image /RestoreHealth | Out-Null
  }
 }
 else{
  Write-Output "`n Ignore Restore"
}
Write-Output "`n Scan now? (y/n)"
$ex = read-host
if($ex -eq "y"){
 sfc /scannow
 }
