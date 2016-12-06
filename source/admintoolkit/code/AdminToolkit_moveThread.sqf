/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_position', '_vectorUp', '_rotation', '_vectorDirection'];

_position = [0, 0, 0];
_vectorUp = [0, 0, 1];

while {AdminToolkitIsBuilding isEqualTo 1} do
{
    _position = ASLtoATL (AGLtoASL (player modelToWorld AdminToolkitBuildingOffset));
	_rotation = (AdminToolkitBuildingRotation + (getDir player) + 360) % 360;
    _vectorDirection = [sin(_rotation), cos(_rotation), 0];
    
    AdminToolkitBuildingObject setVectorDirAndUp [_vectorDirection, _vectorUp];
    AdminToolkitBuildingObject setPosATL _position;
    
    uiSleep 0.033;   
};

// destroy the object when AdminToolkitBuildingObject is set to -1
if(AdminToolkitIsBuilding isEqualTo -1) then {
    hint parseText "<t size='1.5' color='#FF6060'>Construction aborted</t>";
    [player, "buildabort", netId AdminToolkitBuildingObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
} else {
    if (AdminToolkitIsBuildingPersistent) then {
        [player, "buildpersistent", [typeOf AdminToolkitBuildingObject, getPosASL AdminToolkitBuildingObject, getDir AdminToolkitBuildingObject]] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        AdminToolkitIsBuildingPersistent = nil;
    };
    hint parseText "<t size='1.5' color='#A4FF6A'>Construction placed</t>";
};
