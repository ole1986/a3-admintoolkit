/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_result'];
disableSerialization;

_result = "(getText(_x >> 'vehicleClass') in ['Furniture', 'Structures']) and (getNumber(_x >> 'scope') > 0)" configClasses (configFile>>"CfgVehicles");
_result;