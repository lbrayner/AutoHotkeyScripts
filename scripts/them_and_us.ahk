#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  UDK.exe

MouseMoveVertically(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

~*Numpad2::
MouseMoveVertically(4000)
return

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

    if(!ReadyWeapon)
        return

	ReadyWeapon := 0
	Send {Click up right}
}

global ReadyKnife := false

UnreadyKnife()
{
	global ReadyKnife

    if(!ReadyKnife)
        return

	ReadyKnife := 0
	Send {e up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnreadyKnife()
if(!ReadyWeapon)
{
	ReadyWeapon := true
	Send {Click DownTemp}
}
return

~*Numpad9::
SetKeyDelay -1
global ReadyKnife
UnreadyWeapon()
if(!ReadyKnife)
{
    ReadyKnife := true
    Send {e DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return

*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
Send {LCtrl DownTemp}
return

*NumpadEnter up::
SetKeyDelay -1
Send {LCtrl up}
return

~*PgUp::
SetKeyDelay -1
Send {r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
Send {r up}
return

~*Numpad7::
SetKeyDelay -1
UnreadyKnife()
Send {e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
return

*Home::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
Send {Esc DownTemp}
return

*Home up::
SetKeyDelay -1
Send {Esc up}
return

~*F1::Home
return

~*Numpad0::Space
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

~*Numpad8::w
return

~*PgDn::f
return
