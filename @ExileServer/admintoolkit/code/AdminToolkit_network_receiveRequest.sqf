/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.2
 */
 
private["_payload","_adminList", "_moderatorList", "_moderatorCmds","_player","_request", "_params","_result", "_tmp", "_tmp2"];
_payload = _this;
_adminList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "AdminList");
_moderatorList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorList");
_moderatorCmds = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorCmds");
_result = true;
try 
{
    _player = _payload select 0;
    _request = _payload select 1; // what to do
    _params = _payload select 2; // an array of parameters
    
    if !( getPlayerUID _player in (_adminList + _moderatorList) ) then {
        throw format ["Player %1 with UID %2 does not have access", name _player, getPlayerUID _player];
    };
    
    diag_log format ["[ADMINTOOLKIT] Calling %1 from player %2", _request, name _player];

    // if its a moderator, check if commands is allowed
    if ( getPlayerUID _player in _moderatorList ) then {
        if !( _request in _moderatorCmds ) then {
            throw format [ "Moderator %1 has no access to admin command %2 with params %3 ", name _player, _request, str _params];
        };
    };
        
    switch (_request) do {
		case "playersCallback":
		{
			_tmp = [nil, true] AdminToolkit_network_fetchPlayer;
			missionNamespace setVariable ['admintoolkit_callback', [ _request, _tmp ] ];
			(owner _player) publicVariableClient "admintoolkit_callback";
		};
        case "tp2player": 
        {
            // Teleport to players position
            // Example #1: [player, 'tpto', '<playername>']
            _tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				_player setPosATL (getPosATL _tmp);
			};
        };
        case "tpplayer": 
        {
            // Teleport to players position
            // Example #1: [player, 'tpto', '<playername>']
			_tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				_tmp setPosATL (position _player);
			};
        };
        case "tp2pos": {
            // Teleport to coords ATL
            // Example #2: [player, 'tpto', [0,0,0]]           /* teleport to coords ATL */
            _player setPosATL _params;
        };
        case "getvehicle": {
            // create a vehicle near admin
             _result = _params createVehicle position _player;
        };
        case "givevehicle": {
            _tmp = [_params select 1] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				(_params select 0) createVehicle position _tmp;
			};
        };
        case "getweapon": {
            // add magazine first to make sure weapon is being loaded
            _tmp = _params select 1;
            if (_tmp != "") then { _player addMagazines  [_tmp, 3]; };
            // add the weapon
            _tmp = _params select 0;
            if (_tmp != "") then { _player addWeaponGlobal _tmp; };
        };
		case "specplayer": {
			_tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				missionNamespace setVariable ['admintoolkit_callback', [ _request, netId _tmp ] ];
				(owner _player) publicVariableClient "admintoolkit_callback";
			};
		};
		case "godmodeon": {
			missionNamespace setVariable ['admintoolkit_callback', [ 'godmode', true ] ];
			(owner _player) publicVariableClient "admintoolkit_callback";
		};
		case "godmodeoff": {
			missionNamespace setVariable ['admintoolkit_callback', [ 'godmode', false ] ];
			(owner _player) publicVariableClient "admintoolkit_callback";
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT]: EXCEPTION: %1", _exception];
};
_result