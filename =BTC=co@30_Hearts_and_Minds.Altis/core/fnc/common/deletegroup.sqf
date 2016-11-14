
if (local (_this select 0)) then {
	deleteGroup (_this select 0);
} else {
	[(_this select 0), {deleteGroup _this}] remoteExec ["call", groupOwner (_this select 0)];
};