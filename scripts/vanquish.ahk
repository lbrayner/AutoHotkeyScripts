#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#IfWinActive, ahk_exe Vanquish.exe

MouseEventMoveX(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

ReadyWeapon := 0

UnReadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
    if GetKeyState("RButton")
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

~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton up::
SetKeyDelay -1
UnReadyWeapon()
return

~*Numpad2::
MouseEventMoveX(2950)
return

*Home::
SetKeyDelay -1
UnReadyWeapon()
Send {Esc DownTemp}
keywait Home
Send {Esc up}
return

~*PgDn::
SetKeyDelay -1
Send {Return DownTemp}
keywait PgDn
Send {Return up}
return
