
closeDialog 0;

_obj = _this;

player setVariable ["btc_int_busy",true];
player setVariable ["btc_log_isDragging",true];
player setVariable ["btc_log_attached",_obj];

player playMoveNow "AcinPknlMstpSrasWrflDnon";

_obj attachto [player,[0,2,0.2]];

WaitUntil {!Alive player || ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))};

_id = player addAction [("<t color=""#ED2744"">") + "Release" + "</t>",{player setVariable ["btc_log_isDragging",false];},[],9,true,false];

while {!isNull player && !(player getVariable ["btc_rev_isUnc",false]) && alive player && !isNull _obj && alive _obj && player getVariable ["btc_log_isDragging",true]} do
{
	if (stance player == "PRONE") then {player setVariable ["btc_log_isDragging",false];};
	sleep 0.1;
};

player removeAction _id;
if (player getVariable ["btc_rev_isUnc",false]) then {player switchMove "AinjPpneMstpSnonWrflDnon";};

sleep 0.1;

if (stance player != "PRONE" && Alive player) then 
{
	player switchMove "AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon";
	sleep 1.3;
	//player playActionNow "PlayerCrouch";
	switch (true) do
	{
		case (currentWeapon player == primaryWeapon player) : {player switchMove "";sleep 0.1;player switchMove "amovpknlmstpsraswrfldnon";};
		case (currentWeapon player == handgunWeapon player) : {player switchMove "";sleep 0.1;player switchMove "amovpknlmstpsraswpstdnon";};
		default {player switchMove "";sleep 0.1;player switchMove "amovpknlmstpsnonwnondnon";};
	};
};

player setVariable ["btc_int_busy",false];
player setVariable ["btc_log_isDragging",false];
player setVariable ["btc_log_attached",objNull];

detach _obj;