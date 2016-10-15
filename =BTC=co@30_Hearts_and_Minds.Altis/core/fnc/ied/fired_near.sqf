
private ["_pos","_range","_bomb","_bomb_check","_array","_list","_ied","_explosive","_caliber","_wreck"];

_wreck = _this select 0;
_ied = _this select 1;
_pos = getPos _ied;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 0.5];
_range = 2;

_bomb_check =
{
	_ied = _this select 0;
	_bomb = _this select 1;
	_wreck = _this select 2;
	_bomb setVariable ["bullet_check",true];
	waitUntil {!Alive _bomb};
	if (Alive _ied) then {[_wreck,_ied] spawn btc_fnc_ied_boom;};
};

_array = [];

while {alive _ied && !isNull _ied} do
{
	_list = _pos nearObjects ["Default",_range];
	if (count _list > 0) then
	{
		{
			private ["_bullet","_b"];
			_b = _x;
			_bullet = typeOf _b;
			if ({_bullet isKindOf _x} count ["SmokeShell", "FlareCore", "IRStrobeBase", "GrenadeHand_stone", "Smoke_120mm_AMOS_White", "TMR_R_DG32V_F"] > 0) exitWith {};
			if ({_bullet isKindOf _x} count ["TimeBombCore","BombCore", "Grenade"] > 0) then
			{
				if !(_b in _array) then
				{
					_array pushBack _b;
					[_ied,_b,_wreck] spawn _bomb_check;
				};
			}
			else
			{
				_explosive = (getNumber(configFile >> "cfgAmmo" >> _bullet >> "explosive") > 0);
				_caliber = getNumber(configFile >> "CfgAmmo" >> _bullet >> "caliber");
				if (_explosive || _caliber > 1.6) then {if (Alive _ied) then {[_wreck,_ied] spawn btc_fnc_ied_boom;};};
			};
		} foreach _list;
	};
    sleep 0.01;
};