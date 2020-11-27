#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe LittleHope-Win64-Shipping.exe

MouseMoveHorizontally(x)
{
    MouseMove, x, 0, 10, Relative
}

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {Click up right}
}

DoReadyWeapon()
{
    global ReadyWeapon
    if(!ReadyWeapon)
    {
        ReadyWeapon := 1
        Send {Click DownTemp right}
    }
}

~*Numpad8::Up
return

~*Numpad4::Left
return

~*Numpad5::Down
return

~*Numpad6::Right
return

*NumpadEnter::LShift
return

~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton::
UnreadyWeapon()
return

*~Home::
UnreadyWeapon()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return

*~Numpad1::
SetKeyDelay -1
UnreadyWeapon()
Send {c DownTemp}
return

*~Numpad1 up::
SetKeyDelay -1
Send {c up}
return

*~Numpad7::
SetKeyDelay -1
UnreadyWeapon()
Send {e DownTemp}
return

*~Numpad7 up::
SetKeyDelay -1
Send {e up}
return

*~PgDn::
SetKeyDelay -1
UnreadyWeapon()
Send {f DownTemp}
return

*~PgDn up::
SetKeyDelay -1
Send {f up}
return

*~PgUp::
SetKeyDelay -1
UnreadyWeapon()
Send {r DownTemp}
return

*~PgUp up::
SetKeyDelay -1
Send {r up}
return

~*Numpad2::
MouseMoveHorizontally(500)
return
