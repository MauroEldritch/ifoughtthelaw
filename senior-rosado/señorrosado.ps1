#SeñorRosado
#Esta utilidad escanea un sitio para buscar errores de SSL Certificate Name Mismatch

param (
	[Parameter(Mandatory=$true)][string]$scanFQDN
)
clear
echo "Senor Rosado - V1.00"
echo "`n"
gc banner.dat
echo "`n"
$coincide = echo "Q`n" | openssl s_client -showcerts -servername gnupg.org -connect $scanFQDN | openssl x509 -inform pem -noout -text | Out-String -stream | Select-String CN= | Select-Object -Last 1; 
$final = "$coincide".Split('=')[3];

if ($final -ne $coincide) {
	echo "`n/!\ Cuidado: SSL Certificate Name Mismatch. El certificado fue emitido para $final."
} else {
	echo "`n[*] Correcto: El certificado coincide con el sitio visitado."
}
echo "`n`n"
