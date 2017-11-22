//teleport.sqf
//To teleport player to marker tele



player setPos (getMarkerPos "tele");
//player setPos (getPos (tele)); Durch marker ersetzt
player setDir 330;

["Arena"] call BIS_fnc_showNotification


//hint "Willkommen in der Beförderungs-Arena"; Durch notification ersetzt