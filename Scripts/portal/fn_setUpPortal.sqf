params [
	["_portal", objNull, [objNull]],
	["_target", objNull, [objNull]]
];

assert(_portal isKindOf "Land_ConcreteWall_02_m_gate_F");
assert(_target isKindOf "Land_ConcreteWall_02_m_gate_F");

_portal setVariable ["grad_portal_target", _target];

// "Land_ConcreteWall_02_m_gate_F" dimensions are: [-1.2; -0.2],[1.2,0.2]
private _triggerRadius = 1.2;

private _portalTrigger = createTrigger ["EmptyDetector", getPosWorld _portal, false];
_portalTrigger setVariable ["_sideSign", 0];
_portalTrigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_portalTrigger setTriggerArea [_triggerRadius, _triggerRadius, 0, false, 2];
_portalTrigger setTriggerStatements ["this && ([thisTrigger, thisList] call grad_portal_fnc_triggerCondition)", "[thisTrigger, thisList] call grad_portal_fnc_triggerOn", "[thisTrigger] call grad_portal_fnc_triggerOff"];
_portalTrigger setTriggerInterval 0;
_portalTrigger setVariable ["portal", _portal];


_portalTrigger