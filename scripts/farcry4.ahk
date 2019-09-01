#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()
mouseID := AHI.GetMouseId(0x093A, 0x2521) ; ELECOM USB Mouse

AHI.SubscribeMouseButton(mouseID, 5, true, Func("MouseWheelEvent"))

MouseWheelEvent(state)
{
    if !WinActive("ahk_exe FarCry4.exe")
    {
        if(state == 1)
        {
            Send {WheelUp 1}
            return
        }
        Send {WheelDown 1}
        return
    }
    if WinActive("ahk_exe FarCry4.exe")
    {
        if(state == 1) ; UP
        {
            if GetKeyState("z")
            {
                Send {WheelUp 1}
                return
            }
            Send {2 DownTemp}
            Send {2 up}
            return
        }
        if GetKeyState("z")
        {
            Send {WheelDown 1}
            return
        }
        Send {1 DownTemp}
        Send {1 up}
    }

    return
}

;; interception code END

#IfWinActive, ahk_exe  FarCry4.exe

global MouseTurnAll := 8500

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

EquipCamera := 0

UnEquipCamera()
{
    global EquipCamera

    EquipCamera := 0

    if GetKeyState("z")
        Send {z up}
}

DoEquipCamera()
{
    global EquipCamera

    EquipCamera := 1

    if !GetKeyState("z")
        Send {z DownTemp}
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

Numpad3::
down:=A_TickCount
Keywait Numpad3
duration:=(A_TickCount-down)
if(duration>200)
{
    DoEquipCamera()
    return
}
UnEquipCamera()
Send {z DownTemp}
Send {z up}
return

; Numpad4
SC04B::a
return

; Numpad5
SC04C::s
return

; Numpad6
SC04D::d
return

Numpad7::
SetKeyDelay -1
; UnEquipCamera()
Send {e DownTemp}
return

Numpad7 up::
SetKeyDelay -1
Send {e up}
return

; Numpad8
SC048::w
return

Numpad9::
SetKeyDelay -1
Send {q DownTemp}
return

Numpad9 up::
SetKeyDelay -1
Send {q up}
return

; LShift
~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {SC02A DownTemp}
return

; LShift
~*NumpadEnter up::
SetKeyDelay -1
Send {SC02A up}
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
SetKeyDelay -1
UnreadyWeapon()
Send {r DownTemp}{LCtrl DownTemp}
return

~*PgUp up::
Send {r up}{LCtrl up}
return

; ~*PgUp::
; SetKeyDelay -1
; UnreadyWeapon()
; Send {r DownTemp}
; down:=A_TickCount
; Keywait PgUp
; duration:=(A_TickCount-down)
; if(duration>200)
;     Send {LCtrl DownTemp}
; return

; ~*PgUp up::
; Send {r up}{LCtrl up}
; return

; ~*PgUp::
; Send {r DownTemp}
; return

; ~*PgUp up::
; Send {r up}
; UnreadyWeapon()
; return

~*Home::
SetKeyDelay -1
UnreadyWeapon()
UnEquipCamera()
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

Insert::
SetKeyDelay -1
UnreadyWeapon()
UnEquipCamera()
Send {M DownTemp}
return

Insert up::
Send {M up}
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
Send {1 DownTemp}
return

~*Down up::
Send {1 up}
return

~*Up::
Send {2 DownTemp}
return

~*Up up::
Send {2 up}
return

LCtrl::w
return

; WheelUp::
; Send {2 DownTemp}
; Send {2 up}
; return

; WheelDown::
; Send {1 DownTemp}
; Send {1 up}
; return

; ~*XButton1::MButton
; return

; ~*XButton2::LCtrl
; return
