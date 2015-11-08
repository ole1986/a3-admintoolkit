/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_weapon', '_result'];
_weapon = _this select 0;

switch (_weapon) do
{
    // Players
    case 'launch_NLAW_F':  { _result = 'NLAW_F'; };
    case 'srifle_EBR_MRCO_pointer_F': { _result = '20Rnd_762x51_Mag'; }; 
    case 'LMG_Zafir_ARCO_F': { _result = '150Rnd_762x54_Box'; };
};
_result;