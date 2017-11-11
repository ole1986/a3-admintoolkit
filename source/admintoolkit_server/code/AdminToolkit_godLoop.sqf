
private _i = 0;
private _msgInterval = 60;
private _removeZombieInterval = 5;
private _nearbyZombieRange = 50;
private _player = objNull;

while {true} do {
	sleep 1;
	_i = _i + 1;
	if(count AdminToolkit_GodPlayers > 0) then {
		{
			_player = objectFromNetId _x;
			if (!isNull _player) then {
				// reset players damage
				_player setDamage 0;

				// remove all RyanZombies nearby every 5 seconds
				if((_i % _removeZombieInterval) == 0) then {
					{
						// remove all RyanZombies nearby
						if(((typeOf _x) find "RyanZombie") >= 0 ) then { deleteVehicle _x; };
					} forEach (_player nearEntities _nearbyZombieRange);				
				};

				// display server message, that player is in god mode
				if((_i % _msgInterval) == 0) then {
					diag_log format['[ADMINTOOLKIT] Player %1 is in GODMODE', name _player];
				};
			} else {
				// clear non existing players from list
				AdminToolkit_GodPlayers deleteAt (AdminToolkit_GodPlayers find _x);
			};
		} forEach AdminToolkit_GodPlayers;
	};
	if(_i > _msgInterval) then { _i = 0; }
};