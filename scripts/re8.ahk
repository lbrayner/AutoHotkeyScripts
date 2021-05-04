#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()
mouseID := AHI.GetMouseId(0x1B1C, 0x1B75) ; Corsair

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
            Send {2 DownTemp}{F1 DownTemp}
            Sleep mouse_wheel_var
            Send {2 up}{F1 up}
            return
        }
        Send {3 DownTemp}{F2 DownTemp}
        Sleep mouse_wheel_var
        Send {3 up}{F2 up}
    }

    return
}

;; interception code END

#IfWinActive, ahk_exe  re8demo.exe

global Attack_var := false

Attack()
{
    global Attack_var
    Attack_var := true
    attack_sleep_var := 50
    UnreadyWeapon()
    while(Attack_var)
    {
        Send {o DownTemp}
        Sleep attack_sleep_var
        Send {o up}
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

    if(!ReadyWeapon)
        return

	ReadyWeapon := 0
	Send {i up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {i DownTemp}
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
Send {LCtrl DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {LCtrl up}
return

~*Numpad7::
SetKeyDelay -1
UnreadyWeapon()
return

~*XButton1::
SetKeyDelay -1
UnreadyWeapon()
return

~*XButton2::
SetKeyDelay -1
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

~*NumpadDot::
SetKeyDelay -1
Attack()
return

~*LButton up::
CeaseAttacking()
return

PgDn::f
return
