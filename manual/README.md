# Anleitungsdialog

* wird bei Spielstart angezeigt
* Anzeige bei Spielstart kann vom Spieler deaktiviert werden
* stellt linksseits Themenliste dar
* stellt rechtsseits Inhalt des gewählten Themas dar
* neuer Inhalt über CONTENT.sqf hinzufügen (Anleitung in Datei beachten)

## Installation
1. "manual" Ordner in Missionsordner kopieren
2. zur description.ext hinzufügen: `#include "manual\dialog.hpp";`
3. zur init.sqf hinzufügen: `[5] execVM "manual\manualInit.sqf";`

Der übergebene Parameter in der init.sqf entscheidet dabei über die Zeit in Sekunden, die bei Spielstart gewartet wird, bis der Dialog angezeigt wird. Um also beispielsweise 10 Sekunden zu warten lautet der Befehl: `[10] execVM "manual\manualInit.sqf";` 
