/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_weaponClass', '_result'];
_weaponClass = _this select 0;
_result = '';

_result = getArray (configFile >> "CfgWeapons" >> _weaponClass >> "magazines");
_result = _result select 0;
_result;