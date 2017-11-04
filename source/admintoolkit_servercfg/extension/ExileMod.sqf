/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_playerObject','_request', '_params'];

private _result = true;
private _position = [];
private _tmp = '';
private _tmp2 = '';
private _object = objNull;

try
{
    switch (_request) do {
		case 'exile_getvehicle': 
		{
			// _params = <string> - vehicle class name
			// pin code
			_tmp2 = format["%1%2%3%4",floor random 10, floor random 10, floor random 10, floor random 10];
			_position = (getPos _playerObject) findEmptyPosition [10, 175, _params];
			
			if (_position isEqualTo []) then 
			{
				throw 13;
			};
			
			_object = [_params, _position, (random 360), true, _tmp2] call ExileServer_object_vehicle_createPersistentVehicle;
			_object setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
			_object setVariable ["ExileIsLocked",0];
			_object setVariable ["ExileAccessCode", _tmp2];
			_object lock 0;
			_object call ExileServer_object_vehicle_database_insert;
			_object call ExileServer_object_vehicle_database_update;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 Spawned!", _params]  ]]] call ExileServer_system_network_send_to;
			[_playerObject, "dynamicTextRequest", [format ["UNLOCK PIN: %1", _tmp2], 0, 2, "#ffffff"]] call ExileServer_system_network_send_to;
		};
		case 'exile_setvehiclepin': {
			_object = objectFromNetId (_params select 0);
			_tmp = _params select 1;
			
			_object setVariable ["ExileAccessCode",_tmp];
			[_playerObject, "resetCodeResponse", [["SuccessTitleOnly", ["PIN changed successfully!"]], netId _object,_tmp]] call ExileServer_system_network_send_to;
			[_object,_tmp] call ExileServer_object_vehicle_database_resetCode;
		};
		case 'exile_repvehicle':
		{
			_object = objectFromNetId _params;
			_object setDamage 0;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 Repaired!", _params]  ]]] call ExileServer_system_network_send_to;
		};
		case 'exile_destvehicle':
		{
			_object = objectFromNetId _params;
			_object setDamage 100;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 Destroyed!", _params]  ]]] call ExileServer_system_network_send_to;	
		};
		case 'exile_delvehicle':
		{
			_object = objectFromNetId _params;
			// _params =vehicle class name
			_object call ExileServer_object_vehicle_remove;
			deleteVehicle _object;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 Deleted!", _params]  ]]] call ExileServer_system_network_send_to;	
		};
		case 'exile_getheal':
		{
			_playerObject setDamage 0;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 healed!", _playerObject]  ]]] call ExileServer_system_network_send_to;	
		};
		case 'exile_kill':
		{
			_playerObject setDamage 100;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["%1 killed!", _playerObject]  ]]] call ExileServer_system_network_send_to;	
		};
		case 'exile_getmoney': 
		{
			// _params = <number> - the amount to be transferred
			_tmp = _params;
			_tmp2 = _playerObject getVariable ["ExileMoney", 0];
			_tmp2 = _tmp2 + _tmp;
			_playerObject setVariable ["ExileMoney", _tmp2, true];
			format["setPlayerMoney:%1:%2", _tmp2, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["Money %1 added!", _tmp]  ]]] call ExileServer_system_network_send_to;
			[_playerObject, "lockerResponse", []] call ExileServer_system_network_send_to;
		};
		case 'exile_getscore':
		{
			// _params = <number> - the amount to be transferred
			_tmp = _playerObject getVariable ["ExileScore", 0];
			_tmp = floor (_tmp + _params);
			_playerObject setVariable ["ExileScore", _tmp];
			
			format["setAccountScore:%1:%2", _tmp, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
			[_playerObject, "freeResponse", [str _params]] call ExileServer_system_network_send_to;
		};
		case 'exile_sendmoney': {
			_object = objectFromNetId (_params select 0);
			_tmp = _object getVariable ["ExileMoney", 0];
			_tmp = floor (_tmp + (_params select 1));

			_object setVariable ["ExileMoney", _tmp, true];

			format["setPlayerMoney:%1:%2", _tmp, _object getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["Money sent to %1", name _object]  ]]] call ExileServer_system_network_send_to;
			[_object, "lockerResponse", []] call ExileServer_system_network_send_to;
		};
		case 'exile_sendscore': {
			_object = objectFromNetId (_params select 0);
			_tmp = _object getVariable ["ExileScore", 0];
			_tmp = floor (_tmp + (_params select 1));

			_object setVariable ["ExileScore", _tmp, true];
			
			format["setAccountScore:%1:%2", _tmp, (getPlayerUID _object)] call ExileServer_system_database_query_fireAndForget;
			[_playerObject, "toastRequest", ["SuccessTitleOnly", [format["Respect sent to %1", name _object]  ]]] call ExileServer_system_network_send_to;
			[_object, "freeResponse", [str (_params select 1)]] call ExileServer_system_network_send_to;
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT-MOD]: EXCEPTION: %1", _exception];
};

_result;
