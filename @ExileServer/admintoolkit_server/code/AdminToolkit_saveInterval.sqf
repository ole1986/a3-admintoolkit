/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_interval', '_result'];

_interval = _this select 0;

while { true } do {
    sleep _interval;
    
    _result = ['BUILDINGS', false] call AdminToolkit_loadPersistent;
    
    // save buildings into server profile
    diag_log "[ADMINTOOLKIT-DEBUG] saveInterval: Save buildings...";
    profileNamespace setVariable [format["ATK_PERSISTENT_%1", 'BUILDINGS'], _result]; 
    
    saveProfileNamespace;
};