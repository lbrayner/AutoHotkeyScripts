#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#SingleInstance force

#IfWinActive, ahk_exe Control_DX11.exe

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

~*PgDn::f
return

~*Numpad7::e
return

~*Numpad9::q
return

~*Numpad2::
MouseMoveHorizontally(2200)
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

~*Numpad1::
SetKeyDelay -1
UnreadyWeapon()
Send {c DownTemp}
return

~*Numpad1 up::
SetKeyDelay -1
Send {c up}
return
