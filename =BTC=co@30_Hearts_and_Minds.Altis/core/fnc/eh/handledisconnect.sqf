
if ((_this select 0) in (entities "HeadlessClient_F")) then 	{
	//Remove HC player when disconnect
	deleteVehicle (_this select 0);
};