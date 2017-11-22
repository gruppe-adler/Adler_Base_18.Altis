/*
 Simmax v. 0.9   Nov.2017
 Area 4 - Kleiner Stand (Kurzwaffen)
 
***************************** 
Hint´s überprüfen entfernung

200 ruhe  153
90 aktiv 43

*****************************
*/


if (!isServer) exitWith {};

if (Area_4_RundeAktiv == 1) ExitWith {}; 
	Area_4_RundeAktiv = 1;												// sperrt das Script wenn es läuft
	publicVariable "Area_4_RundeAktiv";	
	
	
private _fnc_drehen_4 = {
     params ["_s4","_angle4"];
     _s4 setDir _angle4;
};	
	
	


		
_auswahl_Schilder_04 = [SM_Schild_10,SM_Schild_11,SM_Schild_12,SM_Schild_13,SM_Schild_14,SM_Schild_15,SM_Schild_16,SM_Schild_17];     		//array der Tango Ziele
_auswahl_Schilder_04 = _auswahl_Schilder_04 call BIS_fnc_arrayShuffle; 

 
{_x setdamage 0;} foreach _auswahl_Schilder_04;

 
_counter_04 = 0;
_runden_04 = 12;
Tango_Anzahl_04 = 1;

timer_04 = 0;  
publicvariable "timer_04";


// ***************************************


		
	_text = (parsetext format["<t align='left'><t underline='true'>Area.4</t><br/><br/>

	Kurzwaffe (Zeitmessung)<br/> 
	Munitionsbedarf  Min. 12 Schuss<br/><br/>
	
	%1  Runden <br/>
	1 x Tango <br/>

	</t> ",_runden_04,Tango_Anzahl_04]);


	private _code = {
		if (player distance Schalttafel_04 < 5) then {
				 hint (_this select 0);
		};
	};	[[_text],_code] remoteExec ["call"];
			
	
	


sleep 8;

[Schalttafel_04, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];		// los gehts

sleep 3; 

cd4 = execvm "scripts\simmax\SM_countdown_04.sqf";                   	// Startet Zeitmessung
 

	_text = "";		
	_text remoteExec ["hint"]; 
 
 
 
while {(_counter_04 < _runden_04) and (timer_04 < 40)} do {   								// Schleife 1    x Runden
 

 
  _counter_04 = _counter_04 +1;                 						// Zählt Runden hoch
 
   sleep 0.5;
   
    [Schalttafel_04, ["FD_Start_F", 150]] remoteExec ["say3D"];			// Nächste Runde    
   
   
 
		_arr_tango_4 = [												// Array Tango Texturen
						"pics\simmax\19-T.jpg",
						"pics\simmax\20-T.jpg",
						"pics\simmax\21-T.jpg",
						"pics\simmax\22-T.jpg",
						"pics\simmax\23-T.jpg",
						"pics\simmax\24-T.jpg",
						"pics\simmax\25-T.jpg",
						"pics\simmax\26-T.jpg",
						"pics\simmax\27-T.jpg",
						"pics\simmax\28-T.jpg",
						"pics\simmax\29-T.jpg",
						"pics\simmax\30-T.jpg",
						"pics\simmax\31-T.jpg"
						];


		sleep 0.1;	

		 _arr_tango_4 = selectRandom _arr_tango_4; 						// Zufallstexture
		 _Schild_aktiv4_01 = selectRandom _auswahl_Schilder_04; 		// Zufallsschild	

		sleep 0.1;

		_Schild_aktiv4_01 setObjectTextureGlobal [0, _arr_tango_4];
		
			hitCounter_04 = 0; 											// Trefferzähler
 

		_Schild_aktiv4_01 addEventHandler ["Hit", {
		_Schild_aktiv4_01 removeAllEventHandlers "Hit";
		hitCounter_04 = 1;
		}]; 															// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen

		[_Schild_aktiv4_01, ["FD_Target_PopDown_Large_F", 130]] remoteExec ["say3D"]; 					// Scheiben drehen aktiv
		
		sleep 0.2;		
		
		 [[_Schild_aktiv4_01,43],_fnc_drehen_4] remoteExec ["call"];									// Dreht Schild inaktiv
		 


  While {true} do  // Schleife 2
	  { 
		if ((hitCounter_04 == 1) or (timer_04 > 40))  exitWith {}; 										// Springt aus Schleife, wenn alle Tangos der Einzelrunde bekämpft sind oder zeit überschritten
		  sleep 0.1;   
	  };  				// Ende Schleife 2  

	 
		//sleep 1;

		[_Schild_aktiv4_01, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"]; 					// Scheiben drehen Inaktiv

		sleep 0.1;	
 
 		 [[_Schild_aktiv4_01,153],_fnc_drehen_4] remoteExec ["call"];  									// Dreht Schild inaktiv

   
};   
   



		terminate cd4;												  			// Bricht Zeitmessung ab
		

		_text = format["You completed the course in %1 seconds",timer_04];		// Zeigt Zeit an
		private _code = {
			 if (player distance Schalttafel_04 < 5) then {
				  hint (_this select 0);
			 };
		};	[[_text],_code] remoteExec ["call"];		
	
	
	[Schalttafel_04, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende			 
     
		sleep 1;
	
	[Schalttafel_04, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];      	// Ende	

	sleep 5;
	
	
	_text = "";
	_text remoteExec ["hint"];	


	Area_4_RundeAktiv = 0;											// gibt Script wieder frei
	publicVariable "Area_4_RundeAktiv";		

