#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#SingleInstance force

#IfWinActive, ahk_exe NewColossus_x64vk.exe

MouseMoveHorizontally(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

UnreadyWeapon()
{
	global ReadyWeapon

    if(!ReadyWeapon)
        return

	ReadyWeapon := 0
	Send {Click Right up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {Click Right DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Esc up}
return

~*Numpad8::w
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {LCtrl DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {LCtrl up}
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad7::e
return

~*Numpad9::q
return

~*Numpad0::Space
return

~*PgUp::r
return

~*PgDn::f
return

~*Numpad2::
MouseMoveHorizontally(800)
return
