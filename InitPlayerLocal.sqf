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
