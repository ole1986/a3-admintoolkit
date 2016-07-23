/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_display', '_index', '_command'];
disableSerialization;
_display = findDisplay 40000;

_index = lbCurSel RscAdminToolkitActionMenu_IDC;
_command = lbData [ RscAdminToolkitActionMenu_IDC, _index];

[_command] call AdminToolkit_doAction;

true;