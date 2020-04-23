$b = $true
$Out = "Text"
Write-Output "Optimize .NET?"
$ex = read-host
if($ex -eq "y"){
C:\Windows\Microsoft.NET\Framework64\v2.0.50727\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework\v2.0.50727\ngen.exe executequeueditems
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe executequeueditems
}
Write-Output "Scan Health DISM?"
$ex = read-host
if($ex -eq "y"){
 $Out = DISM /Online /Cleanup-Image /ScanHealth | Out-String
 $Out = $Out.Remove(0, $Out.Length - 79)
 $Out
 $Out = $Out -split" "
 if ($Out -contains "успешно") {
   Write-Output "Done"
 }
 else {
  Write-Output "There is problem. Restore? (y/n)"
  $ex = read-host 
  if($ex -eq "y"){
   Write-Output "Start Restore"	 
   DISM /Online /Cleanup-Image /RestoreHealth | Out-Null
   Write-Output "Restore"
  }
  else{
   Write-Output "Ignore Restore"
   $b = $false
 }
}
 if($b) {sfc /scannow}
}
