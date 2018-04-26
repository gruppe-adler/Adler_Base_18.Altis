_action = ["mortar_game", "Mörser Feuerauftrag anfordern", "a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {[_target] call grad_mortargame_fnc_start},{true},{}] call ace_interact_menu_fnc_createAction; //Load selected
["B_T_Mortar_01_F", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass; //Logistic
