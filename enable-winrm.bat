winrm quickconfig -q
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value True; Set-Item WSMan:\localhost\Service\Auth\Basic -Value True"
sc triggerinfo winrm start/networkon stop/networkoff
