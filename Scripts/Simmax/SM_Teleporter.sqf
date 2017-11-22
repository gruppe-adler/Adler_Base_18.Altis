// Teleport
// Simmax



_dest = (_this select 3) select 0;  // Markerposition
_dest_high = (_this select 3) select 1; // Höhe
_dest_dir = (_this select 3) select 2;


player SetDir _dest_dir;
player SetPos [(getMarkerPos _dest select 0),(getMarkerPos _dest select 1),((getMarkerPos _dest select 2) + (_dest_high))];


	

