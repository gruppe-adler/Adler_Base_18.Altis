// Einstellen der Entfernung der Targets
// Simmax

params ["_target","_caller","_ID","_args"];
_args params ["_pos_MK_01"];

{
    deleteVehicle _x;
}forEach (nearestObjects [lane_1, ["Sign_Sphere10cm_F"], 2]);

lane_1 setPos [((getMarkerpos (_pos_MK_01) select 0)-2.69), ((getMarkerpos (_pos_MK_01) select 1)+5.21), (getMarkerpos (_pos_MK_01) select 2)];
