
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_trigger_free_condition

Description:
    Check if a city should be free.

Parameters:
    _remainEnemyUnits - Remaining enemy units assigned to the city, passed by the trigger. [Array]

Returns:
    _return - If the city should be free. [Boolean]

Examples:
    (begin example)
        [_remainEnemyUnits] call btc_fnc_city_trigger_free_condition;
    (end)

Author:
    GoldJohnKing

---------------------------------------------------------------------------- */

params [
     ["_remainEnemyUnits", [], [[]]]
];

if (btc_p_city_free_trigger isEqualTo 0) then {
    _remainEnemyUnits isEqualTo []
} else {
    if (count _remainEnemyUnits > btc_p_city_free_trigger) exitWith {false};
    _remainEnemyUnits findIf {
        private _veh = vehicle _x;
        !(
            _veh isKindOf 'Man' ||
            {unitIsUAV _veh}
        )
    } isEqualTo -1
}
