
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ropeBreak

Description:
    Handle towing rope when they break.

Parameters:
    _thisBI - BI parameters. [Array]
    _thisArgsCBA - CBA parameters. [Array]

Returns:

Examples:

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params ["_thisBI", "_thisArgsCBA"];
_thisBI params ["_tower", "_rope", "_flat"];
_thisArgsCBA params ["_vehicleSelected", "_safeDistance", "_ropes"];

_tower removeEventHandler ["RopeBreak", _thisId];

deTach _vehicleSelected;

// Handle flipped vehicle
if ((vectorUp _vehicleSelected) select 2 < 0) then {
    _flat setPos [0, 0, 0]; // Avoid collision with _vehicleSelected
    private _towerDir = getDir _tower;
    private _selectedSafePos = _tower getPos [- _safeDistance, _towerDir];
    _selectedSafePos set [2, 0.5 + (_selectedSafePos select 2)];
    _vehicleSelected setPos _selectedSafePos;
    _vehicleSelected setDir _towerDir;
};
_vehicleSelected setVectorUp surfaceNormal position _vehicleSelected;

if !(
    _tower isKindOf "Ship" ||
    _tower isKindOf "Air"
) then {
    deleteVehicle _flat;
};
_ropes apply {deleteVehicle _x};

_vehicleSelected setVariable ["btc_towing", objNull, true];
_tower setVariable ["btc_towing", objNull, true];
