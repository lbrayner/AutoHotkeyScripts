#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  QuantumBreak.exe

CoordMode, Mouse, Screen

global OneEightyAll :=    3000

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
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

~*Home::Esc
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad8::w
return

~*Numpad0::Space
return

~*Numpad1::
SetKeyDelay -1
UnreadyWeapon()
Send {c DownTemp}
return

~*Numpad1 up::
SetKeyDelay -1
Send {c up}
return

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::e
return

~*PgDn::f
return

~*PgUp::r
return

~*Delete::v
return

~*NumpadEnter::LCtrl
return

~*Right::3
return

~*Left::1
return

~*Down::2
return

~*Insert::Tab
return

~*NumpadAdd::o
return

~*End::t
return

~*NumpadDot::
SetKeyDelay -1
dot_var := true
dot_sleep_var := 50
while(dot_var)
{	
	Send {Blind}{f DownTemp}{Space DownTemp}
	Sleep dot_sleep_var
	Send {Blind}{f up}{Space up}
	Sleep dot_sleep_var
}
return

~*NumpadDot up::
SetKeyDelay -1
dot_var := false
return

~*XButton1::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
    Send {Blind}{z}
}
return
