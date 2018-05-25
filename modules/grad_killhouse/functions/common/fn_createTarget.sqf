params ["_type", "_pos", "_dir", "_kind"];
if (_kind == 0) exitWith {};
private _texture = "";

_swifelTargetsTextur = {
    /*
    "\A3\Structures_F_Mark\Training\Data\Target_HVT1_CO.paa",
    "\A3\Structures_F_Mark\Training\Data\Target_HVT2_CO.paa",
    "\A3\Structures_F_Mark\Training\Data\Target_Civ_CO.paa",
    "\A3\Structures_F_Mark\Training\Data\Target_Civ2_CO.paa",
    "\A3\Structures_F_Mark\Training\Data\Target_Civ3_CO.paa"
    */
    private _return = selectRandom [
        "a3\structures_f\training\data\Target_Inf_CO.paa",
        "a3\structures_f\training\data\Target_Inf2_CO.paa",
        "\A3\Structures_F_Mark\Training\Data\Target_Inf3_CO.paa",
        "\A3\Structures_F_Mark\Training\Data\Target_FIA_CO.paa"
    ];
    _return
};

switch (_type) do {
    case "TargetP_Inf_F" : {
        _type = selectRandom ["TargetP_Inf_F","TargetP_Inf2_F","TargetP_Inf3_F","TargetP_Inf4_F"]; //"TargetP_HVT1_F","TargetP_HVT2_F","TargetP_Civ_F","TargetP_Civ2_F","TargetP_Civ3_F"
    };
    case "Target_Swivel_01_ground_F" : {
        if (_kind == 1) then {
            _type = "Target_Swivel_01_ground_NoPop_F";
        };
        _texture = [] call _swifelTargetsTextur;
    };
    case "Land_Target_Swivel_01_F" : {
        if (_kind == 1) then {
            _type = "Target_Swivel_01_NoPop_F";
        };
        _texture = [] call _swifelTargetsTextur;
    };
    case "Target_Swivel_01_left_F" : {
        if (_kind == 1) then {
            _type = "Target_Swivel_01_left_NoPop_F";
        };
        _texture = [] call _swifelTargetsTextur;
    };
    case "Target_Swivel_01_right_F" : {
        if (_kind == 1) then {
            _type = "Target_Swivel_01_right_NoPop_F";
        };
        _texture = [] call _swifelTargetsTextur;
    };
};

private _obj = [_type,_pos,_dir] call grad_killhouse_fnc_createObj;
if (_texture != "") then {
    _obj setObjectTextureGlobal [0,_texture];
};

if (_kind == 1) then {
    switch (_type) do {
        case "Target_Swivel_01_ground_NoPop_F" : {
            _obj setVariable ["BIS_angleMin", 45];
            _obj setVariable ["BIS_angleMax", 135];
            _obj execVM "\A3\Structures_F_Mark\Training\Scripts\Target_Swivel_01_F_init.sqf";
        };
        case "Target_Swivel_01_NoPop_F" : {
            _obj setVariable ["BIS_angleMin", 45];
            _obj setVariable ["BIS_angleMax", 135];
            _obj execVM "\A3\Structures_F_Mark\Training\Scripts\Target_Swivel_01_F_init.sqf";
        };
        case "Target_Swivel_01_left_NoPop_F" : {
            _obj setVariable ["BIS_angleMin", 120];
            _obj setVariable ["BIS_angleMax", 180];
            _obj execVM "\A3\Structures_F_Mark\Training\Scripts\Target_Swivel_01_F_init.sqf";
        };
        case "Target_Swivel_01_right_NoPop_F" : {
            _obj setVariable ["BIS_angleMin", 0];
            _obj setVariable ["BIS_angleMax", 60];
            _obj execVM "\A3\Structures_F_Mark\Training\Scripts\Target_Swivel_01_F_init.sqf";
        };
        default {
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
    };

};

_obj
