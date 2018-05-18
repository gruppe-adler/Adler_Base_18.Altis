GRAD_heligame_inProgress = true;
//&& (isClass (configFile >> "CfgVehicles" >> (vehicle player) >> "slingLoadMaxCargoMass")) && ((getNumber (configFile >> "CfgVehicles" >> (vehicle player) >> "slingLoadMaxCargoMass")) > 0)
if (selectRandom [true,false]) then {
    hint "Heligame Cargo beginnt!";
    [] call GRAD_heligame_fnc_cargoPickup;
}else{
    hint "Heligame beginnt!";
    [] call GRAD_heligame_fnc_lz;
};


[{CBA_missionTime - GRAD_heligame_startTime > 600}, {
    GRAD_heligame_inProgress = false;
    hint "Heligame zu Ende!";
}, []] call CBA_fnc_waitUntilAndExecute;
