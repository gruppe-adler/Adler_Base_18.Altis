params ["_GRAD_lz_pos", "_lz_marker"];

// Zufällige Smokefarbe wählen.
_smokeColor = selectRandom
  [
    "SmokeShellBlue",
    "SmokeShellOrange",
    "SmokeShellYellow",
    "SmokeShellRed",
    "SmokeShellPurple",
    "SmokeShellGreen"
  ];
 _flareColor = selectRandom
    [
      "F_40mm_Green",
      "F_40mm_White",
      "F_40mm_Red",
      "F_40mm_Cir",
      "F_40mm_Yellow"
    ];

// Smoke spawnen.
_GRAD_lz_smoke = _smokeColor createVehicle _GRAD_lz_pos;
_GRAD_lz_flare = _flareColor createVehicle (_GRAD_lz_pos vectorAdd [0,0,50]);
hint "Smoke is on the deck!";

// Trigger erstellen, um den Smoke zu löschen
_GRAD_lz_trg = createTrigger ["EmptyDetector", _GRAD_lz_pos];
_GRAD_lz_trg setTriggerArea [30, 30, 0, false, 30];
_GRAD_lz_trg setTriggerActivation ["ANY", "PRESENT", false];
_GRAD_lz_trg setVariable ["GRAD_local_lz_marker", _lz_marker];
_GRAD_lz_trg setTriggerTimeout [10, 15, 20, true];
_GRAD_lz_trg setTriggerStatements
  [
    "GRAD_HELIGAME_CARGOOBJECT in thisList",
    format ["
      ['TaskSucceeded',['','Cargo LZ abgeschlossen!']] call BIS_fnc_showNotification;
      deleteVehicle %1;
      deleteMarker %2;
      [] call GRAD_heligame_fnc_start;
      deleteVehicle thisTrigger;
    ",GRAD_HELIGAME_CARGOOBJECT, _lz_marker],
    "this"
  ];

[600,[_GRAD_lz_trg]] remoteExec ["GRAD_heligame_fnc_cleanUp",2,false];
