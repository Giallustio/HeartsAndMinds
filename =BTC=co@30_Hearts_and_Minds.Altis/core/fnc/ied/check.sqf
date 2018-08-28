params [
    ["_city", objNull, [objNull]],
    ["_ieds", [objNull], [[]]]
];

if (btc_debug) then {
    [format ["START CITY ID %1", _city getVariable "id"], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
};
if (btc_debug_log) then {
    [format ["START CITY ID %1", _city getVariable "id"], __FILE__, [false]] call btc_fnc_debug_message;
};

private _ieds_check = _ieds select {!((_x select 2) isEqualTo objNull)};

[{
    params ["_args", "_id"];
    _args params ["_city", "_ieds", "_ieds_check"];

    if (_city getVariable ["active", false]) then {
        {
            _x params ["_wreck", "_type", "_ied"];

            if (!isNull _ied && {alive _ied}) then {
                {
                    if (side _x isEqualTo btc_player_side && {speed _x > 5 || vehicle _x != _x}) then {
                        [_wreck, _ied] spawn btc_fnc_ied_boom;
                    };
                } forEach (_ied nearEntities ["allvehicles", 10]);
            } else {
                _ieds_check = _ieds_check - [_ied];
            };
        } forEach _ieds_check;
    } else {
        [_id] call CBA_fnc_removePerFrameHandler;

        private _data = [];
        {
            _x params ["_wreck", "_type", "_ied"];

            if (!isNull _wreck && {alive _wreck}) then {
                _data pushBack [getPosATL _wreck, _type, getDir _wreck, !(_ied isEqualTo objNull)];

                deleteVehicle _ied;
                deleteVehicle _wreck;
            };
        } forEach _ieds;

        _city setVariable ["ieds", _data];

        if (btc_debug) then {
            [format ["END CITY ID %1", _city getVariable "id"], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
        };
        if (btc_debug_log) then {
            [format ["END CITY ID %1", _city getVariable "id"], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };
}, 1, [_city, _ieds, _ieds_check]] call CBA_fnc_addPerFrameHandler;
