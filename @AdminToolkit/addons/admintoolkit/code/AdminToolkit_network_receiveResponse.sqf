/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private["_request", "_params", "_session"];
try 
{
	_request = _this select 0; // what to do
	_session = _this select 1;
    _params = _this select 2; // mixed value
    
	//systemChat format["[ADMINTOOLKIT]: networkResponse: %1", _request];
    
	switch(_request) do {
		case 'getplayers': {
			lbClear 1500;
			
			{
				lbAdd [1500, _x];
				lbSetData [1500, (lbSize 1500) - 1, _x];
			} forEach _params;
		};
		case 'specplayer': {
			// get the real player object from its netId
			_params = objectFromNetId _params;
			admintoolkit_specCam = "camera" camCreate (position _params);
			admintoolkit_specCam camSetRelPos [0, -1.5, 1.7];
			admintoolkit_specCam cameraEffect ["internal", "back"];
			admintoolkit_specCam attachTo [_params, [0,-1,1.8]];
			
			systemChat format["Spectating %1", name _params];
			//admintoolkit_specCam = "camera" createvehicle [0,0,0];
			//admintoolkit_specCam camsettarget player;
			//admintoolkit_specCam SwitchCamera "internal";
			//admintoolkit_specCam attachTo [player, [0,-1,1.8]];
		};
		case 'godmode': {
			if(_params) then { player allowDamage false; } else { player allowDamage true; };
			systemChat format["Godmode %1", str _params];
		};
	};
}
catch
{
    systemChat format["[ADMINTOOLKIT]: EXCEPTION: %1", _exception];
};
