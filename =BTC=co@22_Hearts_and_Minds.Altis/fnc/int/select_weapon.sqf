_key = _this;

_c_w = currentWeapon player;

switch (_key) do
{
	case 2 : 
	{
		private ["_p_w"];
		_p_w = primaryWeapon player;
		if (_c_w == _p_w || _p_w == "") exitWith {};
		player selectWeapon _p_w;
	};
	case 3 : 
	{
		private ["_p_w"];
		_h_w = handgunWeapon player;
		if (_c_w == _h_w || _h_w == "") exitWith {};
		player selectWeapon _h_w;
	};
	case 4 : 
	{
		private ["_p_w"];
		_s_w = secondaryWeapon player;
		if (_c_w == _s_w || _s_w == "") exitWith {};
		player selectWeapon _s_w;
	};
};