/*
	Author: Bethea.A

	Description:
	Displays message in system chat for all players regardless of locality.

	Parameter(s):
	0: _messageData <STRING> 			- Message to display.
	
	
	Returns:
	The selected mission type.
	
	Examples:
	["This is the message!"] call phm_fnc_systemMessage;
*/

params ["_messageData"];

str _messageData remoteExec ["systemChat",0];