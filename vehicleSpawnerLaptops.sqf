params [["_obj",objNull],["_type",""]];

private _name = "";
private _vehicleTypes = [];
private _spawnWheeled = [0,0,0];
private _spawnTracked = [0,0,0];
private _spawnHeli = [0,0,0];
private _spawnPlane = [0,0,0];
private _spawnBoat = [0,0,0];

switch (_type) do {
    case ("BASE"): {
        _name = "Vehicle Spawner Base";
        _vehicleTypes = ["ALLWHEELED","ALLTRACKED","ALLHELIS","ALLPLANES"];
        _spawnWheeled = [
            [14267,16249,0,223,2,1],
            [14269,16210,0,302,2,1],
            [14234,16209,0,38,2,1]
        ];
        _spawnTracked = _spawnWheeled;
        _spawnHeli = [
            [14324,16275,0,2,3,1],
            [14347,16273,0,11,3,1],
            [14300,16273,0,350,3,1]
        ];
        _spawnPlane = [
            [14167,16191,0,111,3,1],
            [14343,16319,0,188,3,1],
            [14399,16305,0,205,3,1]
        ];
    };
    case ("CARRIER"): {
        _name = "Vehicle Spawner Carrier";
        _vehicleTypes = ["ALLHELIS","ALLPLANES","ALLBOATS"];
        _spawnHeli = {
            _target = missionNamespace getVariable ["grad_vehicleSpawner_target",objNull];
            _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];

            _return = [[0,0,0]];
            {
                _x params ["_trigger","_pos"];
                _objectsList = (list _trigger) - [_target,_preview];
                if ({!isNull _x} count _objectsList == 0) exitWith {
                    _return = _pos;
                };
            } forEach [
                [carrierSpawnerTrigger1,[[15017,14892,23.50],99]],
                [carrierSpawnerTrigger2,[[15094,14926,23.50],280]],
                [carrierSpawnerTrigger3,[[15110,15011,23.50],282]]
            ];
            _return
        };
        _spawnPlane = _spawnHeli;
        _spawnBoat = [15038,14800,60,275,50,1];
    };
};

private _condition = {true};
private _onDisplayOpen = {};
private _onDisplayClose = {OWcam cameraEffect ["Internal", "Back", "OWCam1"]};

[_obj,_name,_condition,_vehicleTypes,[_spawnWheeled,_spawnTracked,_spawnHeli,_spawnPlane,_spawnBoat],_onDisplayOpen,_onDisplayClose] call grad_vehicleSpawner_fnc_addInteraction;
