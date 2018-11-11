
/* ----------------------------------------------------------------------------
Function: btc_fnc_int_orders

Description:
    Fill me when you edit me !

Parameters:
    _order - [Number]
    _unit - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_int_orders;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_order", 0, [0]],
    ["_unit", objNull, [objNull]]
];

private _gesture = ["", "gestureFreeze", "gestureCover", "gestureGo", "gestureGo"] select _order;

player playActionNow _gesture;

private _pos = getPos player;
private _dir = getDir player;
private _units = (_pos nearEntities [["Car", "Civilian_F"] + btc_civ_type_units, btc_int_radius_orders]) apply {driver _x};

if (_units isEqualTo []) exitWith {true};

if (isNull _unit) then {
    [_units, _dir, _order] remoteExec ["btc_fnc_int_orders_give", 2];
} else {
    if (_order isEqualTo 4) then {

        btc_int_ask_data = nil;
        ["btc_global_reputation"] remoteExecCall ["btc_fnc_int_ask_var", 2];

        waitUntil {!(isNil "btc_int_ask_data")};
        private _rep = btc_int_ask_data;

        if (_rep >= 500) then {
            [name _unit, localize "STR_BTC_HAM_CON_INT_ORDERS_SHOWMAP"] call btc_fnc_showSubtitle; //Show me where you want to go with your map.
            openMap true;
            ["1", "onMapSingleClick", {
                if (surfaceIsWater _pos) then {
                    [name (_this select 4), localize "STR_BTC_HAM_CON_INT_ORDERS_ONLAND"] call btc_fnc_showSubtitle; //Selected area must be on land.
                } else {
                    [[_this select 4], 0, 4, _pos] remoteExec ["btc_fnc_int_orders_give", _this select 4];
                    ["1", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                    openMap false;
                    private _textMap = selectRandom [
                            localize "STR_BTC_HAM_CON_INT_ORDERS_TAXI_OK1", // No problem. I'd love to do that.
                            localize "STR_BTC_HAM_CON_INT_ORDERS_TAXI_OK2", // The ride should not take long. Let's go.
                            localize "STR_BTC_HAM_CON_INT_ORDERS_TAXI_OK3"  // After what you've done for us, it's an honor to drive you. Let's go.
                    ];
                    [name (_this select 4), _textMap] call btc_fnc_showSubtitle;
                };
            }, [_unit]] call BIS_fnc_addStackedEventHandler;
        } else {
            if !(player getVariable ["interpreter", false]) exitWith {
                [name _unit, localize "STR_BTC_HAM_CON_INFO_ASKREP_NOINTER"] call btc_fnc_showSubtitle; //I can't understand what is saying
            };

            private _text = selectRandom [
                localize "STR_BTC_HAM_CON_INT_ORDERS_NEG1", //I hate you ! Get out !
                localize "STR_BTC_HAM_CON_INT_ORDERS_NEG2", // Get Out of my car ! You are not welcome.
                localize "STR_BTC_HAM_CON_INT_ORDERS_NEG3", // I am not a taxi driver !
                localize "STR_BTC_HAM_CON_INT_ORDERS_NEG4"  //No ! I go where I want !
            ];
            [name _unit, _text] call btc_fnc_showSubtitle;
        };
    } else {
        [[_unit], _dir, _order] remoteExec ["btc_fnc_int_orders_give", _unit];
    };
};
