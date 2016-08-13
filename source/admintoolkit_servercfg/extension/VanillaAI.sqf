/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_playerObject','_request', '_params', '_object', '_tmp'];
_playerObject = _this select 0;
_request = _this select 1;
_params = _this select 2;

if(isNil "VanillaAI_Units") then {  missionNamespace setVariable["VanillaAI_Units", []] };

_result = true;
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
