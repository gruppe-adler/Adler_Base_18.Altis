if (((squadParams player) select 0) select 1 == "Gruppe Adler") then {
    player setUnitRank "LIEUTENANT";
}else{
    player setUnitRank "PRIVATE";
};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
[] spawn {
    waitUntil {!isNull player};
    ["RegisterGroup",[group player,player,[nil,name player,false]]] remoteExec ["BIS_fnc_dynamicGroups",2,false];
};

[portal_base, portal_arena] call grad_portal_fnc_setUpPortal;
[portal_arena, portal_base] call grad_portal_fnc_setUpPortal;