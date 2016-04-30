/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

/** 
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 *
 * LISTBOX
 *
 * 1500 = Listbox
 *
 * LOWER BUTTONS
 * 
 * 1701 = Action 1
 * 1702 = Action 2
 * 1703 = Action 3
 * 1704 = Action 4
 * 1705 = Action 5
 * 1706 = Action 6
 * 1707 = Action 7
 * 1708 = Action 8
 */

AdminToolkit_Ai_CustomCode = {
	private['_selection'];
	_selection = lbData [1500, lbCurSel 1500];
	
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