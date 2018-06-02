#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe ShadowOfWar.exe

OneEighty(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global Stealth
Stealth := false

EnterStealth()
{
    global Stealth
    
    if(!Stealth)
    {
        Stealth := true
        Send {Blind}{F10 DownTemp}
    }
}

LeaveStealth()
{
    global Stealth
    
    if(Stealth)
    {
        Stealth := false
        Send {Blind}{F10 up}
    }
}

LeaveRanged()
{
    global Ranged
        
    if(Ranged)
    {
        Ranged := 0
        Send {Click up right}
    }
}

EnterRanged()
{
    global Ranged
        
    if(!Ranged)
    {
        Ranged := true
        Send {Click DownTemp right}
    }
}

~*Home::
LeaveStealth()
Send {Blind}{Esc DownTemp}
return

~*Home up::
Send {Blind}{Esc up}
return

~*Numpad2::
global OneEightyAll
OneEighty(3800)
return

~*NumpadEnter::
EnterStealth()
return

~*LButton up::
LeaveStealth()
return

~*RButton::
LeaveStealth()
return

~*RButton up::
LeaveRanged()
return

~*Numpad0::
LeaveStealth()
Send {Blind}{Space DownTemp}
return

~*Numpad0 up::
Send {Blind}{Space up}
return

; ~*Numpad1::
; LeaveStealth()
; return

~*NumpadMult::x
return

~*NumpadDiv::
LeaveStealth()
EnterRanged()
return

~*XButton1::
sleep_var := 50
Send {Blind}{LShift DownTemp}
Sleep sleep_var
Send {Blind}{Click DownTemp}
Sleep sleep_var
Send {Blind}{Click up}{LShift up}
return

~*PgDn::
LeaveStealth()
Send {Blind}{LCtrl DownTemp}
return

~*PgDn up::
Send {Blind}{LCtrl up}
return

~*m::
LeaveStealth()
LeaveRanged()
return
