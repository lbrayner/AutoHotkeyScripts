#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#IfWinActive, ahk_exe APlagueTaleInnocence_x64.exe

ReadySling := 0

UnReadySling()
{
	global ReadySling

	ReadySling := 0
	Send {Click up right}
}

DoReadySling()
{
    global ReadySling

    if(!ReadySling)
    {
        ReadySling := 1
        Send {Click DownTemp right}
    }
}

ReadyThrow := 0

UnReadyThrow()
{
	global ReadyThrow

	ReadyThrow := 0
	Send {e up}
}

DoReadyThrow()
{
    global ReadyThrow

    if(!ReadyThrow)
    {
        ReadyThrow := 1
        Send {e DownTemp}
    }
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

    if GetKeyState("w") || GetKeyState("a") ||
        GetKeyState("s") || GetKeyState("d")
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
DoReadySling()
return

~*RButton up::
SetKeyDelay -1
UnReadySling()
UnReadyThrow()
return

*Numpad7::
SetKeyDelay -1
DoReadyThrow()
return

*Home::
SetKeyDelay -1
UnReadySling()
UnReadyThrow()
UnRun()
Send {Esc DownTemp}
keywait Home
Send {Esc up}
return

~*PgUp::r
return

~*PgDn::f
return

~*Numpad0::Space
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::
SetKeyDelay -1
UnReadySling()
UnReadyThrow()
Send {Blind}{q DownTemp}
return

~*Numpad9 up::
SetKeyDelay -1
Send {Blind}{q up}
return

~*NumpadEnter::
SetKeyDelay -1
UnReadySling()
UnReadyThrow()
DoRun()
return

~*Insert::Tab
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
