params ["_waitTime","_objects", "_handle", "_mortar", "_unit"];

[{
    {
        if (_x isEqualType objNull && {!isNull _x}) then {
            deleteVehicle _x;
            ["TaskSucceeded",[,"Mortar Game ended."]] remoteExecCall ["BIS_fnc_showNotification",_unit,false];
        };
    } forEach _this;
    _mortar removeEventHandler ["Fired", _handle];
}, _objects, _waitTime] call CBA_fnc_waitAndExecute;
