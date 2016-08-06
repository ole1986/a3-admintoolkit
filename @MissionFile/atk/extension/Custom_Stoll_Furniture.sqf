/**
 * AdminToolkit
 * 
 * Author: Stoll
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_result'];
disableSerialization;

_result = "(getText(_x >> 'vehicleClass') in ['Furniture','Structures','Tents','Cargo','Dead_bodies','Market','Small_items','Fortifications','Signs']) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
_result;