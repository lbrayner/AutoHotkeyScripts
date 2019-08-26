#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  FarCry4.exe

global MouseTurnAll := 5050

MouseTurn(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {Click up right}
}

DoReadyWeapon()
{
    global ReadyWeapon

    if(!ReadyWeapon)
    {
        ReadyWeapon := 1
        Send {Click DownTemp right}
    }
}

~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return

~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

Numpad0::Space
return

Numpad1::c
return

Numpad3::z
return

Numpad4::a
return

Numpad5::s
return

Numpad6::d
return

Numpad7::e
return

Numpad8::w
return

Numpad9::q
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {LShift DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {LShift up}
return

~*PgDn::
SetKeyDelay -1
Send {f DownTemp}
return

~*PgDn up::
SetKeyDelay -1
Send {f up}
return

~*PgUp::
Send {r DownTemp}
return

~*PgUp up::
Send {r up}
UnreadyWeapon()
return

~*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Esc up}
return

~*Esc::
SetKeyDelay -1
UnreadyWeapon()
; UnGrab()
; UnreadyBinoculars()
return

Insert::Tab
return

; ~*NumpadMult::
; SetKeyDelay -1
; sleep_var_mult := 100
; var_mult := true
; while(var_mult)
; {
; 	Send {Click DownTemp}
; 	Sleep sleep_var_mult
; 	Send {Click up}
; 	Sleep sleep_var_mult
; }
; return

; ~*NumpadMult up::
; var_mult := false
; return

~*Right::
SetKeyDelay -1
Send {3 DownTemp}
return

~*Right up::
SetKeyDelay -1
Send {3 up}
return

~*Left::
Send {4 DownTemp}
return

~*Left up::
Send {4 up}
return

~*Down::
Send {2 DownTemp}
return

~*Down up::
Send {2 up}
return

~*Up::
Send {1 DownTemp}
return

~*Up up::
Send {1 up}
return

~*MButton::
Send {4 DownTemp}
return

~*MButton up::
Send {4 up}
return

LCtrl::w
return

~*WheelUp::
Send {1 DownTemp}
Send {1 up}
return

~*WheelDown::
Send {2 DownTemp}
Send {2 up}
return
