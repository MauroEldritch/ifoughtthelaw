#Lansky
#Este script chequea hosts vulnerables a DROWN y POODLE.
#Idea original por yourbastianhost
#Basado en: https://www.reddit.com/r/PowerShell/comments/48oof9/test_for_drown_vulnerability/
#Descargar OpenSSL desde http://gnuwin32.sourceforge.net/packages/openssl.htm
#Cambiar los parámetros en CONFIGURAME
clear

#####CONFIGURAME#####
$pathToOpenSSL = "D:\Seguridad\openssl\bin\openssl.exe";
$outputLogFile = "D:\Seguridad\lansky\Vulnerable_FQDNs.txt"

$ArrayOfFQDNs =     @(
                    'seguridadciudad.gob.ar:443',
                    'dgspr.mjys.buenosaires.gob.ar:443',
                    'policiadelaciudad.gob.ar:443',
                    'ci.policiadelaciudad.gob.ar:443',
                    'bomberoscaba.gob.ar:443',
                    '181.44.1.2:443'
                    );

#####CONFIGURAME#####
Clear-Content $outputLogFile
if (!(Test-Path $pathToOpenSSL))
{
    Write-Error "No se encuentra el binario de OpenSSL en: $pathToOpenSSL";
    return;
}

#Calcular un número seguro de threads/hilos
$property = "numberOfCores", "NumberOfLogicalProcessors"
$cpuInfo = Get-WmiObject -class win32_processor -Property $property | Select-Object -Property $property
$suggestedThreads = ($cpuInfo.numberOfLogicalProcessors * $cpuInfo.NumberOfCores)
$Throttle = $suggestedThreads;

#Prueba de conectividad con SSLv2 para DROWN y SSLv3 para POODLE
  $ScriptBlock = {
      Param (
             [string]$serverFQDN,
             [string]$saveas,
             [string]$vulnLogFile
      )

      $testResult = & $saveas s_client -connect $serverFQDN -ssl2 2>&1
      Write-Output $testResult;
      #Rutina para DROWN
      if ($testResult -match 'SSL handshake failure')
      {
             Write-output "[OK] $serverFQDN";
      }
      else
      {
             Write-Output "[!!] $serverFQDN";
             Add-Content $vulnLogFile "$serverFQDN vulnerable a DROWN`n";
      }
      #Rutina para POODLE
      $vulnerable = echo "Q`n" | D:\Seguridad\openssl\bin\openssl.exe s_client -connect $serverFQDN -ssl3 | Out-String -stream | Select-String Protocol; if ($vulnerable) { Add-Content $vulnLogFile "$serverFQDN vulnerable a POODLE`n"; $vulnerable = '';}

      }


#Crear un runspace con la cantidad de hilos adecuada
$RunspacePool = [RunspaceFactory]::CreateRunspacePool(1, $Throttle)
$RunspacePool.Open()
$Jobs = @();


#Rutina para iterar el array
foreach ($serverFQDN in $ArrayOfFQDNs)
{
    $Job = [powershell]::Create().AddScript($ScriptBlock).AddArgument($serverFQDN).AddArgument($pathToOpenSSL).AddArgument($outputLogFile);
    $Job.RunspacePool = $RunspacePool
    $Jobs += New-Object PSObject -Property @{
        RunNum = $_
        Pipe = $Job
        Result = $Job.BeginInvoke()
    }
}

Write-Host "Lansky v1.00 | 2017"
gc banner.dat
Write-Host "`nBuscando sitios vulnerables a DROWN (v2) / POODLE (v3):`n"
Do
{
   Start-Sleep -Seconds 2
}
While ($Jobs.Result.IsCompleted -contains $false)

if (Test-Path $outputLogFile)
{
    #Chequear si algo fue escrito al log.
    ii $outputLogFile;
}
else
{
    #Nada es vulnerable
    Write-Host "No se han encontrado sitios vulnerables."   
}

gc $outputLogFile
