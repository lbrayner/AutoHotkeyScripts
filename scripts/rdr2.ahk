#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#SingleInstance force

#IfWinActive, ahk_exe RDR2.exe

MouseMoveHorizontally(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

Home::
Send {Esc DownTemp}
return

Home up::
Send {Esc up}
return

~*Numpad8::w
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

*NumpadEnter::LShift
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad7::e
return

~*Numpad9::q
return

~*Numpad0::Space
return

~*PgUp::r
return

~*PgDn::f
return

~*Numpad2::
MouseMoveHorizontally(2500)
return

~*XButton1::Tab
return
