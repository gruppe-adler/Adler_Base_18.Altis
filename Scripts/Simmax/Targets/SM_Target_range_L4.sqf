// Einstellen der Entfernung der Targets
// Simmax

params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK"];

{
    if ((vehicleVarName _x) == "") then {deleteVehicle _x;};
}forEach (nearestObjects [lane_4, ["Sign_Sphere10cm_F"], 2]);

lane_4 setPos [((getMarkerpos (_pos_MK) select 0)+5.36), ((getMarkerpos (_pos_MK) select 1)-2.66), (getMarkerpos (_pos_MK) select 2)];
