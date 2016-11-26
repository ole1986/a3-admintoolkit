/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

diag_log "[ADMINTOOLKIT] Loading 'BUILDINGS'..";
AdminToolkit_Buildings = ['BUILDINGS', true] call AdminToolkit_loadProfile;
AdminToolkit_IsPersistentSaved = true;

diag_log "[ADMINTOOLKIT] loaded successfully";

// run the mission file "atk\init.sqf" when player connects 
["atkPlayerConnected", "onPlayerConnected", {
    { execVM "atk\system\init.sqf"; } remoteExecCall ["call", _owner]; 
}] call BIS_fnc_addStackedEventHandler;

true;