params ["_city", "_ieds"];

if (btc_debug) then {systemChat format ["START IED CHECK CITY ID %1", _city getVariable "id"];};
if (btc_debug_log) then {diag_log format ["START IED CHECK CITY ID %1", _city getVariable "id"];};

private _ieds_check = _ieds select {!((_x select 2) isEqualTo objNull)};

[{
    params ["_args", "_id"];
    _args params ["_city", "_ieds", "_ieds_check"];

    if (_city getVariable ["active", false]) then {
        {
            params ["_wreck", "_type", "_ied"];

            if (!isNull _ied && {Alive _ied}) then {
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
            params ["_wreck", "_type", "_ied"];

            if (!isNull _wreck && {Alive _wreck}) then {
                _data pushBack [getPosATL _wreck, _type, getDir _wreck, !(_ied isEqualTo objNull)];

                deleteVehicle _ied;
                deleteVehicle _wreck;
            };
        } forEach _ieds;

        _city setVariable ["ieds", _data];

        if (btc_debug) then {systemChat format ["END IED CHECK CITY ID %1", _city getVariable "id"];};
        if (btc_debug_log) then {diag_log format ["END IED CHECK CITY ID %1", _city getVariable "id"];};
    };
} , 1, [_city, _ieds, _ieds_check]] call CBA_fnc_addPerFrameHandler;
