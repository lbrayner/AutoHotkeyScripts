#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe conviction_game.exe

MouseMoveHorizontally(x)
{
    MouseMove, x, 0, 5, Relative
}

UnCover()
{
    global Cover

    if(Cover)
    {
        Cover := 0
        Send {f up}
    }
}


Cover()
{
    global Cover

    if(!Cover)
    {
        Cover := 1
        if !GetKeyState("f")
            Send {f DownTemp}
    }
}

UnreadyWeapon()
{
	global WeaponReady
    if(WeaponReady)
    {
        Run kill_interaccel.bat, "", Hide
        WeaponReady := 0
        Send {Click up right}
    }
}

ReadyWeapon()
{
    global WeaponReady
    if(!WeaponReady)
    {
        Run run_interaccel.bat, "", Hide
        WeaponReady := 1
        Send {Click DownTemp right}
    }
}

~*RButton::
UnreadyWeapon()
Send {Click middle}
return

~*NumpadDiv::
SetKeyDelay -1
ReadyWeapon()
Send {Click middle}
return

~*Numpad2::
MouseMoveHorizontally(200)
return

~*Home::
SetKeyDelay -1
Send {Esc}
UnCover()
return

~*Numpad0::Space
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

~*Numpad3::z
return

~*Numpad1::
SetKeyDelay -1
UnCover()
Send {c DownTemp}
return

~*Numpad1 up::
SetKeyDelay -1
Send {c up}
return

~*Numpad9::q
return

~*PgUp::r
return

~*PgDn::
SetKeyDelay -1
Send {f DownTemp}
down:=A_TickCount
Keywait PgDn
duration:=(A_TickCount-down)
If (duration>500)
    Cover()
Return

~*PgDn up::
SetKeyDelay -1
global Cover
if !Cover
    Send {f up}
Return

~*Insert::Tab
return

~*End::t
return

*Right::
SetKeyDelay -1
global Cycle
if(Cycle)
    Send {1}
else
    Send {2}
Cycle := !Cycle
return
