#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe sdhdship.exe

global ReadyWeapon := 0
global OneEighty := 4000

MouseMoveHorizontally(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {F5 up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {F5 DownTemp}
}
return

~*Home::Esc
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad7::e
return

~*Numpad9::q
return

~*Numpad8::
SetKeyDelay -1
Send {Blind}{w DownTemp}{LCtrl DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
Send {Blind}{w up}{LCtrl up}
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{Space DownTemp}
return

~*Numpad0 up::
SetKeyDelay -1
Send {Blind}{Space up}
return

~*PgDn::f
return

~*PgUp::r
return

~*RButton::
SetKeyDelay -1
Send {Blind}{f DownTemp}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{f up}
return

*~Numpad2::
SetKeyDelay -1
global OneEighty
MouseMoveHorizontally(OneEighty)
return

~*Insert::Tab
return

~*End::m
return
