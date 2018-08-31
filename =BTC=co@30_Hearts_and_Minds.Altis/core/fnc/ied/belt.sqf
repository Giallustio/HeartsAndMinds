
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_belt

Description:
    Fill me when you edit me !

Parameters:
    _expl1 - [Object]
    _expl2 - [Object]
    _expl3 - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_belt;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_expl1", objNull, [objNull]],
    ["_expl2", objNull, [objNull]],
    ["_expl3", objNull, [objNull]]
];

_expl1 setVectorDirAndUp [[0.5, 0.5, 0], [-0.5, 0.5, 0]];
_expl2 setVectorDirAndUp [[1, 0, 0], [0, 1, 0]];
_expl3 setVectorDirAndUp [[0.5, -0.5, 0], [0.5, 0.5, 0]];
