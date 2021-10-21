params ["_target"];

if (_target isEqualTo "portal_base") then {
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