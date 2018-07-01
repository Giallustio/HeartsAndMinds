
private _idc = 778;
private _fob = lbText [_idc, lbCurSel _idc];

if (_fob isEqualTo "Base") then {_fob = btc_respawn_marker;};

mapAnimAdd [0.5, 0.2, getMarkerPos _fob];
mapAnimCommit;
