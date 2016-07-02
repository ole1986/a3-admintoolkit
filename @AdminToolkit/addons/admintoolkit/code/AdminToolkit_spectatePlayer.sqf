/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_player'];

if (!(isNil "AdminToolkit_player") and !(isNil "AdminToolkit_camera")) then {
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", AdminToolkit_cameraKeyDownId];
    AdminToolkit_camera cameraEffect ["terminate","back"];
    player switchCamera "External";
    camDestroy AdminToolkit_camera;
    AdminToolkit_camera = nil;
    AdminToolkit_player = nil;
    
    systemChat "Spectating stopped";
 } else {
    systemChat format["Spectating %1", name AdminToolkit_player];
    systemChat "Q = First person, E = 3rd person";
    systemChat "W,A,S,D = Change camera";
    systemChat "ESC = Stop spectating";

    AdminToolkit_player = _this select 0;
    AdminToolkit_camera = "camera" camCreate (position AdminToolkit_player);
    AdminToolkit_camera cameraEffect ["internal", "back"];
    AdminToolkit_camera camSetTarget AdminToolkit_player;
    AdminToolkit_camera attachTo [AdminToolkit_player, [0,-2,2]];
    AdminToolkit_camera camCommit 1;

    AdminToolkit_cameraKeyDownId = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if (_this select 1 == 0x01) then {
            [] call AdminToolkit_spectatePlayer;
            true;
        } else {
            if (_this select 1 in actionKeys "MoveForward") then {
                AdminToolkit_camera attachTo [AdminToolkit_player, [0,2,2]];
            };
            if (_this select 1 in actionKeys "MoveBack") then {
                AdminToolkit_camera attachTo [AdminToolkit_player, [0,-2,2]];
            };
            if (_this select 1 in actionKeys "TurnLeft") then {
                AdminToolkit_camera attachTo [AdminToolkit_player, [-2,0,2]];
            };
            if (_this select 1 in actionKeys "TurnRight") then {
                AdminToolkit_camera attachTo [AdminToolkit_player, [2,0,2]];
            };
            if (_this select 1 in actionKeys "LeanLeft") then {
                AdminToolkit_camera cameraEffect ["Terminate", "back"];
                AdminToolkit_player switchCamera "Internal";
            };
            if (_this select 1 in actionKeys "LeanRight") then {
                AdminToolkit_camera cameraEffect ["internal", "back"];
                AdminToolkit_camera switchCamera "internal";
            };
            false;
        };
    }];
    
};