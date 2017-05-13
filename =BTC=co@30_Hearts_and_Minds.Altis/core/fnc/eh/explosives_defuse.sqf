
params ["_ied", "_unit"];
private _type_ied = typeOf _ied;
if ((_type_ied select [0, _type_ied find "_"]) in (btc_type_ieds_ace apply {_x select [0, _x find "_"]})) then {
	btc_rep_bonus_disarm call btc_fnc_rep_change;
};