/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.2
 */
 
private['_buttonText','_controlId', '_list', '_weaponClass', '_weaponType'];
// listbox control
_controlId = 1500;
// parameter one of the button action call
_buttonText = _this;

lbClear _controlId;

switch (_buttonText) do
{
    case 'players':
    {
        [1600] call admintoolkit_buttonEvents;
        // bind action buttons for players list
        {
            lbAdd [_controlId, name _x];
        } forEach allPlayers;
    };
    case 'vehicles':
    {
        // get all Exile vehicles
        _list = "(configName _x find 'Exile' >= 0)" configClasses (configFile >> "CfgVehicles");

        // bind action buttons for players list
        [1601] call admintoolkit_buttonEvents;

        {
            lbAdd [_controlId, configName _x];
        } forEach _list;
    };
    case 'weapons': 
    {
        _list = "((configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0))" configClasses (configFile >> "CfgWeapons");

        // bind action buttons for players list
        [1602] call admintoolkit_buttonEvents;

        {
            _weaponClass = configName _x;
            _weaponType = getNumber (configFile >> "CfgWeapons" >> _weaponClass >> "Type");
            if (_weaponType > 0 and _weaponType <= 4) then {
                lbAdd [_controlId, _weaponClass];
            };
        } forEach _list;
    };
};

true;