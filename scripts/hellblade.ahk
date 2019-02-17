#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe HellbladeGame-Win64-Shipping.exe

MouseMoveVertically(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

UnFocus()
{
    global Focus
        
    if(Focus)
    {
        Focus := 0
        Send {q up}
    }
}


Focus()
{
    global Focus
        
    if(!Focus)
    {
        Focus := 1
        Send {q DownTemp}
    }
}

~*Home::Esc
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad8::w
return

*Numpad0::
SetKeyDelay -1
UnFocus()
numpad0_sleep_var := 50
numpad0_var := true
while(numpad0_var)
{
    Send {Blind}{Space DownTemp}
    Sleep numpad0_sleep_var
    Send {Blind}{Space up}
    Sleep numpad0_sleep_var
}
return

*Numpad0 up::
numpad0_var := false
return

~*Numpad1::c
return

~*Numpad7::
UnFocus()
Send {e DownTemp}
return

~*Numpad7 up::
Send {e up}
return

~*Numpad9::
Focus()
return

~*Numpad9 up::
UnFocus()
return

~*NumpadEnter::LCtrl
return

~*PgDn::
UnFocus()
Send {f DownTemp}
return

~*PgDn up::
Send {f up}
return

~*Numpad2::
MouseMoveVertically(4600)
return

~*PgUp::
Focus()
return

~*RButton::
UnFocus()
return
