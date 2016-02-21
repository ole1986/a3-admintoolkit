/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_canceled'];

_canceled = _this select 0;

if !(isNil "_canceled") then {
    AdminToolkitIsBuilding = -1;
} else {
    AdminToolkitIsBuilding = 0;
};