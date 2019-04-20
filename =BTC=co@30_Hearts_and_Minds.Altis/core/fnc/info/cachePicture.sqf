
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_cachePicture

Description:
    Fill me when you edit me !

Parameters:
    _position - Position of the cahce. [Array]
    _radius - Radius of the indication. [Number]

Returns:

Examples:
    (begin example)
        [typeOf player] call btc_fnc_info_cachePicture;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_classname_object", "", [""]],
    ["_cache_n", -1, [-1]],
    ["_is_building_with_the_cache", true, [true]]
];

if !(player diarySubjectExists "btc_cache_pictures") then {
    player createDiarySubject ["btc_cache_pictures", "Intel pictures"];
};

private _string = if (_is_building_with_the_cache) then {
    "We got a picture of the building where the cache is.<br/> <img size='5' image='%1' align='center'/>"
} else {
    "We got a picture of something around the cache.<br/> <img size='5' image='%1' align='center'/>"
};

player createDiaryRecord [
    "btc_cache_pictures",
    [
        format ["Cache %1", _cache_n],
        format [_string, getText (configfile >> "CfgVehicles" >> _classname_object >> "editorPreview")]
    ]
];
