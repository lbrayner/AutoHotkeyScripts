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
        Send {Space}
    }
}


Cover()
{
    global Cover
        
    if(!Cover)
    {
        Cover := 1
        Send {Space DownTemp}
    }
}

~*Numpad2::
MouseMoveHorizontally(600)
return

~*Home::Esc
return

~*Numpad0::
SetKeyDelay -1
Cover()
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad7::
SetKeyDelay -1
UnCover()
Send {e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
Send {Space}
return

~*Numpad8::w
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::q
return

~*PgUp::r
return

*PgDn::f
return

~*Insert::Tab
return

~*End::t
return

~*Right::
SetKeyDelay -1
global Cycle
if(Cycle)
    Send {1}
else
    Send {2}
Cycle := !Cycle
return

~*NumpadDiv::
SetKeyDelay -1
Send {Click right}
return
