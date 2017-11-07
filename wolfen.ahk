#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  WolfNewOrder_x64.exe
#IfWinActive, ahk_exe  WolfOldBlood_x64.exe

CoordMode, Mouse, Screen

global MouseTurnAll := 250
global Up_var := 0

MouseTurn(x)
{
	;DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
	MouseMove x,0,15,R
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

SC07E::2
return


~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
return

~*Numpad3::
SetKeyDelay -1
Send {Blind}{f DownTemp}
return


~*Numpad3 up::
SetKeyDelay -1
Send {Blind}{f up}
return


Home::Esc
return


~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return

~*Numpad7::
SetKeyDelay -1
sleep_var := 100
var := true
while(var)
{
    Send {Blind}{e DownTemp}
    Sleep sleep_var
    Send {Blind}{e up}
    Sleep sleep_var
}
return

~*Numpad7 up::
var := false
return

~*PgDn::
SetKeyDelay -1
sleep_var_pgdn := 100
var_pgdn := true
while(var_pgdn)
{
    Send {Blind}{f DownTemp}
    Sleep sleep_var_pgdn
    Send {Blind}{f up}
    Sleep sleep_var_pgdn
}
return

~*PgDn up::
var_pgdn := false
return

~*PgUp::
SetKeyDelay -1
UnreadyWeapon()
sleep_var_pgup := 100
var_pgup := true
while(var_pgup)
{
    Send {Blind}{r DownTemp}
    Sleep sleep_var_pgup
    Send {Blind}{r up}
    Sleep sleep_var_pgup
}
return

~*PgUp up::
var_pgup := false
return

Up::1
return

~*MButton::
sleep_var_mbutton := 200
Send {3}
Sleep sleep_var_mbutton
Send {7}
Sleep sleep_var_mbutton
Send {7}
return


;~*Up::
;global Up_var
;Up_var := Up_var + 1
;Up_var := Mod(Up_var,2)
;if (Up_var = 0)
;{
;    Send {Blind}{1}
;}
;else
;{
;    Send {Blind}{2}
;}
;return
