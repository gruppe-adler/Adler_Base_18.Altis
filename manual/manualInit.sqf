params [["_sleepTime",5]]

if (!hasInterface) exitWith {};

private _dontShow = profileNamespace getVariable ["grad_adlerBase_dontShowManualOnStart",false];
if (_dontShow) exitWith {};

waitUntil {!isNull (findDisplay 46)};
waitUntil {!isNull player};
sleep _sleepTime;

createDialog "grad_adlerBase_RscDisplayManual";
