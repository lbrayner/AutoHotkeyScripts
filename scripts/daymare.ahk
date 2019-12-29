#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#IfWinActive, ahk_exe Daymare_MASTER-Win64-Shipping.exe

ReadyWeapon := 0

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

ShowStatus := 0

UnShowStatus()
{
    global ShowStatus

    ShowStatus := 0

    if GetKeyState("MButton")
        Send {MButton up}
}

DoShowStatus()
{
    global ShowStatus

    ShowStatus := 1

    if !GetKeyState("MButton")
        Send {MButton DownTemp}
}

ShowStatus()
{
    global ShowStatus
    if ShowStatus
        UnShowStatus()
    else
        DoShowStatus()
}

ShouldRun := 0

UnRun()
{
    global ShouldRun

    ShouldRun := 0

    if GetKeyState("SC01D")
        Send {SC01D up}
}

DoRun()
{
    global ShouldRun

    ShouldRun := 1

    if GetKeyState("w")
        if !GetKeyState("SC01D")
            Send {SC01D DownTemp}
}

Loop
{
    if !GetKeyState("a") && !GetKeyState("s") &&
        !GetKeyState("d") && !GetKeyState("w")
        UnRun()

    sleep 500
}


~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*Home::
SetKeyDelay -1
UnShowStatus()
UnreadyWeapon()
UnRun()
Send {Esc DownTemp}
keywait Home
Send {Esc up}
return

~*XButton1::
ShowStatus()
return

~*XButton2::4
return

~*Insert::F3
return

~*NumpadDot::
qte_var_sleep := 50
qte_var := 1
while(qte_var)
{
    Send {Blind}{Space DownTemp}
    sleep qte_var_sleep
    Send {Blind}{Space up}
}
return

~*NumpadDot up::
SetKeyDelay -1
qte_var := 0
return

~*Numpad1::Tab
return

~*Numpad3::z
return

*Numpad7::
SetKeyDelay -1
Send {Blind}{e DownTemp}
return

*Numpad7 up::
SetKeyDelay -1
Send {Blind}{e up}
return

; Numpad9
*Numpad9::
SetKeyDelay -1
Send {Blind}{q DownTemp}
return

*Numpad9 up::
SetKeyDelay -1
Send {Blind}{q up}
return

*PgDn::
SetKeyDelay -1
UnRun()
Send {Blind}{f DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {Blind}{f up}
return

~*PgUp::r
return

~*WheelUp::
Send {1 DownTemp}
Send {1 up}
return

~*WheelDown::
Send {2 DownTemp}
Send {2 up}
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
UnShowStatus()
DoRun()
return

~*Numpad2::x
return

~*Numpad0::Space
return

; Movement
; Movement
; Movement

~*Numpad8::w
return
~*Numpad4::a
return
~*Numpad5::s
return
~*Numpad6::d
return
