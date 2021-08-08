params ["_array", "_all",["_chance", false]];

private _lockDoors = {
    params ["_obj"];
    _obj setVariable ["bis_disabled_Door_1",1,true];
    [_obj] remoteExec ["grad_killhouse_fnc_addEh",-2,true];
};

private _doorArray = [];

{
    if ((typeOf _x) == "grad_extras_shootHouseDoor") then {
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
