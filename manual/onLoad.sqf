#include "defines.hpp"

params [["_display",displayNull]];

grad_adlerBase_contentData = call compile preprocessFile "manual\CONTENT.sqf";

// DIALOG ======================================================================
private _ctrlList = _display displayCtrl GRAD_ADLERBASE_MANUALIDCLIST;
private _ctrlPlayerName = _display displayCtrl GRAD_ADLERBASE_MANUALIDCPLAYERNAME;
private _ctrlCheckBox = _display displayCtrl GRAD_ADLERBASE_MANUALIDCCOMBO;

if (isNull _ctrlList) exitWith {diag_log "Adlerbase Manual ERROR: onLoad - _ctrlList was null"};

_ctrlPlayerName ctrlSetText (toUpper profileName);

private _dontShow = profileNamespace getVariable ["grad_adlerBase_dontShowManualOnStart",false];
_ctrlCheckBox cbSetChecked _dontShow;


// CHECK NEW CHANGES ===========================================================
private _changedID = -1;
private _diffHash = profileNamespace getVariable ["grad_adlerBase_manualDiffHash",[[],-1] call CBA_fnc_hashCreate];

for [{_i=0},{_i<count grad_adlerBase_contentData},{_i=_i+2}] do {
    _headline = grad_adlerBase_contentData select _i;
    _text = grad_adlerBase_contentData select (_i+1);

    _prevWordCount = [_diffHash,_headline] call CBA_fnc_hashGet;
    if (_prevWordCount < 0) then {
        grad_adlerBase_contentData set [_i,format ["Neu: %1",_headline]];
        if (_changedID < 0) then {_changedID = _i};
    } else {
        if (_prevWordCount != (count _text)) then {
            grad_adlerBase_contentData set [_i,format ["%1 (Änderungen)",_headline]];
            if (_changedID < 0) then {_changedID = _i};
        };
    };

    [_diffHash,_headline,count _text] call CBA_fnc_hashSet;

    _ctrlList lbAdd (grad_adlerBase_contentData select _i);
};
profileNamespace setVariable ["grad_adlerBase_manualDiffHash",_diffHash];
saveProfileNamespace;


if (_changedID > 0) then {
    _ctrlList lbSetCurSel _changedID;
} else {
    _ctrlList lbSetCurSel 0;
};
