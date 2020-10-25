
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_init_area

Description:
    Initialize positions of tags.

Parameters:
    _city - City to initialise. [Object]
    _area - Area to create IED. [Number]
    _n - Number of IED, real and fake. [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_tag_initArea;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]],
    ["_area", 100, [0]],
    ["_type", "Hill", [""]],
    ["_has_en", false, [true]],
    ["_has_ho", false, [true]]
];

private _array = _city getVariable ["data_tags", []];
if (_array isEqualTo []) then {
    private _n = (switch _type do {
        case "Hill" : {random 1};
        case "NameLocal" : {random 2.5};
        case "NameVillage" : {random 3.5};
        case "NameCity" : {random 5};
        case "NameCityCapital" : {random 6};
        case "Airport" : {random 6};
        case "NameMarine" : {0};
    });

    if (_has_en) then {
        _n = _n * 1.5;
    };
    if (_has_ho) then {
        _n = _n * 2;
    };

    private _roads = _city nearRoads 50;
    private _road = if (_roads isEqualTo []) then {
        objNull
    } else {
        selectRandom _roads
    };
    for "_i" from 1 to (_n * 1.5) do {
        private _sel_pos = [_city, _area] call CBA_fnc_randPos;
        if !(surfaceIsWater _sel_pos) then {
            if (isNil "_road" || {isNull _road}) then {
                private _roads = _sel_pos nearRoads 50;
                if !(_roads isEqualTo []) then {
                    _road = selectRandom _roads;
                };
            } else {
                private _arr = [_road, -1] call btc_fnc_ied_randomRoadPos;
                _sel_pos = _arr select 0;
                private _connected = roadsConnectedTo _road;
                if (_connected isEqualTo []) then {
                    _road = objNull;
                } else {
                    _road = _connected select selectRandomWeighted [0, 0.6, (count _connected) - 1, 0.4];
                };
            };

            private _surface = surfaceNormal _sel_pos;
            private _v1 = vectorNormalized (_surface vectorMultiply -1);
            private _v3 = _v1 vectorCrossProduct [0, 0, 1];
            private _v2 = _v3 vectorCrossProduct _v1;
            if (_v2 isEqualTo [0, 0, 0]) then {
                _v2 = [0, 1, 0];
            };

            _sel_pos set [2, 0];
            _array pushBack [_sel_pos, [_v1, _v2], "a3\structures_f_epb\civ\graffiti\data\graffiti_ca.paa", selectRandom btc_type_tags];

            if (btc_debug) then {
                private _marker = createMarker [format ["btc_tag_%1", _sel_pos], _sel_pos];
                _marker setMarkerType "mil_dot";
                _marker setMarkerColor "ColorGreen";
                _marker setMarkerText "Tag";
                _marker setMarkerSize [0.8, 0.8];
            };
        };
    };
    _city setVariable ["data_tags", _array];
};

{
    _x params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_tagModel"];

    [AGLToASL _tagPosASL, _vectorDirAndUp, _texture, objNull, objNull, "", _tagModel] call ace_tagging_fnc_createTag;
} forEach _array;
