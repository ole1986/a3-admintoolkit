/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
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
    
    hint parseText "Construction started<br /><br /><t color='#079C00'>Press SPACEBAR to release</t><br /><br /><t color='#900000'>Press TAB to cancel</t>";
    
    [] spawn AdminToolkit_moveThread;
    // close the AdminToolkit menu
    closeDialog 0;
} catch {
    systemChat format["[ATK-MOVESTART]: EXCEPTION: %1", _exception];
};
