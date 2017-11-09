#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  case.exe

global OneEightyAll := 3600

OneEighty(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

Home::Esc
return

~*Right::
SetKeyDelay -1
Send {Blind}{1 DownTemp}
return

~*Right up::
SetKeyDelay -1
Send {Blind}{1 up}
return

;*WheelUp::
;SetKeyDelay -1
;sleep_var := 50
;Send {Blind}{2 DownTemp}
;Sleep sleep_var
;Send {Blind}{2 up}
;return
;
;*WheelDown::
;SetKeyDelay -1
;sleep_var := 50
;Send {Blind}{3 DownTemp}
;Sleep sleep_var
;Send {Blind}{3 up}
;return


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

~*Numpad9::
SetKeyDelay -1
Send {Blind}{Click DownTemp}
return

~*Numpad9 up::
SetKeyDelay -1
Send {Blind}{Click up}
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
