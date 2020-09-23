
/* ----------------------------------------------------------------------------
Function: btc_fnc_tag_eh

Description:
    Store texture for city de_activation, check if player try to remove a tag or store player tag to database.

Parameters:
    _tag - Tag. [Object]
    _texture - Texture of the tag. [String]
    _object - Object where the tag is draw. [Object]
    _unit - Unit tagging. [Object]

Returns:

Examples:

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params ["_tag", "_texture", "_object", "_unit"];

if (_tag isKindOf "Graffiti_base_F") then {
    _tag setVariable ["btc_texture", _texture]; //Store texture for city de_activation
} else {
    if (_texture isEqualTo "#(rgb,8,8,3)color(0,0,0,0)") then { //Check if player want to remove a tag
        private _tags = (allSimpleObjects btc_type_blacklist) inAreaArray [getPosWorld _tag, 3, 3];
        if (count _tags > 1) then {
            _tags = _tags apply {[_x distance _tag, _x]};
            _tags sort true;
            if ((_tags select 1 select 1) isKindOf "Graffiti_base_F") then {
                [btc_rep_bonus_removeTag, _unit] call btc_fnc_rep_change;
            };
            deleteVehicle (_tags select 1 select 1);
        };
        deleteVehicle _tag;
    } else { //Store tag for database
        btc_tags pushBack [_tag, _texture, _object];
    };
};