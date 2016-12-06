/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_action', '_permissionSet', '_result'];
_action = _this select 0;

_result = true;
_permissionSet = missionNamespace getVariable ['AdminToolkit_permissionSet', []];

if((count _permissionSet > 0) && !(_action in _permissionSet)) then {
  _result = false;
};

_result;