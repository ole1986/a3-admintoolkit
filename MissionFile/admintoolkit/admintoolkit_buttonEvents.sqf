/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_controlId', '_actionCode'];
_controlId = _this select 0;

/**
 * 1701 = Action 1
 * 1702 = Action 2
 * 1703 = Action 3
 * 1704 = Action 4
 * 1705 = Action 5
 * 1706 = Action 6
 */

 {
    ctrlSetText[_x, ""];
    buttonSetAction [_x, ""];
 } forEach [1701, 1702, 1703, 1704, 1705, 1706];
 
_actionCode = ' call admintoolkit_buttonAction;';
 
 switch (_controlId) do
{
    // Players
    case 1600: 
	{
        ctrlSetText [1701,"Teleport Me"];
        buttonSetAction [1701, "['tp2player']" + _actionCode];
        
        ctrlSetText [1702, "Teleport Player"];
        buttonSetAction [1702, "['tpplayer']" + _actionCode];
        
        ctrlSetText [1704, "Select Player"];
        buttonSetAction [1704, "admintoolkit_selectedPlayer = lbText [1500, lbCurSel 1500]; ctrlSetText [1801, 'Selected Player: ' + adminhelper_selectedPlayer];"];
	};
    // Vehicles
    case 1601:
    {
        ctrlSetText [1701,"Spawn Me"];
        buttonSetAction [1701, "['getvehicle']" + _actionCode];
        
        ctrlSetText [1702,"Spawn at Player"];
        buttonSetAction [1702, "['givevehicle']" + _actionCode];
        
    };
    // Weapons
    case 1602:
    {
        ctrlSetText [1701,"Get Weapon"];
        buttonSetAction [1701, "['getweapon']" + _actionCode];
    };
};
