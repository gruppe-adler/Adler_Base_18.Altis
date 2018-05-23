params ["_type", "_pos", "_dir", "_kind"];
if (_kind == 0) exitWith {};

_obj = [_type,_pos,_dir] call grad_killhouse_fnc_createObj;

if (_kind == 1) then {
    _obj setVariable ["popDelay", 0,true];
    _obj animate ["Terc",0];
    _obj addEventHandler ["Hit", {
        params ["_unit", "_source", "_damage", "_instigator"];
        _unit spawn {
            params ["_target"];
            waitUntil{_target animationPhase "terc" > 0};
            _target animate ["terc",0];
        };
    }];
};

_obj
