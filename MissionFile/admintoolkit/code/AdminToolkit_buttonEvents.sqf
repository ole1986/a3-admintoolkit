/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.2
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

for "_i" from 1701 to 1706 do
{
    ctrlSetText[_i, ""];
    buttonSetAction [_i, ""];
};

_actionCode = ' call AdminToolkit_buttonAction;';
 
 switch (_controlId) do
{
    // Players
    case 1600: 
	{
        ctrlSetText [1701,"TP to Player"];
        buttonSetAction [1701, "['tp2player']" + _actionCode];
        ctrlSetText [1704, "TP to Me"];
        buttonSetAction [1704, "['tpplayer']" + _actionCode];
        
        ctrlSetText [1702, "Spec Player"];
        buttonSetAction [1702, "['specplayer']" + _actionCode];
        ctrlSetText [1705, "Stop Spec"];
        buttonSetAction [1705, "['specstop']" + _actionCode];
		
		ctrlSetText [1703, "Godmode On"];
        buttonSetAction [1703, "['godmodeon']" + _actionCode];
        ctrlSetText [1706, "Godmode Off"];
        buttonSetAction [1706, "['godmodeoff']" + _actionCode];
	};
    // Vehicles
    case 1601:
    {
        ctrlSetText [1701,"Spawn at Me"];
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
