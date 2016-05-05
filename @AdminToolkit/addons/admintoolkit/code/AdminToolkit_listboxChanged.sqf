/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_listboxId','_selectedArgs', '_section', '_display','_lbText', '_lbValue', '_tmp', '_tmp2'];
_listboxId = _this select 0;
_selectedArgs = _this select 1;
_section = _this select 2;
_display = findDisplay 40000;


_lbText = (_selectedArgs select 0) lbText (_selectedArgs select 1);
_lbValue = (_selectedArgs select 0) lbData (_selectedArgs select 1);

switch (_section) do {
    case 'player': {
        // set the selected player globally to use it in other sections
        AdminToolkit_selectedPlayer = _lbText;
        (_display displayCtrl 1803) ctrlSetStructuredText parseText "Selected Player: <t color='#FF0066'>" + AdminToolkit_selectedPlayer + "</t>";
    };
    case 'building': {
        // display some more information when building is selected
        _tmp = getText(configFile >> "CfgVehicles" >> _lbValue >> "author");
        _tmp2 = getText(configFile >> "CfgVehicles" >> _lbValue >> "vehicleClass");
        
        (_display displayCtrl 1803) ctrlSetStructuredText parseText format["<t color='#FF0066'>%1</t> (%3)<br /><t size='0.8'>Author: %2</t>", _lbValue, _tmp, _tmp2];
    };
    default { _result = nil; };
};