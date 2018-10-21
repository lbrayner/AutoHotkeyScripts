#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Bioshock2HD.exe

MouseMoveHorizontally(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

~*Home::Esc
return

~*PgUp::r
return

~*PgDn::f
return

~*Delete::v
return

~*Insert::m
return

~*End::t
return

~*Numpad2::
MouseMoveHorizontally(5200)
return

~*Numpad0::Space
return

~*Right::1
return

~*WheelUp::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
return

~*WheelDown::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{3 DownTemp}
Sleep sleep_var
Send {Blind}{3 up}
return

~*XButton1::l
return
