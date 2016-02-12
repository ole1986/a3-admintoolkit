/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
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
    
    uiSleep 0.01;
};
