/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_action', '_selection'];
// is the action which should remotely be called
_action = _this select 0;

switch (_action) do
{
    case 'tp2pos':
    {
        _selection = _this select 1;
        systemChat format["Teleporting to %1", str _selection];
    };
    case 'givevehicle':
    {
        _selection = [lbText [1500, lbCurSel 1500], adminhelper_selectedPlayer];
        systemChat format["Giving vehicle to %1", adminhelper_selectedPlayer];
    };
    default 
    {
        _selection = lbText [1500, lbCurSel 1500];
        systemChat format["Calling %1 with param %2", _action, _selection];
    };
};

[player, _action, _selection] remoteExecCall ['AdminHelper_network_receiveRequest', 2];