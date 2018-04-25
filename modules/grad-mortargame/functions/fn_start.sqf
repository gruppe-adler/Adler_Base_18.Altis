params ["_mortar"];

if !(isNull GRAD_MORTARSHOTVEHICLE) exitWith {[(getPos GRAD_MORTARSHOTVEHICLE)] call grad_mortargame_fnc_fiveLiner;};
_startPos = (getPos _mortar);
_dir = [];
if (selectRandom [false,true]) then {
        _dir = [0,60];
}else{
        _dir = [175,360];
};

_pos = [_startPos,[100,3000], _dir, false] call grad_mortargame_fnc_findPos;
if (isNil "_pos") exitWith {["No position found!"] call grad_mortargame_fnc_message;};

private _veh = createVehicle ["C_Offroad_01_F", _pos, [], 0, "CAN_COLLIDE"];
_veh addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    ["Ziel zerstört"] call grad_mortargame_fnc_message;
}];
GRAD_MORTARSHOTVEHICLE = _veh;

_handle = _mortar addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _unit setAmmo [((weapons _unit)select 0), 1000000];
    [_projectile] call grad_mortargame_fnc_logPos;
}];
[600, [_veh], _handle, _mortar] call grad_mortargame_fnc_cleanUp;

[_pos] call grad_mortargame_fnc_fiveLiner;
MORTARSHOT_LASTPOS = [];
