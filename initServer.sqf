["Initialize"] call BIS_fnc_dynamicGroups;

_date = date;
_date set [3,((round(random 10))+8)];
_date set [4,(round(random 60))];
setDate _date;

skipTime -24;
86400 setOvercast (random 1);
skipTime 24;
[] spawn {
	sleep 0.1;
	simulWeatherSync;
};

// für Teleport-Board Anzeige Airborne
grad_adlerBase_airVehicleUnits = [];
publicVariable "grad_adlerBase_airVehicleUnits";
