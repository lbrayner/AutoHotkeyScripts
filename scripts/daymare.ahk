#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x1A2C, 0x2D23)

;; Numpad8

AHI.SubscribeKey(keyboardId, GetKeySC("SC048"), true, Func("Numpad8Event"))

Numpad8Event(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Numpad8 DownTemp}
            return
        }
        Send {Numpad8 up}
        return
    }
    if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Blind}{w DownTemp}
            return
        }
        Send {Blind}{w up}
        return
    }
}

;; Numpad4

AHI.SubscribeKey(keyboardId, GetKeySC("SC04B"), true, Func("Numpad4Event"))

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
            Send {Blind}{a DownTemp}
            return
        }
        Send {Blind}{a up}
        return
    }
}

;; Numpad5

AHI.SubscribeKey(keyboardId, GetKeySC("SC04C"), true, Func("Numpad5Event"))

Numpad5Event(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Numpad5 DownTemp}
            return
        }
        Send {Numpad5 up}
        return
    }
    if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Blind}{s DownTemp}
            return
        }
        Send {Blind}{s up}
        return
    }
}

;; Numpad6

AHI.SubscribeKey(keyboardId, GetKeySC("SC04D"), true, Func("Numpad6Event"))

Numpad6Event(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Numpad6 DownTemp}
            return
        }
        Send {Numpad6 up}
        return
    }
    if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Blind}{d DownTemp}
            return
        }
        Send {Blind}{d up}
        return
    }
}

;; Numpad0

AHI.SubscribeKey(keyboardId, GetKeySC("SC052"), true, Func("Numpad0Event"))

Numpad0Event(state)
{
    SetKeyDelay -1
    if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Numpad0 DownTemp}
            return
        }
        Send {Numpad0 up}
        return
    }
    if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
    {
        if(state == 1)
        {
            Send {Blind}{Space DownTemp}
            return
        }
        Send {Blind}{Space up}
        return
    }
}

;; interception code END

#IfWinActive, ahk_exe Daymare_MASTER-Win64-Shipping.exe

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

ShowStatus := 0

UnShowStatus()
{
    global ShowStatus

    ShowStatus := 0

    if GetKeyState("MButton")
        Send {MButton up}
}

DoShowStatus()
{
    global ShowStatus

    ShowStatus := 1

    if !GetKeyState("MButton")
        Send {MButton DownTemp}
}

ShouldRun := 0

UnRun()
{
    global ShouldRun

    ShouldRun := 0

    if GetKeyState("SC02A")
        Send {SC02A up}
}

DoRun()
{
    global ShouldRun

    ShouldRun := 1

    if !GetKeyState("SC02A")
        Send {SC02A DownTemp}
}

Loop
{
    if !GetKeyState("a") && !GetKeyState("s") &&
        !GetKeyState("d") && !GetKeyState("w")
        UnRun()

    sleep 500
}


~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*Home::
SetKeyDelay -1
UnShowStatus()
UnreadyWeapon()
UnRun()
Send {Esc DownTemp}
keywait Home
Send {Esc up}
return

~*XButton1::
DoShowStatus()
return

~*XButton2::
UnShowStatus()
return

~*Insert::F3
return

~*NumpadDot::
qte_var_sleep := 50
qte_var := 1
while(qte_var)
{
    Send {Blind}{Space DownTemp}
    sleep qte_var_sleep
    Send {Blind}{Space up}
}
return

~*NumpadDot up::
SetKeyDelay -1
qte_var := 0
return

~*Numpad1::Tab
return

~*Numpad2::x
return

~*Numpad3::z
return

; Numpad7
*SC047::
SetKeyDelay -1
Send {Blind}{e DownTemp}
return

*SC047 up::
SetKeyDelay -1
Send {Blind}{e up}
return

; Numpad9
*SC049::
SetKeyDelay -1
Send {Blind}{q DownTemp}
return

*SC049 up::
SetKeyDelay -1
Send {Blind}{q up}
return

*PgDn::
SetKeyDelay -1
UnRun()
Send {Blind}{f DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {Blind}{f up}
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

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
UnShowStatus()
DoRun()
return
