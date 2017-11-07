#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Talos.exe

global MouseTurnAll := 5850

MouseTurn(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

Home::Esc
return


~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return

*SC07E::
SetKeyDelay -1
sleep_var := 200
var := true
while(var)
{
    Send {Blind}{e DownTemp}
    Sleep sleep_var
    Send {Blind}{e up}
    Sleep sleep_var
}
return

*SC07E up::
var := false
return
