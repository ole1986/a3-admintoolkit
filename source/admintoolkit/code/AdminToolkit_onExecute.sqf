private['_command', '_index','_codeStr'];
disableSerialization;

if(count _this > 0) then {
    _codeStr = format["AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC; [] call %2", _command, _this select 0];
} else {
    _codeStr = "AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC; [] call AdminToolkit_doAction";
};

buttonSetAction [RscAdminToolkitExecute_IDC, _codeStr];
// allow user to execute action using dbl-click
((findDisplay 40000) displayCtrl RscAdminToolkitActionMenu_IDC) ctrlSetEventHandler ["LBDblClick",_codeStr];