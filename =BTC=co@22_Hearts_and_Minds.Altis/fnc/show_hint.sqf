if (isDedicated) exitWith {};

_type  = _this select 0;

if (BTC_debug_log) then
{
	diag_log format ["BTC_fnc_server_execute: _this = %1",_this];
};	

switch (_type) do
{
	case 0 :
	{
		hint "Cache destroyed!";
	};
	case 1 :
	{
		hint "Intel about an ammo cache found! Map updated";
	};
	case 2 :
	{
		hint format ["Hideout destroyed! %1 remaining",(_this select 1)];
	};
	case 3 :
	{
		hint "This body does not have any intel";
	};
	case 4 :
	{
		hint "Found intels about an ammo cache and an hideout! Map updated";
	};
	case 5 :
	{
		hint "Intel about an hideout found! Map updated";
	};
	case 6 :
	{
		hint "In the last hideout we found important intel about all the cities occupied by the Oplitas! Size the last positions held by the enemies and defeat them once and for all";
	};
	case 7 :
	{
		hint ((_this select 1) + " has been deployed!");
	};
};