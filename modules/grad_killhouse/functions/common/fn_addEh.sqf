params ["_obj"];
_obj addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
        if (_selection isEqualTo ["door"]) then {
            _target setVariable ['bis_disabled_Door_1',0,true];
            _target animate ["door", 1];
        };
}];
