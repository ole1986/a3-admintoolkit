/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

params['_player'];

if (!isNil "AdminToolkit_camera") then {
    (findDisplay 46) displayRemoveEventHandler ["KeyDown", AdminToolkit_cameraKeyDownId];
    AdminToolkit_camera cameraEffect ["terminate","back"];
    player switchCamera "External";
    camDestroy AdminToolkit_camera;
    AdminToolkit_camera = nil;
    AdminToolkit_Player = nil;
    
    systemChat "Spectating stopped";
 } else {
    AdminToolkit_Player = vehicle _player;

    // show user friendly message
    private _info = "<t size='1.1'>The following keyboard keys can be used<br /><br />Q/E = first/3rd person, W/A/S/D = Change camera perspective, ESC = Stop spectating</t>";
    [format["Spectating %1", name AdminToolkit_Player], _info] call AdminToolkit_showMessage;
    
    systemChat format["Spectating %1", name AdminToolkit_Player];

    AdminToolkit_camera = "camera" camCreate (position AdminToolkit_Player);
    AdminToolkit_camera cameraEffect ["internal", "back"];
    AdminToolkit_camera camSetTarget AdminToolkit_Player;
    AdminToolkit_camera attachTo [AdminToolkit_Player, [0,-2,2]];
    AdminToolkit_camera camCommit 1;

    AdminToolkit_cameraKeyDownId = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if (_this select 1 == 0x01) then {
            [] call AdminToolkit_spectatePlayer;
            true;
        } else {
            if (_this select 1 in actionKeys "MoveForward") then {
                AdminToolkit_camera attachTo [AdminToolkit_Player, [0,2,2]];
            };
            if (_this select 1 in actionKeys "MoveBack") then {
                AdminToolkit_camera attachTo [AdminToolkit_Player, [0,-2,2]];
            };
            if (_this select 1 in actionKeys "TurnLeft") then {
                AdminToolkit_camera attachTo [AdminToolkit_Player, [-2,0,2]];
            };
            if (_this select 1 in actionKeys "TurnRight") then {
                AdminToolkit_camera attachTo [AdminToolkit_Player, [2,0,2]];
            };
            if (_this select 1 in actionKeys "LeanLeft") then {
                AdminToolkit_camera cameraEffect ["Terminate", "back"];
                AdminToolkit_Player switchCamera "Internal";
            };
            if (_this select 1 in actionKeys "LeanRight") then {
                AdminToolkit_camera cameraEffect ["internal", "back"];
                AdminToolkit_camera switchCamera "internal";
            };
            false;
        };
    }];
    
};