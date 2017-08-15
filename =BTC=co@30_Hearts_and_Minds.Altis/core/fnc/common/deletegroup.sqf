
//Check group locality
if (local (_this select 0)) then {
	deleteGroup (_this select 0);
} else {
	//DeleteGroup where is local
	(_this select 0) remoteExec ["deleteGroup", groupOwner (_this select 0)];
};