// Einstellen der Entfernung der Targets
// Simmax

	private ["_pos_MK"];

_pos_MK =_this select 0;



params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK"];


// hint str _pos_MK;


lane_2 setPos [((getMarkerpos (_pos_MK) select 0)+0.03), ((getMarkerpos (_pos_MK) select 1)+2.55), (getMarkerpos (_pos_MK) select 2)];
publicVariable "lane_2";



