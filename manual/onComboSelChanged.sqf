diag_log ["combo",_this];

params [["_ctrlCombo",controlNull],["_curSel",0]];

private _showSetting = profileNamespace getVariable ["grad_adlerBase_manualShowStatus",0];
if (_curSel > 0) then {
    profileNamespace setVariable ["grad_adlerBase_manualShowStatus",_curSel];
} else {
    profileNamespace setVariable ["grad_adlerBase_manualShowStatus",nil];
};
saveProfileNamespace
