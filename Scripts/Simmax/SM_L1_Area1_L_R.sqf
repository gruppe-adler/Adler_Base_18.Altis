/*
 Simmax v. 0.9   Nov.2017
 Area 1a_R - Großer Stand
 
***************************** 

AusloserL_R = 0; 		// Grund
AusloserL_R = 1; 		// Links fertig
AusloserL_R = 2; 		// rechts fertig
AusloserL_R = 3; 		// Links Hostage kill
AusloserL_R = 4; 		// rechts Hostage kill
 

*****************************
*/


if (!isServer) exitWith {};


if (Area_1_RundeAktiv == 1) ExitWith {}; 

	Area_1_RundeAktiv = 1;					// sperrt das Script wenn es läuft
	publicVariable "Area_1_RundeAktiv";		
	AusloserL_R = 0;						// Auslöser Anfang	
	publicVariable "AusloserL_R";		

timer_01a = 0;  
publicvariable "timer_01a";


// ***************************************


		
	_text = (parsetext format["<t align='left'><t underline='true'>Area.1</t><br/><br/>

	Langwaffe (Player vs. Player)<br/> 
	Munitionsbedarf  Min. 24 Schuss<br/><br/>
	
	%1  Runden <br/>
	%2 x Tangos <br/>
	%3 x Geiseln <br/>

	</t> ",6,4,1]);


	private _code = {
		if (player distance Schalttafel_01 < 10) then {
				 hint (_this select 0);
		};
	};	[[_text],_code] remoteExec ["call"];
			


sleep 8;	
	
[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];	// los gehts

sleep 2;


	_text = "";		
	_text remoteExec ["hint"]; 



 
// ***************************************


cd1a = execvm "scripts\simmax\SM_countdown_01a.sqf";                // Startet Zeitmessung
cd1L = execvm "scripts\simmax\SM_L1_Area1_L.sqf";                	// Startet script links
cd1R = execvm "scripts\simmax\SM_L1_Area1_R.sqf";                	// Startet script rechts
	


		sleep 2;		
	
			
			While {true} do 
			{
				if (AusloserL_R > 0)  exitWith {}; 								    // Springt aus Schleife  
				if (timer_01a > 50)  exitWith {AusloserL_R = 0}; 					// Springt aus Schleife, wenn Counter > 50
				
				sleep 0.3;
			};  			// Ende Schleife   	
	


			switch (AusloserL_R) do {
			
				case 0: { 
				private _code = {
					if (player distance Schalttafel_01 < 10) then {
						titleText ["<t color='#ff0000' size='4'>Stop, Time too long</t>", "PLAIN", -1, true, true]
						};
						}; [[],_code] remoteExec ["call"];	
				};
				
				case 1: { 
				private _code = {
					if (player distance Schalttafel_01 < 10) then {
						titleText ["<t color='#ff0000' size='4'>Left player wins</t>", "PLAIN", -1, true, true]
						};
						}; [[],_code] remoteExec ["call"];	
				};				
				
				case 2: { 
				private _code = {
					if (player distance Schalttafel_01 < 10) then {
						titleText ["<t color='#ff0000' size='4'>Right player wins</t>", "PLAIN", -1, true, true]
						};
						}; [[],_code] remoteExec ["call"];	
				};						
				
				case 3: { 
				private _code = {
					if (player distance Schalttafel_01 < 10) then {
						titleText ["<t color='#ff0000' size='4'>Left Player killed the Hostage</t>", "PLAIN", -1, true, true]
						};
						}; [[],_code] remoteExec ["call"];		
				};
				
				case 4: { 
				private _code = {
					if (player distance Schalttafel_01 < 10) then {
						titleText ["<t color='#ff0000' size='4'>Right Player killed the Hostage</t>", "PLAIN", -1, true, true]
						};
						}; [[],_code] remoteExec ["call"];	
				};			
			
				default { hint "fail" };
			};



	
	

	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];      	// Ende
	sleep 1;
	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende		
	sleep 1;
	[Schalttafel_01, ["FD_Course_Active_F", 150]] remoteExec ["say3D"];			// Ende	
	
	
	terminate cd1a;												  				// Bricht Zeitmessung ab	
	terminate cd1L;	
	terminate cd1R;	


_arr_tango1_01_a = [KT_41,KT_42,KT_43,KT_44,KT_45,KT_46,KT_47,KT_51,KT_52,KT_53,KT_54,KT_55,KT_56,KT_57];   //array der Tango Ziele
_arr_hostage1_01_a = [KG_41,KG_42,KG_43,KG_51,KG_52,KG_53];                           							  //array der Geisel Ziele
 
   sleep 1;
   
  {_x removeAllEventHandlers "Hit";} foreach _arr_hostage1_01_a;         		// Alle Geisel Ziele runter
  {_x removeAllEventHandlers "Hit";} foreach _arr_tango1_01_a;         		// Alle Geisel Ziele runter   
   
  {_x animate ["terc", 1];} foreach _arr_hostage1_01_a;         		// Alle Geisel Ziele runter
  {_x animate ["terc", 1];} foreach _arr_tango1_01_a;           		// Alle Tango Ziele runter

  {_x setdamage 0;} foreach _arr_tango1_01_a;               			// Alle Tango Ziele reparieren
  {_x setdamage 0;} foreach _arr_hostage1_01_a;             			// Alle Geisel Ziele reparieren


	
	
Area_1_RundeAktiv = 0;															// gibt Script wieder frei
publicVariable "Area_1_RundeAktiv";	


	sleep 2;
	_text = "";
	_text remoteExec ["hint"];		

