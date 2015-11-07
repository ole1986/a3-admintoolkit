/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
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
	['AdminHelper_network_receiveRequest', 'adminhelper\code\AdminHelper_network_receiveRequest.sqf']
];

diag_log "[ADMINHELPER] Initializing";

true