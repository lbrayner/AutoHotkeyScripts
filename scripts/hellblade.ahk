#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe HellbladeGame-Win64-Shipping.exe

OneEighty(x)
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

~*Numpad0::
UnFocus()
Send {Space DownTemp}
return

~*Numpad0 up::
Send {Space up}
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
global OneEightyAll
OneEighty(4600)
return

~*PgUp::
Focus()
return

~*RButton::
UnFocus()
return
