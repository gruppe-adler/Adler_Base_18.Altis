/*
 Simmax v. 0.9   Nov.2017
 Area 2 - Kleiner Stand
 
***************************** 
Hint´s überprüfen entfernung








playSound3D ["a3\sounds_f\weapons\horns\truck_horn_2.wss", <vehiclename>];









*****************************
*/


if (!isServer) exitWith {};

if (Area_2_RundeAktiv == 1) ExitWith {}; 
	Area_2_RundeAktiv = 1;												// sperrt das Script wenn es läuft
	publicVariable "Area_2_RundeAktiv";	

 
_arr_tango1_02 = [KT_30,KT_31,KT_32,KT_33,KT_34,KT_35,KT_36];     		//array der Tango Ziele
_arr_hostage1_02 = [KG_30,KG_31,KG_32,KG_33,KG_34,KG_35];               //array der Geisel Ziele
 
{_x setdamage 0;} foreach _arr_tango1_02;
{_x setdamage 0;} foreach _arr_hostage1_02;
 
_counter_02 = 0;
_runden_02 = 7;
Tango_Anzahl_02 = 3;
hostage_aktiv_02 = 1;

timer_02 = 0;  
publicvariable "timer_02";


// ***************************************


	_text = (parsetext format["<t align='left'><t underline='true'>Area.2</t><br/><br/>

	Kurz/Langwaffe (Zeitmessung)<br/>
	Munitionsbedarf  Min. 21 Schuss<br/><br/>
	%1  Runden <br/>
	%2 x Tangos <br/>
	%3 x Geiseln <br/>

	</t> ",_runden_02,Tango_Anzahl_02,hostage_aktiv_02]);


	private _code = {
		if (player distance Schalttafel_02 < 7) then {
				 hint (_this select 0);
		};
	};	[[_text],_code] remoteExec ["call"];
			
	
 

sleep 8;

[Schalttafel_02, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];		// los gehts

sleep 3; 

cd2 = execvm "scripts\simmax\SM_countdown_02.sqf";                   	// Startet Zeitmessung
 

	_text = "";		
	_text remoteExec ["hint"]; 
 
 
 
while {(_counter_02 < _runden_02)} do {   		// Schleife 1    x Runden  (jeweils 5x Tangos und 1x Geisel)
 
 
  _counter_02 = _counter_02 +1;                 						// Zählt Runden hoch
 
   sleep 0.2;
   
  {_x animate ["terc", 1];} foreach _arr_hostage1_02;         			// Alle Geisel Ziele runter
  {_x animate ["terc", 1];} foreach _arr_tango1_02;           			// Alle Tango Ziele runter

  {_x setdamage 0;} foreach _arr_tango1_02;               				// Alle Tango Ziele reparieren
  {_x setdamage 0;} foreach _arr_hostage1_02;             				// Alle Geisel Ziele reparieren
 

  sleep 0.5;
  [Schalttafel_02, ["FD_Start_F", 150]] remoteExec ["say3D"];			// Nächste Runde    
 
  _hostage1_02 = selectRandom _arr_hostage1_02;             			// Auswahl der Geisel
  _arr_tango1_02_temp = _arr_tango1_02 call BIS_fnc_arrayShuffle;     	// Mischt das Array
  _arr_tango1_02_temp = _arr_tango1_02_temp select [0,Tango_Anzahl_02];     // Auswahl der ersten x Einträge (Tangos)
 
 
  hitCounter_02 = 0; 													// Trefferzähler
 
	{
		_x animate ["terc", 0];
		_x addEventHandler ["Hit", {
		(_this select 0) removeAllEventHandlers "Hit";
		
		hitCounter_02 = hitCounter_02 + 1;
		
		// (str hitCounter_02) remoteExec ["hint"];
		
		}]; 															// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen
	} foreach _arr_tango1_02_temp;        								// Tango Ziele hoch 
		
[Schalttafel_02, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"];	
		
	if (hostage_aktiv_02 == 1) then {		
		_hostage1_02 animate ["terc", 0];                   			// Geisel Ziel hoch
	};		

   
  hostageHit_02 = 0;
  
  
 
  While {true} do   // Schleife 2
  {
     
    if ((damage _hostage1_02 >= 0.01) or (timer_02 > 40)) ExitWith {hostageHit_02 = 1};    	// Springt aus Schleife, wenn Hostage getroffen
    if (hitCounter_02 >= Tango_Anzahl_02)  exitWith {}; 				// Springt aus Schleife, wenn alle Tangos der Einzelrunde bekämpft sind
   
      sleep 0.5;
   
  };  				// Ende Schleife 2  
  
  

  if (hostageHit_02 == 1) ExitWith {terminate cd2};             		// Springt aus Schleife 1
 

}; // Ende Schleife 1


 
    if (hostageHit_02 == 0) then {
	
		terminate cd2;												  	// Bricht Zeitmessung ab
		

		_text = format["You completed the course in %1 seconds",timer_02];	// Zeigt Zeit an
		private _code = {
			 if (player distance Schalttafel_02 < 7) then {
				  hint (_this select 0);
			 };
		};	[[_text],_code] remoteExec ["call"];		
	
	
	[Schalttafel_02, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			 
     

				
	 } else {
	 
 
		private _code = {
    if (player distance Schalttafel_02 < 7) then {
             titleText ["<t color='#ff0000' size='4'>Loser, you killed the Hostage</t>", "PLAIN", -1, true, true]
    };
	}; [[],_code] remoteExec ["call"];		
	
		   
    };
	
	
	
	
	[Schalttafel_02, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];      	// Ende
	sleep 1;
	[Schalttafel_02, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende		
	sleep 1;
	[Schalttafel_02, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende				
	
	
	sleep 4;
	_text = "";
	_text remoteExec ["hint"];	


 	
	sleep 1;
      {_x animate ["terc", 1];} foreach _arr_tango1_02;           	// Alle Tango Ziele runter
      {_x animate ["terc", 1];} foreach _arr_hostage1_02;         	// Alle Geisel Ziele runter
	  

	Area_2_RundeAktiv = 0;											// gibt Script wieder frei
	publicVariable "Area_2_RundeAktiv";		

