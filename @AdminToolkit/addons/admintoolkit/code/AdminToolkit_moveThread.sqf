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
    
    uiSleep 0.02;   
};
