/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_weaponClass'];
private _result = '';

_result = getArray (configFile >> "CfgWeapons" >> _weaponClass >> "magazines");
_result select 0;