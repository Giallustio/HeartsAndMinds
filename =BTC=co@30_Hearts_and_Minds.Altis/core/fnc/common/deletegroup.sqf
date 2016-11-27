
//Check group locality
if (local (_this select 0)) then {
	deleteGroup (_this select 0);
} else {
	//DeleteGroup where is local
	[(_this select 0), {deleteGroup _this}] remoteExec ["call", groupOwner (_this select 0)];
};