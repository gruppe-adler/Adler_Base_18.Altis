diag_log ["combo",_this];

params [["_ctrlCombo",controlNull]];

_ctrlCombo lbAdd "IMMER ANZEIGEN";
_ctrlCombo lbAdd "ÄNDERUNGEN ANZEIGEN";
_ctrlCombo lbAdd "NIE ANZEIGEN";

private _saveSel = profileNamespace getVariable ["grad_adlerBase_manualShowStatus",0];
_ctrlCombo lbSetCurSel _saveSel;
