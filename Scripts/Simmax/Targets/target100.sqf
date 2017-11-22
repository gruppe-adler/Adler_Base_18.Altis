

/*

_dist = _this select 0;

_tgtPos = trig100 modelToWorld [0,_dist,0];
tgt = createVehicle ["Target_F", _tgtPos, [], 0, "CAN_COLLIDE"];
_dir = [player,tgt] call BIS_fnc_dirTo;
tgt setDir _dir;
tgt addEventHandler ["HitPart", {_mkr = "Land_PencilRed_F" createVehicle [0,0,0]; _mkr enableSimulation false; _mkr setPosASL (_this select 0 select 3);}];

_obj = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];

_obj setPos (lane_4 modelToWorld [0,-0.5,1.8]);
// _obj setPos [(getpos (lane_4) select 0), (getpos (lane_4) select 1), ((getpos (lane_4) select 2) +1.9)];


_camPos = ([0,0,-0.5]);

[] call BIS_fnc_PIP;
sleep 0.5;
_targ_pip = ["rendertarget0",[[_obj,_camPos],lane_4],_obj] call BIS_fnc_PIP;
_targ_pip camCommit 0;

*/


//if (_pipcamState == "on") then



_simpleTarget = _this select 0;

        //create invisible sphere to act as a camera
        temp_PIPcam_Vehicle = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
		
        //temp_PIPcam_Vehicle setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0)"];

		
        //position and attach sphere to simpleTarget
		
		
        _pos = getPosATL _simpleTarget vectorAdd [-0.9, -0.9, 1];
		
		
		
        temp_PIPcam_Vehicle setPos _pos;
        //_camPos = ([0,-1.2,-0.4]);
	    _camPos = ([0,0,-1]);
		
		
        temp_PIPcam_Vehicle attachTo [_simpleTarget];

        // create camera        
        cam = ["rendertarget0",[[temp_PIPcam_Vehicle,_camPos],_simpleTarget],temp_PIPcam_Vehicle] call BIS_fnc_PIP;
        cam camCommit 0;
	


