// Einstellen der Entfernung der Targets
// Simmax

params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK"];

{
    if ((vehicleVarName _x) == "") then {deleteVehicle _x;};
}forEach (nearestObjects [lane_3, ["Sign_Sphere10cm_F"], 2]);

lane_3 setPos [((getMarkerpos (_pos_MK) select 0)+2.65), ((getMarkerpos (_pos_MK) select 1)-0.05), (getMarkerpos (_pos_MK) select 2)];
