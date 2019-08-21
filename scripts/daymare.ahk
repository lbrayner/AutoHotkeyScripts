#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x1A2C, 0x2D23)
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad4"), true, Func("Numpad4Event"))

Numpad4Event(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Numpad4 DownTemp}
            return
        }
        Send {Numpad4 up}
        return
    }
    if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {a DownTemp}
            return
        }
        Send {a up}
        return
    }
}

;; interception code END

#IfWinActive, ahk_exe Daymare_MASTER-Win64-Shipping.exe

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

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*Home::Esc
return

~*XButton1::Tab
return

~*Insert::Tab
return

~*Numpad0::Space
return

~*Numpad1::Tab
return

~*Numpad2::x
return

~*Numpad3::z
return

Numpad5::
SetKeyDelay -1
Send {s DownTemp}
return

Numpad5 up::
SetKeyDelay -1
Send {s up}
return

Numpad6::
SetKeyDelay -1
Send {d DownTemp}
return

Numpad6 up::
SetKeyDelay -1
Send {d up}
return

Numpad8::
SetKeyDelay -1
Send {w DownTemp}
return

Numpad8 up::
SetKeyDelay -1
Send {w up}
return

~*Numpad7::e
return

~*Numpad9::q
return

~*PgDn::f
return

~*PgUp::r
return

~*WheelUp::
Send {1 DownTemp}
Send {1 up}
return

~*WheelDown::
Send {2 DownTemp}
Send {2 up}
return

~Up::4
return

NumpadEnter::
SetKeyDelay -1
Send {LShift DownTemp}
keywait NumpadEnter
Send {LShift up}
return
