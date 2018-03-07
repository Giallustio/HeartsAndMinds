btc_log_placing_obj = _this;

[btc_log_placing_obj, player] remoteExec ["btc_fnc_set_owner", 2];

hint composeText [
    localize "STR_BTC_HAM_LOG_PLACE_HINT1", //Q/Z to raise/lower the object
    lineBreak,
    localize "STR_BTC_HAM_LOG_PLACE_HINT2", //X/C to rotate the object
    lineBreak,
    localize "STR_BTC_HAM_LOG_PLACE_HINT3", //F/R to tilt the object
    lineBreak,
    localize "STR_BTC_HAM_LOG_PLACE_HINT4" //SHIFT to increase the movement
];

btc_log_placing = true;
btc_log_placing_dir = 180;
btc_log_rotating_dir = 0;
btc_log_ptich_dir = 0;

//add action ACE
private _actionEH = [player, "DefaultAction", {true}, {btc_log_placing = false;}] call ace_common_fnc_addActionEventHandler;

//show mouse hint for release
[localize "STR_BTC_HAM_LOG_PLACE_RELEASE", ""] call ace_interaction_fnc_showMouseHint; //Release

//add actions to keys
private _place_EH_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", btc_fnc_log_place_key_down];

[player] call ace_weaponselect_fnc_putWeaponAway;
player forceWalk true;

btc_log_placing_obj enableSimulation false;

private _bbr = boundingBoxReal btc_log_placing_obj;
private _c = boundingCenter btc_log_placing_obj;

btc_log_placing_h = abs((_bbr select 0) select 2) - (_c select 2);
btc_log_placing_d = 1.5 + (abs(((_bbr select 1) select 1) - ((_bbr select 0) select 1)));

btc_log_placing_obj attachTo [player,[0, btc_log_placing_d, btc_log_placing_h]];
btc_log_placing_obj setDir btc_log_placing_dir;

[{
    params ["_arguments", "_idPFH"];
    if (!Alive player || player getVariable ["ACE_isUnconscious", false] || !btc_log_placing) then {
        _arguments params ["_placing_obj", "_actionEH", "_place_EH_keydown"];

        //remove PFH
        [_idPFH] call CBA_fnc_removePerFrameHandler;

        _placing_obj enableSimulation true;
        detach _placing_obj;

        player forceWalk false;

        btc_log_placing_obj = objNull;
        (findDisplay 46) displayRemoveEventHandler ["KeyDown", _place_EH_keydown];

        hintSilent "";

        //remove mouse hint
        call ace_interaction_fnc_hideMouseHint;

        // remove drop action
        [player, "DefaultAction", _actionEH, -1] call ace_common_fnc_removeActionEventHandler;

    };
}, 0.5, [_this, _actionEH, _place_EH_keydown]] call CBA_fnc_addPerFrameHandler;
