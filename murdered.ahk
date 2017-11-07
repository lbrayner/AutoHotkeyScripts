#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Murdered.exe

global OneEightyAll := 5500

OneEighty(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

Home::Esc
return


~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

Numpad8::w
return
Numpad4::a
return
Numpad5::s
return
Numpad6::d
return

SC02B::Tab
return

Delete::t
return

~*Numpad9::
SetKeyDelay -1
Send {Blind}{q DownTemp}
return

~*Numpad9 up::
SetKeyDelay -1
Send {Blind}{q up}
return

~*Numpad0::
SetKeyDelay -1
Send {Blind}{Space DownTemp}
return

~*Numpad0 up::
SetKeyDelay -1
Send {Blind}{Space up}
return

~*PgUp::
SetKeyDelay -1
Send {Blind}{r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
Send {Blind}{r up}
return

~*Numpad7::
SetKeyDelay -1
Send {Blind}{e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {Blind}{e up}
return

~*PgDn::
SetKeyDelay -1
Send {Blind}{f DownTemp}
return

~*PgDn up::
SetKeyDelay -1
Send {Blind}{f up}
return

~*NumpadEnter::
SetKeyDelay -1
Send {Blind}{LShift DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {Blind}{LShift up}
return
