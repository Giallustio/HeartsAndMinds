
private ["_idc","_fob"];

_idc = 778;

_fob = lbText [_idc, lbCurSel _idc];

if (_fob == "Base") then {_fob = btc_respawn_marker;};

mapAnimAdd [0.5, 0.2, (getMarkerPos _fob)]; mapAnimCommit;