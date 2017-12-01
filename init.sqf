
setviewdistance 4000;


[5] execVM "manual\manualInit.sqf";

// G-Kräfte ausstellen
player setVariable ["ACE_GForceCoef", 0];


// Simmax Anfang v.0.8 ****************************************************************

if (isServer) then {
line_1x = 0;							// Lanes  frei
line_2x = 0;
line_3x = 0;
line_4x = 0;
publicVariable "lane_1x";
publicVariable "lane_2x";
publicVariable "lane_3x";
publicVariable "lane_4x";

Area_1_RundeAktiv = 0;					// Area 1 frei
Area_2_RundeAktiv = 0;					// Area 2 frei
Area_3_RundeAktiv = 0;					// Area 3 frei
Area_4_RundeAktiv = 0;					// Area 4 frei

publicVariable "Area_1_RundeAktiv";
publicVariable "Area_2_RundeAktiv";
publicVariable "Area_3_RundeAktiv";
publicVariable "Area_4_RundeAktiv";


FlashligtArea_3 = 0;					// Area 3 flashlights off
publicVariable "FlashligtArea_3";


{_x hideObjectGlobal true;} foreach [anz1_01,anz1_02,anz1_03,anz1_04,anz1_05,anz2_01,anz2_02,anz2_03,anz2_04,anz2_05,anz3_01,anz3_02,anz3_03,anz3_04,anz3_05,anz4_01,anz4_02,anz4_03,anz4_04,anz4_05];

};

nopop = true;      				// Alle Klappscheiben klappen nicht mehr von selbst hoch

// Simmax Ende ************************************************************************





//Adler Intro
// ***********************************************************************************

titleCut ["", "BLACK FADED", 999];
[] Spawn {

titleText ["","PLAIN"];
titleFadeOut 1;
sleep 2;

titleCut ["", "BLACK IN", 2];

waitUntil {time > 3};
	["<img size= '6' shadow='false' image='pics\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Willkommen in der Adler Base      </t>",0,0,3,4] spawn BIS_fnc_dynamicText;
};
