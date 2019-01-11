#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe sdhdship.exe

global ReadyWeapon := 0
global OneEighty := 6000

MouseMoveHorizontally(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
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

~*Numpad9::q
return

~*Numpad0::
UnreadyWeapon()
Send {Blind}{Space DownTemp}
return

~*Numpad0 up::
Send {Blind}{Space up}
return

~*NumpadEnter::
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
Send {Blind}{LCtrl up}
return

~*PgDn::f
return

~*PgUp::r
return

~*Numpad7::e
return

~*RButton::
Send {Blind}{f DownTemp}
return

~*RButton up::
Send {Blind}{f up}
return

*~Numpad2::
global OneEighty
MouseMoveHorizontally(OneEighty)
return

