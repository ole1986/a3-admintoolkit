/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_display','_index','_text', '_value'];
_display = findDisplay 40000;

_index = lbCurSel RscAdminToolkitActionList_IDC;
_text = lbText [RscAdminToolkitActionList_IDC, _index];
_value = lbData [RscAdminToolkitActionList_IDC, _index];

AdminToolkit_Action = _value;

// hide the parameters edit field by default
(_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow false;

(_display displayCtrl RscAdminToolkitRun_IDC) ctrlShow true;
(_display displayCtrl RscAdminToolkitRepeat_IDC) ctrlShow true;

(_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "";
(_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "";

switch (_value) do {
    case 'message': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter some message below:</t>";
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player as recipient</t>";
        // show the parameters edit field
        (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
    };
    case 'messageall': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter message (sent to all)</t>";
        // show the parameters edit field
        (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
    };
    case 'tp2player': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player to want to teleport to</t>";
    };
    case 'tpplayer': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player to teleport here</t>";
    };
    case 'giveammo': {
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player you want to give ammo/t>";
    };
    case 'specplayer': {
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player you want to spectate</t>";
    };
    case 'godmodeon': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>IMPORTANT: Godmode works only for you</t>";
    };
    case 'godmodeoff': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>IMPORTANT: Godmode works only for you</t>";
    };
    case 'buildremove';
    case 'givevehicle': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Temporary offline</t>";
        (_display displayCtrl RscAdminToolkitRun_IDC) ctrlShow false;
        (_display displayCtrl RscAdminToolkitRepeat_IDC) ctrlShow false;
    };       
};

call AdminToolkit_loadDetails;