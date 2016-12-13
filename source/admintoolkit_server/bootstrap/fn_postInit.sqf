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
// onPlayerConnected AND BIS_fnc_addStackedEventHandler FAILED
// So, let us use the addMissionEventHandler
addMissionEventHandler ["PlayerConnected", {
    // _this = [1.81782e+08,_uid,_name, bool, _owner]"
        {execVM "atk\system\init.sqf"; } remoteExecCall ["call", _this select 4];
    }
];

true;