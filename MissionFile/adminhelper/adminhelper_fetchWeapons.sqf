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
[1602] call adminhelper_buttonEvents;

lbAdd [_controlId, 'launch_NLAW_F'];
lbAdd [_controlId, 'srifle_EBR_MRCO_pointer_F'];
lbAdd [_controlId, 'LMG_Zafir_ARCO_F'];

true;