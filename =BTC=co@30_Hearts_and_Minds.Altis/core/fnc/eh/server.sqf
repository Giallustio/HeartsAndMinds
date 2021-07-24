
/* ----------------------------------------------------------------------------
Function: btc_eh_fnc_server

Description:
    Add event handler to server.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_eh_fnc_server;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

addMissionEventHandler ["BuildingChanged", btc_rep_fnc_buildingchanged];
["ace_explosives_defuse", btc_rep_fnc_explosives_defuse] call CBA_fnc_addEventHandler;
["ace_killed", btc_rep_fnc_killed] call CBA_fnc_addEventHandler;
["Animal", "InitPost", {
    [_this select 0, "HandleDamage", btc_rep_fnc_hd] call CBA_fnc_addBISEventHandler;
}] call CBA_fnc_addClassEventHandler;
["Animal", "killed", {
    params ["_unit", "_killer", "_instigator"];
    [_unit, "", _killer, _instigator] call btc_rep_fnc_killed;
}] call CBA_fnc_addClassEventHandler;
{
    [_x, "InitPost", {
        [_this select 0, "Suppressed", btc_rep_fnc_suppressed] call CBA_fnc_addBISEventHandler;
        [_this select 0, "HandleDamage", btc_rep_fnc_hd] call CBA_fnc_addBISEventHandler;
    }, false] call CBA_fnc_addClassEventHandler;
} forEach btc_civ_type_units;
{
    [_x, "InitPost", {
        [_this select 0, "HandleDamage", btc_rep_fnc_hd] call CBA_fnc_addBISEventHandler;
    }, false] call CBA_fnc_addClassEventHandler;
} forEach btc_civ_type_veh;
["ace_killed", btc_mil_fnc_unit_killed] call CBA_fnc_addEventHandler;

addMissionEventHandler ["HandleDisconnect", {
    params ["_headless"];
    if (_headless in (entities "HeadlessClient_F")) then {
        deleteVehicle _headless;
    };
}];
if (btc_p_auto_db) then {
    addMissionEventHandler ["HandleDisconnect", {
        if ((allPlayers - entities "HeadlessClient_F") isEqualTo []) then {
            [] call btc_db_fnc_save;
        };
    }];
};
if (btc_p_chem) then {
    ["ace_cargoLoaded", btc_chem_fnc_propagate] call CBA_fnc_addEventHandler;
    ["AllVehicles", "GetIn", {[_this select 0, _this select 2] call btc_chem_fnc_propagate}] call CBA_fnc_addClassEventHandler;
    ["DeconShower_01_F", "init", {(_this select 0) setVariable ['bin_deconshower_disableAction',true]}] call CBA_fnc_addClassEventHandler;
    ["DeconShower_02_F", "init", {(_this select 0) setVariable ['bin_deconshower_disableAction',true]}] call CBA_fnc_addClassEventHandler;
};

["GroundWeaponHolder", "InitPost", {btc_groundWeaponHolder append _this}] call CBA_fnc_addClassEventHandler;
["acex_fortify_objectPlaced", {[_this select 2] call btc_log_fnc_init}] call CBA_fnc_addEventHandler;
if (btc_p_set_skill) then {
    ["CAManBase", "InitPost", btc_mil_fnc_set_skill] call CBA_fnc_addClassEventHandler;
};
["btc_delay_vehicleInit", btc_patrol_fnc_addEH] call CBA_fnc_addEventHandler;
["ace_killed", {
    params ["_unit"];
    if (side group _unit isNotEqualTo civilian) exitWith {};
    private _vehicle = assignedVehicle _unit;
    if (_vehicle isNotEqualTo objNull) then {
        [[], [_vehicle]] call btc_fnc_delete;
    };
}] call CBA_fnc_addEventHandler;
{
    [_x, "InitPost", {
        [_this select 0, "HandleDamage", btc_patrol_fnc_disabled] call CBA_fnc_addBISEventHandler;
    }, false] call CBA_fnc_addClassEventHandler;
} forEach btc_civ_type_veh;
["ace_tagCreated", btc_tag_fnc_eh] call CBA_fnc_addEventHandler;
["ace_disarming_dropItems", btc_rep_fnc_foodRemoved] call CBA_fnc_addEventHandler; 
["btc_respawn_player", {
    params ["_unit", "_player"];
    [btc_rep_malus_player_respawn, _player] call btc_rep_fnc_change;
    if (btc_p_respawn_ticketsAtStart >= 0) then {
        _unit setVariable ["btc_dont_delete", true];
        private _index = btc_fob_deadBodyPlayers pushBack _unit;

        if (btc_p_respawn_timeBeforeShowKIA isEqualTo -1) exitwith {};
        [{
            if (isNull _unit) exitwith {};

            private _marker = createMarker [format ["btc_fob_deadBody_%1", _index], _unit];
            _marker setMarkerType "KIA";
            _marker setMarkerSize [0.6, 0.6];
            _marker setMarkerAlpha 0.8;
            _unit setVariable ["btc_deadBody_marker", _marker];
        }, [_unit, _index], btc_p_respawn_timeBeforeShowKIA * 60] call CBA_fnc_waitAndExecute;
    }; 
}] call CBA_fnc_addEventHandler;
["ace_placedInBodyBag", {
    params ["_patient", "_bodyBag"];
    deleteMarker (_patient getVariable ["btc_deadBody_marker", ""]);
    if (_patient getVariable ["btc_dont_delete", false]) then {
        _bodyBag setVariable ["btc_isDeadPlayer", true];
    };
    [_bodyBag] call btc_log_fnc_init;
}] call CBA_fnc_addEventHandler;
