/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_playerObject','_request', '_params'];

private _object = objNull;
private _tmp = '';
private _result = true;

if(isNil "VanillaAI_Units") then {  missionNamespace setVariable["VanillaAI_Units", []] };

try 
{
    switch (_request) do {
		case 'vai_enemy': 
		{
			if(isNil "VanillaAI_EnemyGroup") then {
				VanillaAI_EnemyGroup = creategroup east;
			};
			"O_G_Soldier_F" createUnit [position _playerObject, VanillaAI_EnemyGroup, "VanillaAI_Units pushBack (netId this);", 0.1];
			_playerObject spawn { sleep 1; (owner _this) publicVariableClient 'VanillaAI_Units'; };		
		};
		case 'vai_friend': 
		{
			"O_G_Soldier_F" createUnit [position _playerObject, group _playerObject, "VanillaAI_Units pushBack (netId this);"];
			_playerObject spawn { sleep 1; (owner _this) publicVariableClient 'VanillaAI_Units'; };
		};
		case 'vai_delete': 
		{
			_object = objectFromNetId _params;
			_tmp = VanillaAI_Units find _params;
			deleteVehicle _object;
			if (_tmp >= 0 ) then { VanillaAI_Units deleteAt _tmp; };
			_playerObject spawn { sleep 1; (owner _this) publicVariableClient 'VanillaAI_Units'; };
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT-MOD]: EXCEPTION: %1", _exception];
};

_result;
