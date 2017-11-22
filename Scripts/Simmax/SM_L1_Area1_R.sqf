/*
 Simmax v. 0.9   Nov.2017
 Area 1 - Großer Stand Rechts
 
***************************** 


*****************************
*/


if (!isServer) exitWith {};


_arr_tango1_01_R = [KT_51,KT_52,KT_53,KT_54,KT_55,KT_56,KT_57];   					//array der Tango Ziele
_arr_hostage1_01_R = [KG_51,KG_52,KG_53];                           				//array der Geisel Ziele
 	
{_x setdamage 0;} foreach _arr_tango1_01_R;
{_x setdamage 0;} foreach _arr_hostage1_01_R;
 
_counter_01_R = 0;
_runden_01_R = 6;
Tango_Anzahl_01_R = 4;
hostage_aktiv_01_R = 1;





 
// ***************************************


 
while { _counter_01_R < _runden_01_R} do {   									// Schleife 1   x Runden  (jeweils x Tangos und x Geisel)
 
 
  _counter_01_R = _counter_01_R +1;                 							// Zählt Runden hoch
 
   sleep 0.2;
   
  {_x animate ["terc", 1];} foreach _arr_hostage1_01_R;         				// Alle Geisel Ziele runter
  {_x animate ["terc", 1];} foreach _arr_tango1_01_R;           				// Alle Tango Ziele runter

  {_x setdamage 0;} foreach _arr_tango1_01_R;               					// Alle Tango Ziele reparieren
  {_x setdamage 0;} foreach _arr_hostage1_01_R;             					// Alle Geisel Ziele reparieren
 
 
  sleep 0.5;
 [Schalttafel_01_R, ["FD_Start_F", 150]] remoteExec ["say3D"]; 					// Nächste Runde
 
  _hostage_1_R = selectRandom _arr_hostage1_01_R;             					// Auswahl der Geisel
  _arr_tango1_01_R_temp = _arr_tango1_01_R call BIS_fnc_arrayShuffle;     		// Mischt das Array
  _arr_tango1_01_R_temp = _arr_tango1_01_R_temp select [0,Tango_Anzahl_01_R];   // Auswahl der ersten x Einträge (Tangos)
 
 
hitCounter_01_R = 0; 															// Trefferzähler
 
	{
		_x animate ["terc", 0];
		_x addEventHandler ["Hit", {
		(_this select 0) removeAllEventHandlers "Hit";
		
		hitCounter_01_R = hitCounter_01_R + 1;
		
		}]; 														// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen
	} foreach _arr_tango1_01_R_temp;        						// Tango Ziele hoch 


	if (hostage_aktiv_01_R == 1) then {
		_hostage_1_R animate ["terc", 0];                   		// Geisel Ziel hoch
	};
 
  
 
  While {true} do   // Schleife 2
  {  
    if (damage _hostage_1_R >= 0.01)  ExitWith {AusloserL_R = 4};    		// Springt aus Schleife, wenn Hostage getroffen
    if (hitCounter_01_R >= Tango_Anzahl_01_R)  exitWith {}; 				// Springt aus Schleife, wenn alle Tangos der Einzelrunde down
      sleep 0.4;
  };  			// Ende Schleife 2  
  
      sleep 0.01;
  if (AusloserL_R == 4) ExitWith {};             					// Springt aus Schleife  und beendet
 
 
 
 
}; // Ende Hauptschleife




    if (AusloserL_R == 4) then {
	
		} else {
	 
			AusloserL_R = 2; 		// Rechts fertig
			   
		};


	publicVariable "AusloserL_R";	



