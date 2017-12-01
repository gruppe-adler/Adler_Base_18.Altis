#include "defines.hpp"

params [["_ctrlList",controlNull],["_selID",-1]];

if (_selID < 0) exitWith {};

private _display = ctrlParent _ctrlList;
private _ctrlContentTitle = _display displayCtrl GRAD_ADLERBASE_MANUALIDCCONTENTTITLE;
private _ctrlContent = _display displayCtrl GRAD_ADLERBASE_MANUALIDCCONTENT;
if ({isNull _x} count [_ctrlContentTitle,_ctrlContent] > 0) exitWith {diag_log "Adlerbase Manual ERROR: onLbSelChanged - something was null"};
if (_selID >= count grad_adlerBase_contentData) exitWith {diag_log format ["Adlerbase Manual ERROR: onLbSelChanged - no data for selected item (_selID: %1)",_selID]};

_ctrlContentTitle ctrlSetStructuredText parseText (grad_adlerBase_contentData select (_selID*2));
_ctrlContent ctrlSetStructuredText parseText (grad_adlerBase_contentData select ((_selID*2)+1));
