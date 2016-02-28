/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

/** 
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 *
 * LISTBOX
 *
 * 1500 = Listbox
 *
 * LOWER BUTTONS
 * 
 * 1701 = Action 1
 * 1702 = Action 2
 * 1703 = Action 3
 * 1704 = Action 4
 * 1705 = Action 5
 * 1706 = Action 6
 * 1707 = Action 7
 * 1708 = Action 8
 */

 // RHS vehicle classes
 // You might amend them from here:
 // http://class.rhsmods.org/rhsusaf/CfgVehicleClasses.html
 // http://class.rhsmods.org/rhsafrf/CfgVehicleClasses.html
 
_result = "(getText(_x >> 'VehicleClass') in ['rhs_vehclass_apc','rhs_vehclass_ifv','rhs_vehclass_car','rhs_vehclass_truck','rhs_vehclass_tank','rhs_vehclass_artillery','rhs_vehclass_radar','rhs_vehclass_targeting','rhs_vehclass_launcher','rhs_vehclass_aircraft','rhs_vehclass_helicopter', 'rhs_vehclass_aa']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;