#include "defines.hpp"

params [["_display",displayNull],["_exitCode",0]];

diag_log _this;
grad_adlerBase_contentData = nil;

if (_exitCode == 0) exitWith {};

private _ctrlCheckBox = _display displayCtrl GRAD_ADLERBASE_MANUALIDCCHECKBOX;
private _dontShow = cbChecked _ctrlCheckBox;
private _setting = profileNamespace getVariable ["grad_adlerBase_dontShowManualOnStart",false];

diag_log [_ctrlCheckBox,_dontShow];

if !(_dontShow isEqualTo _setting) then {
    profileNamespace setVariable ["grad_adlerBase_dontShowManualOnStart",_dontShow];
    saveProfileNamespace;
};
