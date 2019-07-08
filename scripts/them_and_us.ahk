#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  UDK.exe

MouseMoveVertically(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

    if(!ReadyWeapon)
        return

	ReadyWeapon := 0
	Send {Click up right}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {Click DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {LShift DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {LShift up}
return

~*PgUp::
SetKeyDelay -1
Send {r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
UnreadyWeapon()
Send {r up}
return

*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Esc DownTemp}
return

*Home up::
SetKeyDelay -1
Send {Esc up}
return

~*F1::Home
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

~*Numpad8::w
return

~*Numpad9::q
return

~*PgDn::f
return
