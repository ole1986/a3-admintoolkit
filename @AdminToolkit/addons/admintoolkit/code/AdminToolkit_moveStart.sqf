/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_vehicleClass','_position','_objectOffset', '_objectDistance', '_playerDir'];
_vehicleClass = _this select 0;

_objectOffset = [0, 5, 0]; 

_objectDistance = _objectOffset select 1;
_playerDir = getDir player;

_position = getPosATL player;
_position = [
    (_position select 0) + (_objectDistance * sin _playerDir),
    (_position select 1) + (_objectDistance * cos _playerDir),
    (_position select 2)
];

// TODO: check if position is properly calculated
AdminToolkitIsBuilding = 1;
AdminToolkitBuildingObject = createVehicle [_vehicleClass, _position, [], 0, "CAN_COLLIDE"];

[_objectOffset] spawn AdminToolkit_moveThread;