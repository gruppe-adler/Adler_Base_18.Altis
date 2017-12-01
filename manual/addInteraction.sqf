params [["_obj",objNull]];

private _action = ["grad_adlerBase_manualAction","Informationen","",{
    [{createDialog "grad_adlerBase_RscDisplayManual"},[]] call CBA_fnc_execNextFrame;
},{true}] call ace_interact_menu_fnc_createAction;
[_obj,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
