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

			if (str _target isEqualTo "portal_base") then {
				private _loadout = player getVariable ["GRAD_teleporter_loadout", []];

				if (_loadout isNotEqualTo []) then {
					player setUnitLoadout _loadout;
				};
			} else {
				private _loadout = getUnitLoadout player;
				player setVariable ["GRAD_teleporter_loadout", _loadout];

				private _baret = "grad_extras_beret_green";
				private _uniform = "U_B_CTRG_2";

				//Check if AoW is in loaded DLC
				if (1.3255e+006 in (getDLCs 1)) then {
					_uniform = "U_I_ParadeUniform_01_AAF_decorated_F";
				};

				if ((name player) isEqualTo "DerZade" || {(name player) isEqualTo "nomisum"}) then {
					_baret = "grad_extras_beret_purp";
				} else {
					if ((rank player) isEqualTo "LIEUTENANT") then {
						_baret = "grad_extras_beret_red";
					};
				};

				player setUnitLoadout [
					["rhs_weap_kar98k","","","",["rhsgref_5Rnd_792x57_kar98k",5],[],""],											//Rifle
					[],																												//Launcher
					[],																												//Pistole
					[_uniform,[]],																									//Uniform
					[],																												//Vest
					[],																												//backpack
					_baret,																											//Helmet
					"",																												//Face 
					[],																												//Binocular 
					["","","","","",""]																								//Linked Items
				];
			};
			_vehicle setDir ((getDir _vehicle) - ((getDir _portal) - (getDir _target)));
			private _playerPortalPosWithSafetyOffset = _playerPortalPos vectorAdd [0, 0.2 * _grad_portal_direction, 0];
			_vehicle setPos (_target modelToWorld _playerPortalPosWithSafetyOffset);
			[_handle] call CBA_fnc_removePerFrameHandler;			
		};
	},
	0,
	[_portal]
] call CBA_fnc_addPerFrameHandler;