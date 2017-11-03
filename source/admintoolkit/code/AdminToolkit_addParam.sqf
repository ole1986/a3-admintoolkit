params ['_value', '_pos'];

if(!isNil "_pos") then {
	_pos = parseNumber (_pos);
};

if(typeName AdminToolkit_Params != "ARRAY") then {
	AdminToolkit_Params = [];
};

_size = (count AdminToolkit_Params);

if(_size > 0 && !isNil "_pos") then {
	if((_pos + 1) <= _size) then {
		AdminToolkit_Params set [_pos, _value];
	};
} else {
	AdminToolkit_Params pushBack _value;	
};

