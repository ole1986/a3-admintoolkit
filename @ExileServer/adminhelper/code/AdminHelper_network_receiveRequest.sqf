/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private["_payload","_adminList", "_moderatorList", "_moderatorCmds","_player","_request", "_params","_result", "_tmp"];
_payload = _this;
_adminList = getArray(configFile >> "CfgSettings" >> "AdminHelper" >> "AdminList");
_moderatorList = getArray(configFile >> "CfgSettings" >> "AdminHelper" >> "ModeratorList");
_moderatorCmds = getArray(configFile >> "CfgSettings" >> "AdminHelper" >> "ModeratorCmds");
_result = true;
try 
{
    _player = _payload select 0;
    _request = _payload select 1; // what to do
    _params = _payload select 2; // an array of parameters
    
    if !( getPlayerUID _player in (_adminList + _moderatorList) ) then {
        throw format ["Player %1 with UID %2 does not have access", name _player, getPlayerUID _player];
    };
    
    diag_log format ["[ADMINHELPER] Calling %1 from player %2", _request, name _player];

    // if its a moderator, check if commands is allowed
    if ( getPlayerUID _player in _moderatorList ) then {
        if !( _request in _moderatorCmds ) then {
            throw format [ "Moderator %1 has no access to admin command %2 with params %3 ", name _player, _request, str _params];
        };
    };
    
    switch (_request) do {
        case "tp2player": 
        {
            // Teleport to players position
            // Example #1: [player, 'tpto', '<playername>']
            
            {
                if(name _x isEqualTo _params) exitWith {
                    _result = getPosATL _x;
                    _player setPosATL _result;
                };
            } forEach allPlayers;
        };
        case "tpplayer": 
        {
            // Teleport to players position
            // Example #1: [player, 'tpto', '<playername>']
            {
                if(name _x isEqualTo _params) exitWith {
                    _x setPosATL (position _player);
                };
            } forEach allPlayers;
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
            
            _tmp = _params select 1;
            {
                if(name _x isEqualTo _tmp) exitWith {
                    // get vehicle parameter
                    _tmp = _params select 0;
                    // create the vehicle for the player
                    _result = _tmp createVehicle position _x;
                };
            } forEach allPlayers;
        };
        case "getweapon": {
            _tmp = _params select 0;
            if (_tmp != "") then {
                _player addWeaponGlobal _tmp;
            };
            
            _tmp = _params select 1;
            _player addMagazine _tmp;
        };
    }; 
}
catch
{
    diag_log format["[ADMINHELPER]: EXCEPTION: %1", _exception];
};
_result