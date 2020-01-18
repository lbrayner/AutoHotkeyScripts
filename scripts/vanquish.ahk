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

    if !GetKeyState("RButton")
    {
        ReadyWeapon := 1
        Send {Click DownTemp right}
    }
}

ShouldBoost := 0

UnBoost()
{
    global ShouldBoost

    ShouldBoost := 0

    if GetKeyState("SC01D")
        Send {SC01D up}
}

DoBoost()
{
    global ShouldBoost

    ShouldBoost := 1

    if !GetKeyState("SC01D")
        Send {SC01D DownTemp}
}

~*NumpadDiv::
SetKeyDelay -1
UnBoost()
DoReadyWeapon()
return

~*RButton::
UnBoost()
return

~*RButton up::
SetKeyDelay -1
UnReadyWeapon()
return

~*NumpadEnter::
SetKeyDelay -1
DoBoost()
return

~*Numpad0::
SetKeyDelay -1
UnBoost()
return

~*Numpad7::
SetKeyDelay -1
UnBoost()
return

~*Numpad2::
MouseEventMoveX(3500)
return

*Home::
SetKeyDelay -1
UnBoost()
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
