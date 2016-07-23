/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_title', '_command', '_index'];
disableSerialization;

_title = _this select 0;
_command = _this select 1;

_index = lbAdd [RscAdminToolkitActionMenu_IDC, _title];
lbSetData [RscAdminToolkitActionMenu_IDC, _index, _command];
_index;