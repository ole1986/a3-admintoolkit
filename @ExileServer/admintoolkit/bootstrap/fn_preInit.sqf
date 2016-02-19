/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
	
    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['AdminToolkit_network_receiveRequest', 'admintoolkit\code\AdminToolkit_network_receiveRequest.sqf'],
	['AdminToolkit_network_fetchPlayer', 'admintoolkit\code\AdminToolkit_network_fetchPlayer.sqf']
];

diag_log "[ADMINTOOLKIT] Initializing";

true