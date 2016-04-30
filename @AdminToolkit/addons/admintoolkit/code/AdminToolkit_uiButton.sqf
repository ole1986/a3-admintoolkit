/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_controlId','_title', '_code'];
disableSerialization;

_controlId = _this select 0;
_title = _this select 1;
_code  = _this select 2;

if !(isNil "_title") then {
    ctrlSetText [_controlId, _title];
    buttonSetAction [_controlId, _code];
    ctrlShow [_controlId, true];
} else {
    //ctrlSetText [_controlId,""];
    //buttonSetAction [_controlId, ""];
    ctrlShow [_controlId, false];
};

