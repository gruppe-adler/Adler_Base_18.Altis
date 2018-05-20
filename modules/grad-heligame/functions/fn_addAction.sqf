if (!hasInterface) exitWith {};

player addAction ["<t color='#EC9A19'>Heligame!</t>", {[] call GRAD_heligame_fnc_start}, nil, 1.5, true, true, "", "!GRAD_Heligame_inProgress && (vehicle _target) isKindOf 'Helicopter' && (local (vehicle _target))"];
