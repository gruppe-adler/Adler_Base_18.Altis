/*
 Simmax v. 0.9   Nov.2017
 Area 1 - Großer Stand
 
***************************** 


*****************************
*/


if (!isServer) exitWith {};

if (Area_1_RundeAktiv == 1) ExitWith {}; 
	Area_1_RundeAktiv = 1;					// sperrt das Script wenn es läuft
	publicVariable "Area_1_RundeAktiv";	


_arr_tango1_01 = [KT_41,KT_42,KT_43,KT_44,KT_45,KT_46,KT_47,KT_51,KT_52,KT_53,KT_54,KT_55,KT_56,KT_57];   //array der Tango Ziele
_arr_hostage1_01 = [KG_41,KG_42,KG_43,KG_51,KG_52,KG_53];                           							  //array der Geisel Ziele
 
{_x setdamage 0;} foreach _arr_tango1_01;
{_x setdamage 0;} foreach _arr_hostage1_01;
 
_counter_01 = 0;
_runden_01 = 5;
Tango_Anzahl_01 = 5;
hostage_aktiv_01 = 1;

timer_01 = 0;  
publicvariable "timer_01";



 
// ***************************************


		
	_text = (parsetext format["<t align='left'><t underline='true'>Area.1</t><br/><br/>

	Langwaffe (Zeitmessung)<br/> 
	Munitionsbedarf  Min. 25 Schuss<br/><br/>
	
	%1  Runden <br/>
	%2 x Tangos <br/>
	%3 x Geiseln <br/>

	</t> ",_runden_01,Tango_Anzahl_01,hostage_aktiv_01]);


	private _code = {
		if (player distance Schalttafel_01 < 10) then {
				 hint (_this select 0);
		};
	};	[[_text],_code] remoteExec ["call"];
			
	
	
	
 

sleep 8;	
	
[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];	// los gehts

sleep 3;

cd1 = execvm "scripts\simmax\SM_countdown_01.sqf";                	// Startet Zeitmessung



	_text = "";		
	_text remoteExec ["hint"]; 

 
while { _counter_01 < _runden_01} do {   						// Schleife 1   x Runden  (jeweils 5x Tangos und 1x Geisel)
 
 
  _counter_01 = _counter_01 +1;                 				// Zählt Runden hoch
 
   sleep 0.2;
   
  {_x animate ["terc", 1];} foreach _arr_hostage1_01;         		// Alle Geisel Ziele runter
  {_x animate ["terc", 1];} foreach _arr_tango1_01;           		// Alle Tango Ziele runter

  {_x setdamage 0;} foreach _arr_tango1_01;               			// Alle Tango Ziele reparieren
  {_x setdamage 0;} foreach _arr_hostage1_01;             			// Alle Geisel Ziele reparieren
 
 
  sleep 0.5;
 [Schalttafel_01, ["FD_Start_F", 150]] remoteExec ["say3D"]; 		// Nächste Runde
 
  _hostage_1 = selectRandom _arr_hostage1_01;             					// Auswahl der Geisel
  _arr_tango1_01_temp = _arr_tango1_01 call BIS_fnc_arrayShuffle;     		// Mischt das Array
  _arr_tango1_01_temp = _arr_tango1_01_temp select [0,Tango_Anzahl_01];     // Auswahl der ersten x Einträge (Tangos)
 
 
hitCounter_01 = 0; 															// Trefferzähler
 
	{
		_x animate ["terc", 0];
		_x addEventHandler ["Hit", {
		(_this select 0) removeAllEventHandlers "Hit";
		
		hitCounter_01 = hitCounter_01 + 1;
			
		// (str hitCounter_01) remoteExec ["hint"];
		
		}]; 														// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen
	} foreach _arr_tango1_01_temp;        							// Tango Ziele hoch 

[Schalttafel_01, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"];	
		
	if (hostage_aktiv_01 == 1) then {
		_hostage_1 animate ["terc", 0];                   			// Geisel Ziel hoch
	};
 

  hostageHit_01 = 0;
  
  
 
  While {true} do   // Schleife 2
  {
     
    if ((damage _hostage_1 >= 0.01) or (timer_01 > 50)) ExitWith {hostageHit_01 = 1};    		// Springt aus Schleife, wenn Hostage getroffen
    if (hitCounter_01 >= Tango_Anzahl_01)  exitWith {}; 					// Springt aus Schleife, wenn alle Tangos tot
   
      sleep 0.5;
   
  };  			// Ende Schleife 2  
  
  
  
  if (hostageHit_01 == 1) ExitWith {terminate cd1};             		// Springt aus Schleife 1
 
 
}; // Ende Schleife 1



    if (hostageHit_01 == 0) then {
	
		terminate cd1;												  	// Bricht Zeitmessung ab

	_text = format["You completed the course in %1 seconds",timer_01];	// Zeigt Zeit an
	_text remoteExec ["hint"];
	
	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];		

	 } else {
	 
 
	private _code = {
    if (player distance Schalttafel_01 < 10) then {
             titleText ["<t color='#ff0000' size='4'>Loser, you killed the Hostage</t>", "PLAIN", -1, true, true]
    };
	}; [[],_code] remoteExec ["call"];		
	
		   
    };
	
	
	

	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];      	// Ende
	sleep 1;
	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende		
	sleep 1;
	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende	
	
	
	sleep 4;
	_text = "";
	_text remoteExec ["hint"];	


  {_x removeAllEventHandlers "Hit";} foreach _arr_hostage1_01;         		// Alle Geisel Ziele runter
  {_x removeAllEventHandlers "Hit";} foreach _arr_tango1_01;         		// Alle Geisel Ziele runter   	
	
 	
	sleep 1;
      {_x animate ["terc", 1];} foreach _arr_tango1_01;           	// Alle Tango Ziele runter
      {_x animate ["terc", 1];} foreach _arr_hostage1_01;         	// Alle Geisel Ziele runter
	  

	Area_1_RundeAktiv = 0;											// gibt Script wieder frei
	publicVariable "Area_1_RundeAktiv";		

