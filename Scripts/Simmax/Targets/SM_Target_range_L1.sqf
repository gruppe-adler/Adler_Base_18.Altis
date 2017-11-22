// Einstellen der Entfernung der Targets
// Simmax


private ["_pos_MK_01"];

_pos_MK_01 =_this select 0;



params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK_01"];



lane_1 setPos [((getMarkerpos (_pos_MK_01) select 0)-2.69), ((getMarkerpos (_pos_MK_01) select 1)+5.21), (getMarkerpos (_pos_MK_01) select 2)];



// publicVariable "lane_1";


