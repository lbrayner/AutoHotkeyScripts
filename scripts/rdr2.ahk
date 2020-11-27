#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe RDR2.exe

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

~*PgUp::r
return

~*PgDn::f
return

