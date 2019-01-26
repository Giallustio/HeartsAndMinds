
/* ----------------------------------------------------------------------------
Function: btc_fnc_get_composition

Description:
    Get a composition of objects around a position.

Parameters:
    _pos - Position to get a composition. [Array]
    _radius - Radius of the composition. [Number]

Returns:
    _composition - Array of the corresponding composition. [Array]

Examples:
    (begin example)
        copyToClipboard str ([position player] call btc_fnc_get_composition);
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_position", [0, 0, 0], [[]]],
    ["_radius", 100, [0]]
];

private _objs = (nearestObjects [_position, ["All"], _radius]) select {!(isObjectHidden _x) && !(_x isKindOf "Man")};

_position params ["_center_xx", "_center_yy", "_center_zz"];

_objs apply {
    private _objPos = position _x;
    _objPos params ["_xx", "_yy", "_zz"];
    private _relative_pos = [
        _xx - _center_xx,
        _yy - _center_yy,
        _zz - _center_zz
    ];

    [
        typeOf _x,
        getDir _x,
        _relative_pos
    ]
};
