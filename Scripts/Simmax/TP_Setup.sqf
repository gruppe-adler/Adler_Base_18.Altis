params ["_obj", "_position"];

if (_position != "Adler Base" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - Adler Base","scripts\simmax\SM_Teleporter.sqf",["Adler_Base",0,220]];
};

if (_position != "Shooting Range" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - Shooting Range","scripts\simmax\SM_Teleporter.sqf",["Shooting_Range",0,50]];
};

if (_position != "Indoor Range" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - Indoor Range","scripts\simmax\SM_Teleporter.sqf",["CQB_Area",0,320]];
};

if (_position != "USS Freedom" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - USS Freedom","scripts\simmax\SM_Teleporter.sqf",["USS_Freedom",23,170]];
};

if (_position != "Mortar Range" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - Mortar Range","scripts\simmax\SM_Teleporter.sqf",["mortar_range",0,320]];
};

if (_position != "Killhouse" ) then {
    _obj addAction ["<t color=""#e60000"">" + "Teleport - Killhouse","scripts\simmax\SM_Teleporter.sqf",["killhouse",0,320]];
};
