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
_veh setVariable ["GRAD_MORTARGAME_MORTAR", _mortar];
GRAD_MORTARSHOTVEHICLE = _veh;

GRAD_MORTARGAME_EH = _mortar addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _unit setAmmo [((weapons _unit)select 0), 1000000];
    [_projectile] call grad_mortargame_fnc_logPos;
}];

_veh addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    (_unit getVariable "GRAD_MORTARGAME_MORTAR") removeEventHandler ["Fired", GRAD_MORTARGAME_EH];
    deleteVehicle _unit;
    if (local _killer) then {
        ["TaskSucceeded",["","Mortargame: Ziel zerstört!"]] remoteExec ["BIS_fnc_showNotification",_killer,false];
    };
}];

[600, [_veh], GRAD_MORTARGAME_EH, _mortar,player] call grad_mortargame_fnc_cleanUp;

[_pos] call grad_mortargame_fnc_fiveLiner;
MORTARSHOT_LASTPOS = [];
