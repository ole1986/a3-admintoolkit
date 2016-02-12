/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_position', '_objectDistance', '_playerDir'];

try {
    // gather the object created from server through the netId
    AdminToolkitBuildingObject = objectFromNetId (_this select 0);
    // if the object is null throw an exception before starting build progress
    if (isNull AdminToolkitBuildingObject) then { throw "No object received from server"; };
    
    // set tool into building mode
    AdminToolkitIsBuilding = 1;
    AdminToolkitBuildingOffset = [0, 5, 0];
    AdminToolkitBuildingRotation = 0;

    /*_objectDistance = AdminToolkitBuildingOffset select 1;
    _playerDir = getDir player;*/

    /*_position = getPosATL player;
    _position = [
        (_position select 0) + (_objectDistance * sin _playerDir),
        (_position select 1) + (_objectDistance * cos _playerDir),
        (_position select 2)
    ];*/
    
    // update the position of the object by using AdminToolkitBuildingOffset from player position
    //AdminToolkitBuildingObject setPosATL _position;
    // call the movement loop
    [] spawn AdminToolkit_moveThread;
    // close the AdminToolkit menu
    closeDialog 0;
} catch {
    systemChat format["[ATK-MOVESTART]: EXCEPTION: %1", _exception];
};
