#include "defines.hpp"

params [["_display",displayNull]];

grad_adlerBase_contentData = call compile preprocessFile "manual\CONTENT.sqf";

private _ctrlList = _display displayCtrl GRAD_ADLERBASE_MANUALIDCLIST;
private _ctrlPlayerName = _display displayCtrl GRAD_ADLERBASE_MANUALIDCPLAYERNAME;
private _ctrlCheckBox = _display displayCtrl GRAD_ADLERBASE_MANUALIDCCHECKBOX;

if (isNull _ctrlList) exitWith {diag_log "Adlerbase Manual ERROR: onLoad - _ctrlList was null"};

_ctrlPlayerName ctrlSetText (toUpper profileName);

for [{_i=0},{_i<count grad_adlerBase_contentData},{_i=_i+2}] do {
    _ctrlList lbAdd (grad_adlerBase_contentData select _i);
};

if (count grad_adlerBase_contentData > 0) then {
    _ctrlList lbSetCurSel 0;
};

private _dontShow = profileNamespace getVariable ["grad_adlerBase_dontShowManualOnStart",false];
_ctrlCheckBox cbSetChecked _dontShow;
