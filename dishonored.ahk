#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Dishonored.exe

global MouseTurnAll := 6250

MouseTurn(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

Home::Esc

~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return

XButton1::NumpadMult
return
XButton2::NumpadSub
return
