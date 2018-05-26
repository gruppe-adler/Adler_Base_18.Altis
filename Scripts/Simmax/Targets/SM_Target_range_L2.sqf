// Einstellen der Entfernung der Targets
// Simmax

params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK"];

{
    deleteVehicle _x;
}forEach (nearestObjects [lane_2, ["Sign_Sphere10cm_F"], 2]);

lane_2 setPos [((getMarkerpos (_pos_MK) select 0)+0.03), ((getMarkerpos (_pos_MK) select 1)+2.55), (getMarkerpos (_pos_MK) select 2)];
