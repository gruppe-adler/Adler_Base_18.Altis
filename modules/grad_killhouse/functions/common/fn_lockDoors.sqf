params ["_array", "_all",["_chance", false]];

private _lockDoors = {
    params ["_obj"];
    _obj setVariable ['bis_disabled_Door_1',1,true];
    _obj addEventHandler ["HitPart", {
            (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
            if (_selection isEqualTo ["door"]) then {
                _target setVariable ['bis_disabled_Door_1',0,true];
                _target animate ["door", 1];
            };
    }];
};

private _doorArray = [];

{
    if ((typeOf _x) == "Land_Shoot_House_Wall_Door_F") then {
        _doorArray pushBack _x;
    };
}forEach _array;

if (_all) then {
    {
        [_x] call _lockDoors;
    }forEach _doorArray;
}else{
    _doorArray call BIS_fnc_arrayShuffle;
    private _count = 0;
    if (_chance) then {
        _count = (ceil((count _doorArray)/2));
    }else{
        _count = (ceil(random(count _doorArray)));
    };

    for "_i" from 0 to _count do {
        [(_doorArray select _i)] call _lockDoors;
    };
};
