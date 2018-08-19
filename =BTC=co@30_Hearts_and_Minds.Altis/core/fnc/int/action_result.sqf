
params ["_totalTime", "_args", "_onFinish", "_onFail", ["_localizedTitle", ""]];
_args params ["_target"];

private _radius = 7;
if (_target isKindOf "Man") then {_radius = 4;};
if (_target isKindOf "Helicopter") then {_radius = 20;};

_args pushBack _radius;

_condition = {
    params ["_args"];
    _args params ["_target", "_player"];
    _target distance _player < (_args select ((count _args) - 1))
};

[_totalTime, _args, _onFinish, _onFail, _localizedTitle, _condition, ["isnotinside"]] call ace_common_fnc_progressBar;
