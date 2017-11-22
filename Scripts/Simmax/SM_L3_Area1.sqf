/*
 Simmax v. 0.9   Nov.2017
 Area 3 - KSK Stand
 
******************************************


Stropes sync mit Durchgang 
Flash hint...
Hint´s überprüfen entfernung


******************************************
*/  

if (!isServer) exitWith {};

if (Area_3_RundeAktiv == 1) ExitWith {}; 
	Area_3_RundeAktiv = 1;										// sperrt das Script wenn es läuft
	publicVariable "Area_3_RundeAktiv";	
 


private _fnc_drehen_3 = {
     params ["_s1","_s2","_angle"];
	 		
     _s1 setDir _angle;
     _s2 setDir _angle;
};



private _fnc_drehen_3_grund = {
     params ["_s1a","_s1b","_s2a","_s2b","_s3a","_s3b"];
	 		
 {_x setDir 128} forEach [_s1a,_s1b];							// L Dreht Ziele in die Grundposition
 {_x setDir 218} forEach [_s2a,_s2b];							// M
 {_x setDir 138} forEach [_s3a,_s3b];							// R 
	 
};

/*
private _fnc_drehen_3_grund = {
     params ["_s1a","_s1b","_s2a","_s2b","_s3a","_s3b"];
	 		
 {_x setDir 175} forEach [_s1a,_s1b];							// L Dreht Ziele in die Grundposition
 {_x setDir 265} forEach [_s2a,_s2b];							// M
 {_x setDir 185} forEach [_s3a,_s3b];							// R 
	 
};

*/



[[SM_Schild_01,SM_Schild_02,SM_Schild_03,SM_Schild_04,SM_Schild_05,SM_Schild_06],_fnc_drehen_3_grund] remoteExec ["call"];	// Dreht Ziele in die Grundposition



	_counter_03 = 0;					// Rundenzähler
	_runden_03 = 9;						// Vorgabe Runden

	TangoHit_3 = 0;
	HostageHit_3 = 0;	
	
	


sleep 3;		
	


[SM_Schild_03, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"]; 

  

_multiArray2 = [[SM_Schild_01,SM_Schild_02,223,128],    // Schilderpaare und Ausrichtung für aktiv und inaktiv
				[SM_Schild_03,SM_Schild_04,313,218],
				[SM_Schild_05,SM_Schild_06,43,135],
				[SM_Schild_03,SM_Schild_04,313,218],
				[SM_Schild_01,SM_Schild_02,223,128],
				[SM_Schild_03,SM_Schild_04,313,218],
				[SM_Schild_05,SM_Schild_06,43,138],
				[SM_Schild_03,SM_Schild_04,313,218],
				[SM_Schild_01,SM_Schild_02,223,128]			
				]; 		


/*				
		_text = format["%1 Runden / 3 Wände  (1 Tango und 1 Geisel)",_runden_03];		
		private _code = {
			 if (player distance Schalttafel_03 < 8) then {
				  hint (_this select 0);
			 };
		};	[[_text],_code] remoteExec ["call"];
 

*/		

		
	_text = (parsetext format["<t align='left'><t underline='true'>Area.3</t><br/><br/>

	Kurz/Langwaffe<br/>
	Munitionsbedarf  Min. 9 Schuss <br/><br/>
	%1  Runden <br/>
	1 x Tango <br/>
	1 x Geisel <br/>
	Links-Mitte-Rechts<br/>
	Mitte-Links<br/>
	Mitte-Rechts<br/>
	Mitte-Links<br/>
	</t> ",_runden_03]);


	private _code = {
		if (player distance Schalttafel_03 < 8) then {
				 hint (_this select 0);
		};
	};	[[_text],_code] remoteExec ["call"];
			


sleep 8;


		if (FlashligtArea_3 == 1) then {																// flashlights			
		Flashligt_trigger_03 = 1;			// Area 3 flashlights off
		publicVariable "Flashligt_trigger_03";
		};


[Schalttafel_03, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];										// Durchgang startet	

sleep 3;


	_text = "";		
	_text remoteExec ["hint"]; 



						

[Schalttafel_03, ["FD_Start_F", 150]] remoteExec ["say3D"];	 	

while {  _counter_03 < _runden_03} do {   																// Schleife 1    x Runden

			 _counter_03 =  _counter_03 + 1; 																// Zählt Runden hoch	
			if (hostageHit_3 == 1) ExitWith {};	


				_auswahl_Schilder = (_multiArray2 select ( _counter_03 -1 )) select [0,2];				//   aktives Schild 1	holt Werte aus _multiArray2
				_auswahl_Schilder = _auswahl_Schilder call BIS_fnc_arrayShuffle; 	

				
				
				
				//_text = format[" %1 Test ",_auswahl_Schilder];
				//_text remoteExec ["hint"];	
				//sleep 2;

				sleep 0.05;		
			

		// *****************************************************************************************************************************

		_arr_hostage_1 = [																// Array Geisel Texturen
						"pics\simmax\19-G.jpg",
						"pics\simmax\20-G.jpg",
						"pics\simmax\21-G.jpg",
						"pics\simmax\22-G.jpg",
						"pics\simmax\23-G.jpg",
						"pics\simmax\24-G.jpg",
						"pics\simmax\25-G.jpg",
						"pics\simmax\26-G.jpg"
						]; 			
		_arr_hostage_1 = selectRandom _arr_hostage_1;            						// Auswahl der Geisel aus _arr_hostage_1



						
		_arr_tango_1 = [																// Array Tango Texturen
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

		 switch (_arr_hostage_1) do {
		 
			 case "pics\simmax\19-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\19-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			};
			case "pics\simmax\20-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\20-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			};
			case "pics\simmax\21-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\21-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			}; 
			case "pics\simmax\22-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\22-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			}; 
			case "pics\simmax\23-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\23-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			};	
			case "pics\simmax\24-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\24-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			};  
			case "pics\simmax\25-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\25-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			}; 
			case "pics\simmax\26-G.jpg": {
			_arr_tango_1 deleteAt (_arr_tango_1 find "pics\simmax\26-T.jpg");   		//Entfernt Tango der Aussehen wie Geisel hat
			}; 
			default { hint "Systemfehler" };	
		};

		sleep 0.1;	



		 _arr_tango_1 = selectRandom _arr_tango_1; 										//Auswahl des Tangos



		// *****************************************************************************************************************************

		
		

						_Schild_aktiv3_01 = (_auswahl_Schilder) select 0;				//   aktives Schild 1	holt Werte aus _auswahl_Schilder
						_Schild_aktiv3_02 = (_auswahl_Schilder) select 1;				//   aktives Schild 2	holt Werte aus _multiArray2
						
						_winkel_schild_aktiv_on =   (_multiArray2 select ( _counter_03 -1 )) select 2;		//  holt Grad Werte aus _multiArray2
						_winkel_schild_aktiv_off =  (_multiArray2 select ( _counter_03 -1 )) select 3;		//  holt Grad Werte aus _multiArray2

						_Schild_aktiv3_01 setObjectTextureGlobal [0, _arr_tango_1];						    // Texture für Schild Tango
						_Schild_aktiv3_02 setObjectTextureGlobal [0, _arr_hostage_1];						// Texture für Schild Hostage
						

						


				sleep 0.2;		

				

		if (hostageHit_3 == 1) ExitWith {};	
				
				
				Schild_aktiv3_01 = _Schild_aktiv3_01;					// Tango
				Schild_aktiv3_02 = _Schild_aktiv3_02;					// Hostage
					
				Schild_aktiv3_01 addEventHandler ["Hit", {
								
				Schild_aktiv3_01 removeAllEventHandlers "Hit";			// Treffer registrieren und Hit-EH für Scheibe bei Hit wieder löschen
				TangoHit_3 = TangoHit_3 + 1;
				
			
				// _text = format[" %1 Treffer",TangoHit_3];
				// _text remoteExec ["hint"]; 
				
				}]; 
				

				
				Schild_aktiv3_02 addEventHandler ["Hit", { 
				hostageHit_3 = 1;	
				

		


	private _code = {
    if (player distance Schalttafel_03 < 8) then {
             titleText ["<t color='#ff0000' size='4'>Loser, you killed the Hostage</t>", "PLAIN", -1, true, true]
    };
	}; [[],_code] remoteExec ["call"];		
		
		
		
				
	}]; 				
				
				
				
			sleep 0.1;	
				
		_Schild_aktiv3_01 setdamage 0;
		_Schild_aktiv3_02 setdamage 0; 				
				
		[_Schild_aktiv3_01, ["FD_Target_PopDown_Large_F", 130]] remoteExec ["say3D"]; 								// Sound Scheiben drehen aktiv
		
			sleep 0.6;	

		[[_Schild_aktiv3_01,_Schild_aktiv3_02,_winkel_schild_aktiv_on],_fnc_drehen_3] remoteExec ["call"];			// Dreht Schilderpaar auf aktiv


			//_text = format["%1  %2  ",_Schild_aktiv3_01,_Schild_aktiv3_02];
			//_text remoteExec ["hint"];			
			


			sleep 1.1;																								// Aktivzeit 	
			if (hostageHit_3 == 1) ExitWith {};

			Schild_aktiv3_01 removeAllEventHandlers "hit";
			Schild_aktiv3_02 removeAllEventHandlers "hit";			

		[_Schild_aktiv3_01, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"]; 								// Scheiben drehen Inaktiv

		[[_Schild_aktiv3_01,_Schild_aktiv3_02,_winkel_schild_aktiv_off],_fnc_drehen_3] remoteExec ["call"];			// Dreht Schilderpaar auf inaktiv

		sleep 0.1;	

			_Schild_aktiv3_01 setdamage 0;
			_Schild_aktiv3_02 setdamage 0; 
				
	};																												// Ende Schleife 1


	
	
	Schild_aktiv3_01 removeAllEventHandlers "hit";
	Schild_aktiv3_02 removeAllEventHandlers "hit";	
	
	
	if (hostageHit_3 == 0) then {	
  
		_text = format["%1 von %2 Tangos bekämpft, Ende", TangoHit_3, _runden_03];
		private _code = {
			 if (player distance Schalttafel_03 < 10) then {
				  hint (_this select 0);
			 };
		};		 
		[[_text],_code] remoteExec ["call"];
			
     } else {
	[Schalttafel_03, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende	
	sleep 1;
	};
	
	
	[Schalttafel_03, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende		
	sleep 1;
	[Schalttafel_03, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende		

	sleep 4;	
	
	_text = "";
	_text remoteExec ["hint"];		


	

	
// [SM_Schild_03, ["FD_Target_PopUp_Large_F", 130]] remoteExec ["say3D"]; 

 
	Area_3_RundeAktiv = 0;														// gibt Script wieder frei
	publicVariable "Area_3_RundeAktiv";	
 
