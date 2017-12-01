params [["_sleepTime",5]];

if (!hasInterface) exitWith {};

private _showStatus = profileNamespace getVariable ["grad_adlerBase_manualShowStatus",0];
if (_showStatus == 2) exitWith {};

private _exit = false;
if (_showStatus == 1) then {
    grad_adlerBase_contentData = call compile preprocessFile "manual\CONTENT.sqf";
    _diffHash = profileNamespace getVariable ["grad_adlerBase_manualDiffHash",[[],-1] call CBA_fnc_hashCreate];

    _exit = true;
    for [{_i=0},{_i<count grad_adlerBase_contentData},{_i=_i+2}] do {
        _headline = grad_adlerBase_contentData select _i;
        _text = grad_adlerBase_contentData select (_i+1);
        _prevWordCount = [_diffHash,_headline] call CBA_fnc_hashGet;
        if (_prevWordCount != count _text) exitWith {_exit = false};
    };
};
if (_exit) exitWith {};


waitUntil {!isNull (findDisplay 46)};
waitUntil {!isNull player};
sleep _sleepTime;

createDialog "grad_adlerBase_RscDisplayManual";
