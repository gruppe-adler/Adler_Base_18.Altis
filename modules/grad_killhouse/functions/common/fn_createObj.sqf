params ["_type", "_pos", "_dir"];

_dir = _dir mod 360;
_obj = createVehicle [_type,_pos,[], 0, "CAN_COLLIDE"];
_obj setDir _dir;
_obj setPos _pos;

_obj
