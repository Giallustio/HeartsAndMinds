_type = _this select 0;
_target = _this select 1;


switch (_type) do
{
	case 0 : {_target setDir 180;};
	case 1 : 
	{
		_this spawn
		{
			_injured = _this select 1;
			_healer  = _this select 2;
			_injured setPos (_healer modelToWorld [0,1,0]);
			_injured switchMove "AinjPfalMstpSnonWnonDnon_carried_up";
		};
	};
	case 2 : {if (vehicle _target != _target) exitWith {};_target spawn {_this switchMove "AinjPfalMstpSnonWrflDnon_carried_down";sleep 5;if (_this getVariable ["btc_rev_isUnc",false]) then {_this switchMove "AinjPpneMstpSnonWrflDnon";};};};
	case 3 : {_target switchMove "";_target moveInCargo (_this select 2)};
	case 4 : {unAssignVehicle _target;_target action ["eject", vehicle _target];_target spawn {sleep 0.5;_this switchMove "ainjppnemstpsnonwrfldnon";};};
};