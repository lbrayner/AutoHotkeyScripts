#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()
mouseID := AHI.GetMouseId(0x093A, 0x2521) ; ELECOM USB Mouse

AHI.SubscribeMouseButton(mouseID, 5, true, Func("MouseWheelEvent"))

MouseWheelEvent(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe re7.exe")
    {
        if(state == 1)
        {
            Send {WheelUp 1}
            return
        }
        Send {WheelDown 1}
        return
    }
    if WinActive("ahk_exe re7.exe")
    {
        mouse_wheel_var := 100
        if(state == 1) ; UP
        {
            Send {2 DownTemp}
            Sleep mouse_wheel_var
            Send {2 up}
            return
        }
        Send {3 DownTemp}
        Sleep mouse_wheel_var
        Send {3 up}
    }

    return
}

;; interception code END

#IfWinActive, ahk_exe  re7.exe

Attack()
{
    global Attack_var
    Attack_var := true
    attack_sleep_var := 50
    UnreadyWeapon()
    while(Attack_var)
    {
        Send {p DownTemp}
        Sleep attack_sleep_var
        Send {p up}
        Sleep attack_sleep_var
    }
}

CeaseAttacking()
{
    global Attack_var
    Attack_var := false
}

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {Click up right}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
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

~*Space::
SetKeyDelay -1
UnreadyWeapon()
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

~*PgUp::
UnreadyWeapon()
return

; ~*MButton::
; SetKeyDelay -1
; sleep_var := 50
; Send {1 DownTemp}
; Sleep sleep_var
; Send {1 up}
; return


~*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Esc up}
return

~*NumpadDot::
SetKeyDelay -1
Attack()
return

; ~*NumpadDot up::
; CeaseAttacking()
; return

~*LButton up::
CeaseAttacking()
return

PgDn::f
return
