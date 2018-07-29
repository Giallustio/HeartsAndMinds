params [
    ["_veh", objNull, [objNull]]
];

private _indexEH = _veh getVariable ["btc_eh", []];
if (_indexEH isEqualTo []) exitWith {false};

private _EH_name = ["Fuel", "HandleDamage", "GetOut", "HandleDamage"];
{
    _veh removeEventHandler [_EH_name select _forEachIndex, _x];
} forEach _indexEH;

true
