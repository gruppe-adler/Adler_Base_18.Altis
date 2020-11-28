params [
	["_trigger", objNull, [objNull]],
	["_list", [], [[]]]
];

private _portal = _trigger getVariable ["portal", objNull];

assert(!isNull _portal);

private _playerPortalPos = _portal worldToModel (getPosVisual player);

private _grad_portal_direction = if (_playerPortalPos#1 > 0) then {-1} else {1};
_portal setVariable ["grad_portal_direction", _grad_portal_direction];

[_trigger, _portal] call grad_portal_fnc_startTeleportPfh;