params["_request", "_params"];
try 
{   
	switch(_request) do {
		case 'message': {
			_params call AdminToolkit_showMessage;
		};
	};
}
catch
{
    systemChat format["[ATK-RESPONSE]: EXCEPTION: %1", _exception];
};