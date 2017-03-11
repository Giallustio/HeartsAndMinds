
private _faction_list = if ((_this select 0) isEqualTo "CIV") then {[3]} else {[0,1,2]};

// Get all faction from mod there are currently running
private _allfaction = (("true" configClasses (configFile >> "CfgFactionClasses")) apply {configName _x}) select {
	getNumber(configfile >> "CfgFactionClasses" >> _x >> "side") in _faction_list
};

_allfaction = _allfaction apply {
	private _mod_folder = getText(configfile >> "CfgFactionClasses" >> _x >> "icon") select [if ((getText(configfile >> "CfgFactionClasses" >> _x >> "icon") select [0,1]) isEqualTo "\") then {1} else {0}];
	private _mod = _mod_folder select [0, _mod_folder find "\"];
	if (_mod isEqualTo "") then {
		_mod = _x select [0, _x find "_"];
	};
	/*if (_mod isEqualTo "a3") then {
		private _modcheck = _x select [0, _x find "_"];
		if !(_modcheck isEqualTo _mod) then {
			_mod = _modcheck;
		};
	};*/
	[
		_mod
		, _x
	]
};

_allfaction sort true;
private _texts = _allfaction apply {Format ["%3: %1 (Side: %2)", getText(configfile >> "CfgFactionClasses" >> _x select 1 >> "displayName"), [East,West,Independent,Civilian] select getNumber(configfile >> "CfgFactionClasses" >>  _x select 1 >> "side") , toUpper(_x select 0)]};
private _allmod = [];
{_allmod pushBackUnique _x} forEach (_allfaction apply {_x select 0});
_allfaction = _allfaction apply {_x select 1};
private _values = [];
for "_i" from 0 to (count _allfaction) - 1 do {
	_values pushBack _i;
};

[_allmod,_texts,_allfaction,_values]