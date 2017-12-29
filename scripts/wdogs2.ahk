#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  WatchDogs2.exe


UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global OneEightyAll :=    7700

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

*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{Esc DownTemp}
return

*Home up::
SetKeyDelay -1
Send {Blind}{Esc up}
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

~*Numpad1::c
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

~*NumpadEnter::
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
Send {Blind}{LCtrl up}
return

~*Delete::v
return

~*Insert::Tab
return

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return
