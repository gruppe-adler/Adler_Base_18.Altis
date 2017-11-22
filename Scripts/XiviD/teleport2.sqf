//teleport.sqf
//To teleport player to marker tele

//player setPos (getPos (tele2)); Durch marker ersetzt

player setPos (getMarkerPos "tele2");
player setDir 220;
["Base"] call BIS_fnc_showNotification

//hint "Willkommen in der Basis"; Durch notification ersetzt


