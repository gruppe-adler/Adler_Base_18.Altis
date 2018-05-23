params ["_obj"];

//Main Action
private _action = ["GRAD_Killhouse", "Killhouse", "", {},{true}] call ace_interact_menu_fnc_createAction;
[_obj,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;

//Empty Spawn Actions
private _mainEmptyAction = ["GRAD_KillhouseEmpty", "Leer Spawn", "", {},{true},{},[],((getPos _obj) vectorAdd [0,0,1.5])] call ace_interact_menu_fnc_createAction;
private _basic = ["GRAD_KillhouseEmptybasic", "Basic", "", {
    _target setVariable ["GRAD_KILLHOUSE_AKTIV",true,true];
    private _array = [0] call grad_killhouse_fnc_basic;
    GRAD_Killhouse_Sign setObjectTextureGlobal [0,"modules\grad_killhouse\data\killhouse_besetzt.paa"];
    _target setVariable ["GRAD_KILLHOUSE_ITEMS",_array,true];
},{!(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions","GRAD_Killhouse"], _mainEmptyAction] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_KillhouseEmpty"], _basic] call ace_interact_menu_fnc_addActionToObject;

//Static Spawn Actions
private _mainStaticAction = ["GRAD_KillhouseStaticTarget", "Static Targets", "", {},{true}] call ace_interact_menu_fnc_createAction;
private _basic = ["GRAD_KillhouseStaticTargetbasic", "Basic", "", {
    _target setVariable ["GRAD_KILLHOUSE_AKTIV",true,true];
    private _array = [1] call grad_killhouse_fnc_basic;
    GRAD_Killhouse_Sign setObjectTextureGlobal [0,"modules\grad_killhouse\data\t"];
    _target setVariable ["GRAD_KILLHOUSE_ITEMS",_array,true];
},{!(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions","GRAD_Killhouse"], _mainStaticAction] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_KillhouseStaticTarget"], _basic] call ace_interact_menu_fnc_addActionToObject;

//Pop Up Spawn Actions
private _mainPopUpAction = ["GRAD_KillhousePopUpTarget", "Pop Up Targets", "", {},{true}] call ace_interact_menu_fnc_createAction;
private _basic = ["GRAD_KillhousePopUpTargetbasic", "Basic", "", {
    _target setVariable ["GRAD_KILLHOUSE_AKTIV",true,true];
    private _array = [2] call grad_killhouse_fnc_basic;
    GRAD_Killhouse_Sign setObjectTextureGlobal [0,"modules\grad_killhouse\data\killhouse_besetzt.paa"];
    _target setVariable ["GRAD_KILLHOUSE_ITEMS",_array,true];
},{!(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions","GRAD_Killhouse"], _mainPopUpAction] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_KillhousePopUpTarget"], _basic] call ace_interact_menu_fnc_addActionToObject;

//Reset Action
private _action = ["GRAD_Killhouse_Reset", "Reset Killhouse", "", {
    [(_target getVariable "GRAD_KILLHOUSE_ITEMS")] call grad_killhouse_fnc_reset;
    _target setVariable ["GRAD_KILLHOUSE_AKTIV",false,true];
    _target setVariable ["GRAD_KILLHOUSE_ITEMS",[],true];
    GRAD_Killhouse_Sign setObjectTextureGlobal [0,"modules\grad_killhouse\data\killhouse_frei.paa"];
},{(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse"], _action] call ace_interact_menu_fnc_addActionToObject;

//Lock Doors
private _actionLockDoors = ["GRAD_Killhouse_lockDoors", "Lock Doors", "", {(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])},{}] call ace_interact_menu_fnc_createAction;
private _actionLockAll = ["GRAD_Killhouse_lockDoors_All", "All", "", {
    [(_target getVariable "GRAD_KILLHOUSE_ITEMS"),true,false] call grad_killhouse_fnc_lockDoors;
},{(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;
private _actionLock50 = ["GRAD_Killhouse_lockDoors_50", "50%", "", {
    [(_target getVariable "GRAD_KILLHOUSE_ITEMS"),false,true] call grad_killhouse_fnc_lockDoors;
},{(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;
private _actionLockRandom = ["GRAD_Killhouse_lockDoors_Random", "Random", "", {
    [(_target getVariable "GRAD_KILLHOUSE_ITEMS"),false,false] call grad_killhouse_fnc_lockDoors;
},{(_target getVariable ["GRAD_KILLHOUSE_AKTIV",false])}] call ace_interact_menu_fnc_createAction;

[_obj, 0, ["ACE_MainActions","GRAD_Killhouse"], _actionLockDoors] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_Killhouse_lockDoors"], _actionLockAll] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_Killhouse_lockDoors"], _actionLock50] call ace_interact_menu_fnc_addActionToObject;
[_obj, 0, ["ACE_MainActions","GRAD_Killhouse","GRAD_Killhouse_lockDoors"], _actionLockRandom] call ace_interact_menu_fnc_addActionToObject;
