params ["_group"];

//Check group locality
if (local _group) then {
    deleteGroup _group;
} else {
    //DeleteGroup where is local
    _group remoteExec ["deleteGroup", groupOwner _group];
};
