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
    if !WinActive("ahk_exe re2.exe")
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
    if(state == 1)
    {
        Send {Up DownTemp}
        Sleep mouse_wheel_var
        Send {Up up}
        return
    }
    Send {Down DownTemp}
    Sleep mouse_wheel_var
    Send {Down up}
    return
}

;; interception code END

#IfWinActive, ahk_exe re2.exe

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

global ReadyKnife := 0

UnreadyKnife()
{
	global ReadyKnife
		
	ReadyKnife := 0
	Send {e up}
}

~*NumpadDiv::
SetKeyDelay -1
UnreadyKnife()
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
global ReadyKnife
if(!ReadyKnife)
{	
	ReadyKnife := 1
	Send {e DownTemp}
}
return

~*Numpad7::
SetKeyDelay -1
UnreadyWeapon()
return

~*Numpad7 up::
SetKeyDelay -1
UnreadyKnife()
return

~*RButton::
UnreadyWeapon()
UnreadyKnife()
return

~*NumpadEnter::
UnreadyWeapon()
UnreadyKnife()
Send {LShift DownTemp}
return

~*NumpadEnter up::
Send {LShift up}
return

*~Home::
UnreadyWeapon()
UnreadyKnife()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return

*~Numpad1::
UnreadyWeapon()
UnreadyKnife()
return
