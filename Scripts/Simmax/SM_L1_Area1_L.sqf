/*
 Simmax v. 0.9   Nov.2017
 Area 1 - Großer Stand Links
 
***************************** 


*****************************
*/


if (!isServer) exitWith {};


_arr_tango1_01_L = [KT_41,KT_42,KT_43,KT_44,KT_45,KT_46,KT_47];   			//array der Tango Ziele
_arr_hostage1_01_L = [KG_41,KG_42,KG_43];                   					//array der Geisel Ziele
 
{_x setdamage 0;} foreach _arr_tango1_01_L;
{_x setdamage 0;} foreach _arr_hostage1_01_L;
 
_counter_01_L = 0;
_runden_01_L = 6;
Tango_Anzahl_01_L = 4;
hostage_aktiv_01_L = 1;





 
// ***************************************


 
while { _counter_01_L < _runden_01_L} do {   						// Schleife 1   x Runden  (jeweils x Tangos und x Geisel)
 
 
  _counter_01_L = _counter_01_L +1;                 				// Zählt Runden hoch
 
   sleep 0.2;
   
  {_x animate ["terc", 1];} foreach _arr_hostage1_01_L;         		// Alle Geisel Ziele runter
  {_x animate ["terc", 1];} foreach _arr_tango1_01_L;           		// Alle Tango Ziele runter

  {_x setdamage 0;} foreach _arr_tango1_01_L;               			// Alle Tango Ziele reparieren
  {_x setdamage 0;} foreach _arr_hostage1_01_L;             			// Alle Geisel Ziele reparieren
 
 
  sleep 0.5;
 [Schalttafel_01_L, ["FD_Start_F", 150]] remoteExec ["say3D"]; 		// Nächste Runde
 
  _hostage_1_L = selectRandom _arr_hostage1_01_L;             					// Auswahl der Geisel
  _arr_tango1_01_L_temp = _arr_tango1_01_L call BIS_fnc_arrayShuffle;     		// Mischt das Array
  _arr_tango1_01_L_temp = _arr_tango1_01_L_temp select [0,Tango_Anzahl_01_L];     // Auswahl der ersten x Einträge (Tangos)
 
 
hitCounter_01_L = 0; 															// Trefferzähler
 
	{
		_x animate ["terc", 0];
		_x addEventHandler ["Hit", {
		(_this select 0) removeAllEventHandlers "Hit";
		
		hitCounter_01_L = hitCounter_01_L + 1;
		
		}]; 														// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen
	} foreach _arr_tango1_01_L_temp;        							// Tango Ziele hoch 


	if (hostage_aktiv_01_L == 1) then {
		_hostage_1_L animate ["terc", 0];                   			// Geisel Ziel hoch
	};
 


  
 
  While {true} do   // Schleife 2
  {
     
    if (damage _hostage_1_L >= 0.01)  ExitWith {AusloserL_R = 3};    		// Springt aus Schleife, wenn Hostage getroffen
    if (hitCounter_01_L >= Tango_Anzahl_01_L)  exitWith {}; 					// Springt aus Schleife, wenn alle Tangos der Einzelrunde down
      sleep 0.4;
  };  			// Ende Schleife 2  
  
      sleep 0.01;
  if (AusloserL_R == 3) ExitWith {};             		// Springt aus Schleife  und beendet
 
 
 
 
}; // Ende Hauptschleife




    if (AusloserL_R == 3) then {
	
		} else {
	 
			AusloserL_R = 1; 		// Links fertig
			   
		};


	publicVariable "AusloserL_R";	



