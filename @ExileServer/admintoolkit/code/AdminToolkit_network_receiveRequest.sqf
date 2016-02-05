/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private["_payload","_adminList", "_moderatorList", "_moderatorCmds","_player","_request", "_params","_result", "_tmp", "_mod", "_session"];
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
    
	_session = _player getVariable ['session', ''];
    diag_log format ["[ADMINTOOLKIT] Calling %1 from player %2 (session %3)", _request, name _player, _session];

    // if its a moderator, check if commands is allowed
    if ( getPlayerUID _player in _moderatorList ) then {
        if !( _request in _moderatorCmds ) then {
            throw format [ "Moderator %1 has no access to admin command %2 with params %3 ", name _player, _request, str _params];
        };
    };
        
    switch (_request) do {
		case "kickplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#exec kick ""%1""", _params];
			};
		};
		case "banplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#exec ban ""%1""", _params];
			};
		};
		case "getplayers":
		{
			_tmp = ['', true] call AdminToolkit_network_fetchPlayer;
			
			[_request, _session, _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
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
            if (_tmp != "") then { _player addMagazines  [_tmp, 1]; };
            // add the weapon
            _tmp = _params select 0;
            if (_tmp != "") then { _player addWeaponGlobal _tmp; };
        };
		case "getammo": {
			_tmp = _params select 0;
            if (_tmp != "") then { _player addMagazines  [_tmp, 1]; };
		};
		case "getitem": {
			if (_params != "") then { _player addItem _params; };
		};
		case "specplayer": {
			_tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!(isNil "_tmp") && (typeName _tmp == "OBJECT")) then {
				[_request, _session, netId _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
			};
		};
		case "godmodeon": {
			// all clients will have their ammo set to 1 for their current weapon
			//{player setAmmo [primaryWeapon player, 1];} remoteExecCall ["bis_fnc_call", owner _player];
			["godmode", _session, true] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case "godmodeoff": {
			["godmode", _session, false] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		// used for mod extensions
		default { 
			if(isClass(missionConfigFile >> "CfgAdminToolkitCustomMod")) then {
				if(isText(missionConfigFile >> "CfgAdminToolkitCustomMod" >> "AdminToolkit_ModEnable")) then {
					_tmp = getText(missionConfigFile >> "CfgAdminToolkitCustomMod" >> "AdminToolkit_ModEnable"));
					_tmp = toLower _tmp;
					_mod = compile preprocessFileLineNumbers "AdminToolkit_server_" + _tmp + ".sqf";
					[_player, _request, _params] call _mod;
				};
			};
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT]: EXCEPTION: %1", _exception];
};

_result;