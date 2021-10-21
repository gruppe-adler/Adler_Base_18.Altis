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

["grad_portal_onTeleport", {[_this] call grad_portal_fnc_setLoadout}] call CBA_fnc_addEventHandler;

[portal_base, portal_arena] call grad_portal_fnc_setUpPortal;
[portal_arena, portal_base] call grad_portal_fnc_setUpPortal;