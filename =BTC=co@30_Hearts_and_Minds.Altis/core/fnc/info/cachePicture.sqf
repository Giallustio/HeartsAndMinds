
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_cachePicture

Description:
    Add picture to the diary.

Parameters:
    _classname_object - Classe name of the object to show. [String]
    _cache_n - Number of the current cache. [Number]
    _is_building_with_the_cache - Is the building with the cache inside. [Boolean]

Returns:

Examples:
    (begin example)
        [typeOf player, 0] call btc_fnc_info_cachePicture;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_classname_object", "", [""]],
    ["_cache_n", -1, [-1]],
    ["_is_building_with_the_cache", true, [true]]
];

if !(player diarySubjectExists "btc_diarylog") then {
    player createDiarySubject ["btc_diarylog", "Intel pictures"];
};

private _string = if (_is_building_with_the_cache) then {
    "We got a picture of the building where the cache is:<br/> <img size='3' image='%1' align='center'/>"
} else {
    "We got a picture of something around the cache:<br/> <img size='3' image='%1' align='center'/>"
};

player createDiaryRecord [
    "btc_diarylog",
    [
        format ["Cache number %1", _cache_n],
        format [_string, getText (configfile >> "CfgVehicles" >> _classname_object >> "editorPreview")]
    ]
];
