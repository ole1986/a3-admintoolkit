/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_controlId','_players'];
// listbox control
_controlId = 1500;

lbClear _controlId;

// bind action buttons for players list
[1601] call adminhelper_buttonEvents;

lbAdd [_controlId, 'C_Offroad_01_F'];

true;