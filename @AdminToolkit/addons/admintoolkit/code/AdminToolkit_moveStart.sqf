/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_vehicleClass','_position','_objectOffset', '_objectDistance', '_playerDir'];
_vehicleClass = _this select 0;

AdminToolkitIsBuilding = 1;
AdminToolkitBuildingOffset = [0, 5, 0];
AdminToolkitBuildingRotation = 0;

_objectDistance = AdminToolkitBuildingOffset select 1;
_playerDir = getDir player;

_position = getPosATL player;
_position = [
    (_position select 0) + (_objectDistance * sin _playerDir),
    (_position select 1) + (_objectDistance * cos _playerDir),
    (_position select 2)
];

AdminToolkitBuildingObject = createVehicle [_vehicleClass, _position, [], 0, "CAN_COLLIDE"];

[] spawn AdminToolkit_moveThread;
// close the AdminToolkit menu
closeDialog 0;