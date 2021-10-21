params [
	["_trigger", objNull, [objNull]]
];

private _portal = _trigger getVariable ["portal", objNull];

assert(!isNull _portal);

[
	{
		params  [
			["_args", [], [[]]],
			["_handle", 0, [0]]
		];
		_args params [
			["_portal", objNull, [objNull]]
		];

		private _grad_portal_direction = _portal getVariable ["grad_portal_direction", 0];
		if (_grad_portal_direction isEqualTo 0) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		private _vehicle = vehicle player;
		private _playerPortalPos = _portal worldToModel (getPosVisual _vehicle);
		if ((_playerPortalPos#1 * _grad_portal_direction) > 0) exitWith {
			private _target = _portal getVariable ["grad_portal_target", objNull];
			["grad_portal_onTeleport", [str _target]] call CBA_fnc_localEvent;

			_vehicle setDir ((getDir _vehicle) - ((getDir _portal) - (getDir _target)));
			private _playerPortalPosWithSafetyOffset = _playerPortalPos vectorAdd [0, 0.2 * _grad_portal_direction, 0];
			_vehicle setPos (_target modelToWorld _playerPortalPosWithSafetyOffset);
			[_handle] call CBA_fnc_removePerFrameHandler;			
		};
	},
	0,
	[_portal]
] call CBA_fnc_addPerFrameHandler;