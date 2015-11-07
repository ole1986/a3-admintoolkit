/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */

private["_playerList", "_number", "_prizes", "_curPrize", "_source","_winners", "_count", "_currentPlayer", "_rand"];
_winners = [];
_playerList = nil;
_number = "";
_prizes = [];

try 
{
    _number = call ExileServer_lottery_generate;

    // receive a list of all players who are participating (only those where its lucky number is not empty)
    _playerList = "getLotteryPlayers" call ExileServer_system_database_query_selectFull;
    _count = count _playerList;

    {
        _currentPlayer = nil;
        if (_count > 0) then {
            for "_i" from 0 to _count - 1 do 
            {
                // skip second loop when uid does not match
                if ((_playerList select _i) select 0 == getPlayerUid _x) exitWith {
                    _currentPlayer = _playerList select _i;
                };
            };
        };
        
        if !(isNil "_currentPlayer")  then {
            format ["DEBUG: - Checking %1 with number %2", _currentPlayer select 0, _currentPlayer select 2] call ExileServer_util_log;
            // COLLECT PLAYERS WHO HAVE THE LUCKY NUMBER - MULTIPLE
            if (_currentPlayer select 2 == _number) then {
                _winners pushBack _x;
            } else {
                [_x,"notificationRequest",["LockKickWarning",[format["The lucky number: %1<br/>You had %2", _number, _currentPlayer select 2]]]] call ExileServer_system_network_send_to;
            };
        };
        
    } forEach allPlayers;

    if (count _winners > 0) then 
    {
        // random chance to win either vehicle, poptabs or item (like guns)
        _prizes = getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "VehiclePrize") + getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "PoptabPrize") + getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "WeaponPrize") + getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "CustomPrize");
        _count = count _prizes;
        _rand = round(random _count) - 1;
        _curPrize = _prizes select _rand;
        
        _count = count getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "VehiclePrize");
        _source = "VehiclePrize";
        if (_rand >= _count) then { _source = "PoptabPrize"; };
        _count = _count + count getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "PoptabPrize");
        if (_rand >= _count) then { _source = "WeaponPrize"; };
        _count = _count + count getArray(configFile >> "CfgSettings" >> "ScratchieSettings" >> "WeaponPrize");
        if (_rand >= _count) then { _source = "CustomPrize"; };
        
        // inform the players about the prize
        {
            format["SCRATCHIE: Winner is %1 - Price: %2 from %3", name vehicle _x, _curPrize, _source]  call ExileServer_util_log;
            // Save prize into database
            format["saveLotteryWinner:%1:%2:%3", getPlayerUID _x, _curPrize, _source] call ExileServer_system_database_query_insertSingle;
            
            // show winner message
            [_x, "notificationRequest", ["Success", ["YOU WON A PRIZE"]]] call ExileServer_system_network_send_to;
        } forEach _winners;
    };
    
    // Free the player, so they can participate again
    "freePlayersFromLottery" call ExileServer_system_database_query_fireAndForget;
}
catch
{
    format["ERROR: Scratchie Error: %1", _exception]  call ExileServer_util_log;
};
true