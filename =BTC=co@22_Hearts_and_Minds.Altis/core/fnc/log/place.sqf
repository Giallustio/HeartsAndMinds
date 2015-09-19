
closeDialog 0;

btc_log_place_obj = _this;
btc_log_place_camera = objNull;
btc_log_place_end = false;
btc_log_place_camera_cond = false;
btc_log_place_camera_created = false;
btc_log_place_camera_nvg = false;
btc_log_place_camera_EH_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "_keydown = _this spawn btc_fnc_log_place_key_down"];
btc_log_place_central_pos = getposATL btc_log_place_obj;
btc_log_place_cam_rel_pos = [0,-6,15];
btc_log_place_obj enableSimulation false;
btc_log_place_obj allowdamage false;

[btc_log_place_obj] call btc_fnc_log_place_create_camera;

while {!btc_log_place_end && Alive player} do
{
	if (!btc_log_place_camera_cond) then {player playMoveNow "amovpercmstpsraswrfldnon";};
	if (btc_log_place_camera_cond && !btc_log_place_camera_created) then {[btc_log_place_obj] call btc_fnc_log_place_create_camera;};
	if (!btc_log_place_camera_cond && btc_log_place_camera_created) then {[btc_log_place_obj] call btc_fnc_log_place_destroy_camera;};
	if (btc_log_place_camera_nvg) then {camusenvg true;} else {camusenvg false;};
	btc_log_place_camera camSetPos (btc_log_place_obj modelToWorld btc_log_place_cam_rel_pos);
	btc_log_place_camera camCommit 0;
	hintSilent parseText "Keys:<br/>W to move the object towards Nord<br/>A to move the object towards West<br/>S to move the object towards South<br/>D to move the object towards East<br/>Q and Z to modify the elevation<br/>Shift to move the object faster<br/>ALT + A/D to modify the direction<br/>C to open/close the camera<br/>CTRL + WASDQZ to move the camera<br/>N to use the nightvision<br/>Back to get back to the game";
	sleep 0.01;
};

btc_log_place_obj enableSimulation true;
btc_log_place_obj allowdamage true;
btc_log_place_obj = objNull;
hintSilent "";titleText ["", "PLAIN"];
if (btc_log_place_camera_cond) then {_cam = [btc_log_place_obj] spawn btc_fnc_log_place_destroy_camera;};
(findDisplay 46) displayRemoveEventHandler ["KeyDown",btc_log_place_camera_EH_keydown];
