/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_action'];

private _result = true;
private _permissionSet = missionNamespace getVariable ['AdminToolkit_permissionSet', []];

if((count _permissionSet > 0) && !(_action in _permissionSet)) then {
  _result = false;
};

_result;