#define PREFIX grad
#define COMPONENT loadout
#include "\x\cba\addons\main\script_macros_mission.hpp"

private _unit = param [0];

private _faction = faction _unit;
private _type = typeOf _unit;
private _result = "";

if (_faction != "CIV_F") exitWith {""};

_type select [2];
