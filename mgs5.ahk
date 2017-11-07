#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  mgsvtpp.exe

global MouseTurnAll := 5050

MouseTurn(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}


UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnGrab()
{
	global Grab
		
	Grab := 0
	Send {Click up}
}

UnreadyBinoculars()
{
	global ReadyBinoculars
		
	ReadyBinoculars := 0
	Send {f up}
}

~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return


~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnreadyBinoculars()
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*SC07E::
SetKeyDelay -1
global Grab
if(!Grab)
{	
	Grab := 1
	Send {Click DownTemp}
}
return

~*LButton up::
SetKeyDelay -1
UnGrab()
return

Numpad0::Space
return

Numpad1::c
return

~*NumpadDot::
UnreadyBinoculars()
UnGrab()
return

Numpad3::z
return

Numpad4::a
return

Numpad5::s
return

Numpad6::d
return

~*Numpad7::
Send {Blind}{e DownTemp}
return

~*Numpad7 up::
Send {Blind}{e up}
UnGrab()
return

Numpad8::w
return

Numpad9::q
return

NumpadSub::g
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{x DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {Blind}{x up}
return

~*PgDn::
SetKeyDelay -1
global ReadyBinoculars
global ReadyWeapon
sleep_var_pg_dn := 50
if(ReadyBinoculars)
{
	Send {q DownTemp}
	Sleep sleep_var_pg_dn
	Send {q up}
}
if(!ReadyBinoculars && !ReadyWeapon)
{	
	ReadyBinoculars := 1
	Send {f DownTemp}
	return
}
if(ReadyWeapon)
{
	UnreadyBinoculars()
	Send {f DownTemp}
	Sleep sleep_var_pg_dn
	Send {f up}
}
return

~*PgUp::
Send {Blind}{r DownTemp}
return

~*PgUp up::
Send {Blind}{r up}
UnreadyWeapon()
UnGrab()
return

~*Home::
SetKeyDelay -1
UnGrab()
UnreadyBinoculars()
UnreadyWeapon()
Send {Blind}{Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Blind}{Esc up}
return

~*Esc::
SetKeyDelay -1
UnreadyWeapon()
UnGrab()
UnreadyBinoculars()
return

Insert::Tab
return

~*Delete::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
	Send {Blind}{x DownTemp}
	return
}
Send {Blind}{v DownTemp}
return

~*NumpadMult::
SetKeyDelay -1
sleep_var_mult := 100
var_mult := true
UnGrab()
while(var_mult)
{
	Send {Blind}{Click DownTemp}
	Sleep sleep_var_mult
	Send {Blind}{Click up}
	Sleep sleep_var_mult
}
return

~*NumpadMult up::
var_mult := false
return

~*NumpadAdd::
SetKeyDelay -1
sleep_var_plus := 50
var_plus := true
while(var_plus)
{
	Send {Blind}{e DownTemp}
	Sleep sleep_var_plus
	Send {Blind}{e up}
	Sleep sleep_var_plus
}
return

~*NumpadAdd up::
var_plus := false
return

~*Delete up::
SetKeyDelay -1
Send {Blind}{v up}{x up}
return

~*Right::
SetKeyDelay -1
Send {3 DownTemp}
return

~*Right up::
SetKeyDelay -1
Send {3 up}
return

~*Left::
Send {4 DownTemp}
return

~*Left up::
Send {4 up}
return

;~*Down::
;Send {2 DownTemp}
;return
;
;~*Down up::
;Send {2 up}
;return
;
;~*Up::
;Send {1 DownTemp}
;return
;
;~*Up up::
;Send {1 up}
;return

~*MButton::
Send {4 DownTemp}
return

~*MButton up::
Send {4 up}
return

~*WheelUp::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{1 DownTemp}
Sleep sleep_var
Send {Blind}{1 up}
return

~*WheelDown::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
return
