# Nightscout IONOS

IONOS ist der 1&1 Hosting anbieter. Nightscout kann für 2 € pro Monat bzw. 24 € pro Jahr bei IONOS gehostet werden. Dieses Repository ermöglicht eine schnelle Installation, der eigenen Nightsocut-Instanz auf einem IONOS virtual private server.

## Vertragsabschluss bei 1&1 IONOS

Unter <a href="https://www.ionos.de/server/vps#tarife" target="_blank">https://www.ionos.de/server/vps#tarife</a> einen passenden Tarif auswählen und abschließen. 

> **VPS S** <br>
> 1 vCore CPU <br>
> 512 MB RAM <br>
> 10 GB SSD <br>
> *- ist auscreichend -*

Für die Bestellung können die folgenden Einstellungenverwendet werden:

> **Ihr gewähler Tarif** VPS S <br>
> **Betriebsystem** Linux <br>
> **Systemversion** Debian 11 <br>
> **Rechenzentrum** Deutschland <br>
> **Cloud Backup** Kein

Wenn man sich auf 12 Monate an IONOS bindet, dann gibt es in der Regel große Rabatte und die Einrichtungsgebühr entfällt. Nach bestellung braucht IONOS ca. 10 Minuten bis alles einsatzbereit ist.

## Server einrichten

1. Login unter <a href="https://mein.ionos.de/" target="_blank">https://mein.ionos.de/</a>
2. `Server & Cloud` im Menü auswählen
3. Wählen Sie den Server in der Liste aus (suchen Sie nach dem Eintrag `Cloud Server 0`)
4. Notieren Sie aus der Übrsicht den `DNS-Hostname` und `Initial-Passwort` (Passwort anzeigen)

Öffnen Sie eine Powershell und geben Sie den folgenden Befehl ein, um sich auf ihrem Server einzuloggen (erstze `<DNS-HOSTNAME>` durch den notierten DNS-Hostnamen).
```
ssh root@<DNS-HOSTNAME>
```
Sie werden ggf. gefragt, ob Sie dem Server vertrauen ... geben Sie `yes` ein und bestätigen Sie mit enter.
Sie werden nach einem Passwort gefragt ... geben Sie das Passwort ein, dass sie im Schritt 4 notiert haben (**ACHTUNG** die Zeichen die Sie eingeben, werden bei der Eingabe nicht angezeigt).

Wenn der login funktioniert, dann wird Ihnen `root@localhost$` angezigt. Kopieren Sie folgenden Befehl und führen Sie diesen aus:
```
curl -sSL https://raw.githubusercontent.com/diatools/nightscout-ionos/main/run.sh | sh
```
Sie müssen während das Installationsscript läuft folgende Informationen eingeben
> **DNS-Hostnamen** der DNS-Hostnamen, den Sie im Schritt 4 notiert haben<br>
> **E-Mail** geben Sie eine gültige E-Mail ein. Diese wird für LetsEncrypt benötigt<br>
> **Passwort** legen Sie ein Passwort für Nightscout fest. Achten Sie auf ein starkes Passwort

Die Installation dauert einige minuten und ist beendet, wenn ihn wieder die Prompt `root@localhost$` angezoegt wird. Danach können Sie nightscout öffnen, indem Sie den in Schritt 4 notierten DNS-Hostnamen in ihrem Browser eingeben.
