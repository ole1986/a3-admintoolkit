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
AdminToolkit_GodPlayers = [];

diag_log "[ADMINTOOLKIT] loaded successfully";

// lets add a banner to notify connecting player about ATK
addMissionEventHandler ["PlayerConnected", {
    // _this = [1.81782e+08,_uid,_name, bool, _owner]"
    [_this select 4, "", "This server is using the AdminToolkit", "for further info please visit github.com/ole1986/a3-admintoolkit", 30] call AdminToolkit_showAAN;
}];

[] spawn AdminToolkit_godLoop;
diag_log "[ADMINTOOLKIT] God loop initialized";

true;