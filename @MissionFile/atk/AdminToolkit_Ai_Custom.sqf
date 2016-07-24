/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

AdminToolkit_Ai_CustomCode = {
	private['_selection'];
	_selection = lbData [RscAdminToolkitList_IDC, lbCurSel RscAdminToolkitList_IDC];
	
	_selection = toLower _selection;
	switch (_selection) do {
		case 'do not execute me':
		{
			systemChat 'You rebel, I like you';
		};
		case 'get scratchie prize':
		{
			systemChat 'getting scratchie prize...';
		};
		case 'buy scratchie':
		{
			systemChat 'buy scratchie...';
		};
	};
};
 
[1708, "Execute", "call AdminToolkit_Ai_CustomCode;"] call AdminToolkit_uiButton;

_result = ['Do not execute me','Get Scratchie Prize', 'Buy Scratchie'];

_result;