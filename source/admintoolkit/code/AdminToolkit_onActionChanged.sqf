/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

/**
 * _control CONTROL the listbox
 * _index NUMBER the current selected index of the listbox
 */
params['_control', '_index'];
private _display = findDisplay 40000;

private _text = lbText [RscAdminToolkitActionList_IDC, _index];
private _value = lbData [RscAdminToolkitActionList_IDC, _index];

if(_index < 0) exitWith {};

AdminToolkit_Action = _value;
AdminToolkit_Detail = _value;
AdminToolkit_Params = [];

// hide the parameters edit field by default
(_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow false;
(_display displayCtrl RscAdminToolkitParam_IDC) ctrlSetText "";

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
    case 'messageperm';
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
    case 'givevehicle': {
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Step 1: Select vehicle</t>";
    };
    case 'build': {
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select a building</t>";
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Tempoary buildings are gone after server restart</t>";
    };
    case 'buildpers': {
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select a building</t>";
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>These buildings are stored in serverProfie</t>";
    };
    case 'buildremove': {       
        (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select a nearby building</t>";
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>PLEASE NOTE: Map related objects cannot be removed</t>";
    };
    case 'buildinfopersistent': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Show information about persistent buildings</t>";
    };
    case 'savepersistent': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Stores the buildings to keep after server restart</t>";
    };
    case 'clearpersistent': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>THIS WILL REMOVE ALL PERSISTENT BUILDINGS FROM ATK</t>";
    };
};

call AdminToolkit_loadDetails;