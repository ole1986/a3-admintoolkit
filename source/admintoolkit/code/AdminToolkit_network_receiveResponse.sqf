/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params["_request", "_params"];

private _tmp = '';
private _tmp2 = '';

try 
{   
	switch(_request) do {
	//system
		case 'loginok': {
			missionNamespace setVariable ['AdminToolkit_permissionSet', _params];
			systemChat "AdminToolkit READY - Press F2 to open";
		};
		case 'loginfailed': {
			systemChat "AdminToolkit LOGIN FAILED - Check your server config.cpp";
		};
	//player	
		case 'getplayers': {
			missionNamespace setVariable ['AdminToolkit_Players', _params];
		};
		case 'message': {
			_params call AdminToolkit_showMessage;
		};
		case 'specplayer': {
			// get the real player object from its netId
			closeDialog 0;
			_params = objectFromNetId _params;
			[_params] call AdminToolkit_spectatePlayer;
		};
	//Building
		case 'buildpers': {
			AdminToolkitIsBuildingPersistent = true;
			// the netId of its vehicle created from the server
            [_params] call AdminToolkit_moveStart;
		};
        case 'build': {
            // the netId of its vehicle created from the server
            [_params] call AdminToolkit_moveStart;
        };
		case 'buildinfopersistent': {
			_tmp = _params select 0;
			_tmp2 = _params select 1;

			private _text = "<t size='1.25'>AdminToolkit</t><br />";

			_text = _text + format["%1 persistent buildings stored on server", str _tmp];
			if (!_tmp2) then {
				_text = _text + "<br /><t size='1.25' color='#FF6060'>NOT SAVED YET</t>";
			};

			hint parseText _text;
		};
		case 'clearpersistent': {
			hint parseText format["<t size='1.25'>AdminToolkit</t><br /><br />Persistent objects cleared<br />Buildings will be removed after server restart", str _params];
		};
		case 'savepersistent': {
			hint parseText "<t size='1.25'>AdminToolkit</t><br /><br />Persistent objects saved<br />";
		};
	};
}
catch
{
    systemChat format["[ATK-RESPONSE]: EXCEPTION: %1", _exception];
};
