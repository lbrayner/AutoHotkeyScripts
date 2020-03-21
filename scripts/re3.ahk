#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()
; mouseID := AHI.GetMouseId(0x093A, 0x2521) ; ELECOM USB Mouse
mouseID := AHI.GetMouseId(0x1B1C, 0x1B75) ; Corsair

AHI.SubscribeMouseButton(mouseID, 5, true, Func("MouseWheelEvent"))

MouseWheelEvent(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe re3demo.exe")
    {
        if(state == 1)
        {
            Send {WheelUp 1}
            return
        }
        Send {WheelDown 1}
        return
    }
    mouse_wheel_var := 100
    if(state == 1) ; UP
    {
        Send {2 DownTemp}
        Sleep mouse_wheel_var
        Send {2 up}
        return
    }
    Send {4 DownTemp}
    Sleep mouse_wheel_var
    Send {4 up}

    return
}

;; interception code END

#IfWinActive, ahk_exe re3demo.exe

global ReadyWeapon := 0

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

~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*Right::
UnreadyWeapon()
down:=A_TickCount
Keywait Right
duration:=(A_TickCount-down)
if(duration<200)
{
    return
}
DoReadyWeapon()
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
return

; Numpad0::
; UnreadyWeapon()
; if GetKeyState("Numpad5")
; {
;     Send {a DownTemp}{Space DownTemp}
;     Send {a up}{Space up}
;     return
; }
; if GetKeyState("Numpad8")
; {
;     Send {d DownTemp}{Space DownTemp}
;     Send {d up}{Space up}
;     return
; }
; if GetKeyState("Numpad4") || GetKeyState("Numpad6")
; {
;     Send {w DownTemp}{Space DownTemp}
;     Send {w up}{Space up}
;     return
; }
; Send {Space DownTemp}
; Send {Space up}
; return

~*RButton::
UnreadyWeapon()
return

~*NumpadEnter::
UnreadyWeapon()
Send {LShift DownTemp}
return

~*NumpadEnter up::
Send {LShift up}
return

*~Home::
UnreadyWeapon()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return

*~Numpad1::
UnreadyWeapon()
return
