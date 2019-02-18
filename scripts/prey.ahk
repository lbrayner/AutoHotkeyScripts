#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe Prey.exe

MouseMoveVertically(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

; UnFocus()
; {
;     global Focus
        
;     if(Focus)
;     {
;         Focus := 0
;         Send {q up}
;     }
; }


; Focus()
; {
;     global Focus
        
;     if(!Focus)
;     {
;         Focus := 1
;         Send {q DownTemp}
;     }
; }

~*Home::Esc
return

~*Insert::Tab
return

~*Numpad3::z
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad8::w
return

~*Numpad0::Space
return

~*Numpad9::q
return

~*Numpad1::c
return

~*Numpad7::
Send {e DownTemp}
return

~*Numpad7 up::
Send {e up}
return

~*NumpadEnter::LShift
return

~*PgDn::
Send {f DownTemp}
return

~*PgDn up::
Send {f up}
return

~*Numpad2::
MouseMoveVertically(4600)
return

~*PgUp::r
return

; ~*RButton::
; return
