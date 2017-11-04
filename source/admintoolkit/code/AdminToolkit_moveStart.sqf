/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
/**
 * _netId STRING the netId of an object to be moved
 */
params['_netId'];

try {
    // gather the object created from server through the netId
    AdminToolkitBuildingObject = objectFromNetId _netId;
    // if the object is null throw an exception before starting build progress
    if (isNull AdminToolkitBuildingObject) then { throw "No object received from server"; };
    
    // set tool into building mode
    AdminToolkitIsBuilding = 1;
    AdminToolkitBuildingOffset = [0, 5, 1];
    AdminToolkitBuildingRotation = 0;
    
    hint parseText "<t size='1.5'>Building started</t><br /><br />Use Q, E, PAGEUP, PAGEDOWN, END, HOME to move and rotate<br /><br /><t size='1.25' color='#A4FF6A'>Press SPACEBAR to release</t><br /><t size='1.25'>Press F5 to repeat once built</t><br /><t size='1.25' color='#FF6060'>Press TAB to abort</t>";
    
    [] spawn AdminToolkit_moveThread;
    // close the AdminToolkit menu
    closeDialog 0;
} catch {
    systemChat format["[ATK-MOVESTART]: EXCEPTION: %1", _exception];
};