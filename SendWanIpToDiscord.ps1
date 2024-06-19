try {
$wanIP = (Invoke-RestMethod -Uri "http://ifconfig.me/ip").Trim()

$hookUrl = 'WEBHOOK URL' #Webhook URL muss hier eingetragen werden

$port = 25565

$content = @"
> @everyone
# Aktuelle Minecraft Server Adresse:
``${wanIP}:${port}``
"@


$payload = [PSCustomObject]@{

    content = $content

}

Invoke-RestMethod -Uri $hookUrl -Method Post -ContentType 'Application/Json' -Body ($payload | ConvertTo-Json -Compress)

Write-Host "Nachricht erfolgreich an den Discord-Webhook gesendet."

} catch {

Write-Host "Bro idk iwas hat ned gfetzt"

}
