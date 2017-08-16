/**
 * AdminToolkit
 * 
 * Author: Stoll
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_result'];
disableSerialization;

{
    _x call AdminToolkit_addAction;
} forEach [
    ["Build (temporary)", 'build'],
    ["Build (persistent)", 'buildpers'],
    ["Remove", "buildremove"],
    ["Status", 'buildinfopersistent'],
    ["Save Persistent", 'savepersistent'],
    ["Clear Persistent", 'clearpersistent']
];

_result = "(getText(_x >> 'vehicleClass') in ['Furniture','Structures','Tents','Cargo','Dead_bodies','Market','Small_items','Fortifications','Signs']) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
_result;