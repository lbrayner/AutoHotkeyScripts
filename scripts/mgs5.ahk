#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  mgsvtpp.exe

global MouseTurnAll := 5050

MouseTurn(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}


UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {Click up right}
}

UnGrab()
{
	global Grab

    if(Grab)
	{
        Grab := 0
        Send {Click up}
	}
}

global ReadyBinoculars := 0

UnreadyBinoculars()
{
	global ReadyBinoculars

    if(ReadyBinoculars)
	{
        ReadyBinoculars := 0
        Send {e up}
	}
}

DoReadyBinoculars()
{
    global ReadyBinoculars

    if(!ReadyBinoculars)
    {
        ReadyBinoculars := 1
        SetKeyDelay -1
        if !GetKeyState("e")
            Send {e DownTemp}
    }
}

~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return


~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnreadyBinoculars()
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*NumpadDot::
SetKeyDelay -1
global Grab
if(!Grab)
{
	Grab := 1
	Send {Click DownTemp}
}
return

~*LButton up::
SetKeyDelay -1
UnGrab()
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

~*Numpad7::
SetKeyDelay -1
global ReadyBinoculars
Send {e DownTemp}
down:=A_TickCount
Keywait Numpad7
duration:=(A_TickCount-down)
if(duration>200)
{
    DoReadyBinoculars()
    return
}
Send {e up}
return

; ~*Numpad7 up::
; SetKeyDelay -1
; global ReadyBinoculars
; if !ReadyBinoculars
;     Send {e up}
; return

Numpad8::w
return

Numpad9::q
return

; NumpadSub::g
; return

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

~*XButton1::Tab
return

; ~*PgDn::
; SetKeyDelay -1
; global ReadyBinoculars
; global ReadyWeapon
; sleep_var_pg_dn := 50
; if(ReadyBinoculars)
; {
; 	Send {q DownTemp}
; 	Sleep sleep_var_pg_dn
; 	Send {q up}
; }
; if(!ReadyBinoculars && !ReadyWeapon)
; {
; 	ReadyBinoculars := 1
; 	Send {f DownTemp}
; 	return
; }
; if(ReadyWeapon)
; {
; 	UnreadyBinoculars()
; 	Send {f DownTemp}
; 	Sleep sleep_var_pg_dn
; 	Send {f up}
; }
; return

~*PgUp::
Send {r DownTemp}
return

~*PgUp up::
Send {r up}
UnreadyWeapon()
UnGrab()
return

~*Home::
SetKeyDelay -1
UnGrab()
UnreadyBinoculars()
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
UnGrab()
UnreadyBinoculars()
return

Insert::Tab
return

; ~*Delete::
; SetKeyDelay -1
; global ReadyWeapon
; if(ReadyWeapon)
; {
; 	Send {x DownTemp}
; 	return
; }
; Send {v DownTemp}
; return

~*NumpadMult::
SetKeyDelay -1
sleep_var_mult := 100
var_mult := true
UnGrab()
while(var_mult)
{
	Send {Click DownTemp}
	Sleep sleep_var_mult
	Send {Click up}
	Sleep sleep_var_mult
}
return

~*NumpadMult up::
var_mult := false
UnGrab()
return

~*NumpadAdd::
SetKeyDelay -1
sleep_var_plus := 50
var_plus := true
while(var_plus)
{
	Send {e DownTemp}
	Sleep sleep_var_plus
	Send {e up}
	Sleep sleep_var_plus
}
return

~*NumpadAdd up::
var_plus := false
return

~*Delete up::
SetKeyDelay -1
Send {v up}{x up}
return

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

;~*Down::
;Send {2 DownTemp}
;return
;
;~*Down up::
;Send {2 up}
;return
;
;~*Up::
;Send {1 DownTemp}
;return
;
;~*Up up::
;Send {1 up}
;return

~*MButton::
Send {4 DownTemp}
return

~*MButton up::
Send {4 up}
return

~*WheelUp::
global ReadyWeapon
if(ReadyWeapon)
{
    Send {l DownTemp}{l up}
    return
}
Send {1 DownTemp}{p DownTemp}
Send {1 up}{p up}
return

~*WheelDown::
Send {2 DownTemp}{o DownTemp}
Send {2 up}{o up}
return
