
/* ----------------------------------------------------------------------------
Function: btc_fnc_int_action_result

Description:
    Fill me when you edit me !

Parameters:
    _totalTime - [Number]
    _args - [Array]
    _onFinish - [Code]
    _onFail - [Code]
    _localizedTitle - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_int_action_result;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_totalTime", 10, [0]],
    ["_args", [], [[]]],
    ["_onFinish", {}, [{}]],
    ["_onFail", {}, [{}]],
    ["_localizedTitle", "", [""]]
];
_args params ["_target"];

private _radius = 7;
if (_target isKindOf "Man") then {_radius = 4;};
if (_target isKindOf "Helicopter") then {_radius = 20;};

_args pushBack _radius;

private _condition = {
    params ["_args"];
    _args params ["_target", "_player"];

    _target distance _player < (_args select ((count _args) - 1))
};

[_totalTime, _args, _onFinish, _onFail, _localizedTitle, _condition, ["isnotinside"]] call ace_common_fnc_progressBar;
