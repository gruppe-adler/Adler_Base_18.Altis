["Initialize"] call BIS_fnc_dynamicGroups;

//set random time
_date = date;
_date set [3,((round(random 10))+8)];
_date set [4,(round(random 60))];
setDate _date;

//remove fog, lightning & rain
0 setFog 0;
0 setRain 0;
0 setLightnings 0;
forceWeatherChange;
999999 setFog 0;
999999 setRain 0;
999999 setLightnings 0;

//set random weather
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
