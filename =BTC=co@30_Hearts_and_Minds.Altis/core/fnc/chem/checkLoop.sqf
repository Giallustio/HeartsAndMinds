
/* ----------------------------------------------------------------------------
Function: btc_fnc_chem_checkLoop

Description:
    Loop over chemical objects and check if player is around. If yes, set damage to player. Then propagate the contamination if player get in vehicle or contaminated objets are loaded to vehicle.

Parameters:
    _list - List in the chemical system. [Object]
    _ieds - All IED (even FACK IED). [Array]
    _bodyParts - Body parts to damage. [Array]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_chem_checkLoop;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

private _bodyParts = ["head","body","hand_l","hand_r","leg_l","leg_r"];

[{
    params ["_args", "_id"];
    _args params ["_contaminated", "_decontaminate", "_range", "_bodyParts", "_cfgGlasses"];

    if (_contaminated isEqualTo [] && _decontaminate isEqualTo []) exitWith {};

    private _objtToDecontaminate = [];
    {
        private _bbr = 0 boundingBoxReal _x;
        private _p1 = _bbr select 0;
        private _p2 = _bbr select 1;
        private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
        private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
        _objtToDecontaminate append (_contaminated inAreaArray [getPosWorld _x, _maxWidth/2, _maxLength/2, getDir _x, true]);
    } forEach (_decontaminate select {_x animationSourcePhase "valve_source" isEqualTo 1});
    {
        _contaminated deleteAt (_contaminated find _x);
    } forEach _objtToDecontaminate;

    if (_contaminated isEqualTo []) exitWith {};

    private _unitContaminate = [];
    private _units = allUnits;
    {
        if (_x in _units) then {
            _range = _range / 2;
        };
        _unitContaminate append (_units inAreaArray [getPosWorld _x, _range, _range]);
    } forEach _contaminated;
    {
        if !(
            (
                goggles _x isKindOf ["G_RegulatorMask_base_F", _cfgGlasses] ||
                goggles _x isKindOf ["G_AirPurifyingRespirator_01_base_F", _cfgGlasses]
            ) && (
                backpack _x isKindOf "B_SCBA_01_base_F" ||
                backpack _x isKindOf "B_CombinationUnitRespirator_01_Base_F"
            ) &&
            uniform _x find "CBRN" > -1
        ) then {
            [_x, random [0.05, 0.1, 0.1], selectRandom _bodyParts, "stab"] call ace_medical_fnc_addDamageToUnit; // ropeburn
        };
    } forEach _unitContaminate;

    // Propagate contamimation from ACE Cargo or passenger seat to vehicle
    private _toContaminate = (_contaminated select {isObjectHidden _x}) apply {attachedTo _x};
    _toContaminate append _unitContaminate;
    {
        _contaminated pushBackUnique vehicle _x;
    } forEach _toContaminate;
}, 1, [btc_chem_contaminated, btc_chem_decontaminate, 3, _bodyParts, configFile >> "CfgGlasses"]] call CBA_fnc_addPerFrameHandler;
