/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_controlId','_vehicles'];
// listbox control
_controlId = 1500;

lbClear _controlId;

// get all Exile vehicles
_vehicles = "(configName _x find 'Exile' >= 0)" configClasses (configFile >> "CfgVehicles");

// bind action buttons for players list
[1601] call adminhelper_buttonEvents;

{
    lbAdd [_controlId, configName _x];
} forEach _vehicles;

/*lbAdd [_controlId, 'Exile_Bike_QuadBike_Blue'];
lbAdd [_controlId, 'Exile_Car_Kart_Green'];
lbAdd [_controlId, 'Exile_Boat_MotorBoat_Police'];
lbAdd [_controlId, 'Exile_Chopper_Hummingbird_Civillian_Digital'];
lbAdd [_controlId, 'Exile_Chopper_Huron_Black'];
lbAdd [_controlId, 'Exile_Chopper_Hellcat_Green'];
lbAdd [_controlId, 'Exile_Car_Hatchback_Green'];
lbAdd [_controlId, 'Exile_Car_Offroad_Armed_Guerilla01'];
lbAdd [_controlId, 'Exile_Car_Van_Guerilla01'];
*/

true;