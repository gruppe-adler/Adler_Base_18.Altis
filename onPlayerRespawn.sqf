// initPlayerlocal für Heligame
[] spawn
{
    waitUntil {!isNull player && !isNil "SHK_pos" && !isNull (findDisplay 46)};
    player addAction ["Heligame!", {[] call GRAD_heligame_fnc_start}, nil, 1.5, true, true, "", "!GRAD_Heligame_inProgress && (vehicle _target) isKindOf 'Air'"];
};

// Blickrichtung beim Spawn ändern
params ["_newUnit", "_oldUnit"];
_newUnit setDir 220;