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
            Send {Blind}{a DownTemp}
            return
        }
        Send {Blind}{a up}
        return
    }
}

AHI.SubscribeKey(keyboardId, GetKeySC("Numpad6"), true, Func("Numpad6Event"))

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

    if GetKeyState("LShift")
        Send {Blind}{LShift up}
}

DoRun()
{
    global ShouldRun

    ShouldRun := 1

    if !GetKeyState("LShift")
        Send {Blind}{LShift DownTemp}
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

~*Numpad0::
SetKeyDelay -1
UnShowStatus()
Send {Space DownTemp}
keywait Numpad0
Send {Space up}
return

~*Numpad1::Tab
return

~*Numpad2::x
return

~*Numpad3::z
return

*Numpad5::
SetKeyDelay -1
Send {Blind}{s DownTemp}
return

*Numpad5 up::
SetKeyDelay -1
Send {Blind}{s up}
return

*Numpad8::
SetKeyDelay -1
Send {Blind}{w DownTemp}
return

*Numpad8 up::
SetKeyDelay -1
Send {Blind}{w up}
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

~*NumpadEnter::
SetKeyDelay -1
Send {LShift DownTemp}
keywait NumpadEnter
if !GetKeyState("SC048","P")
{
    TrayTip No!, Numpad8 is not pressed.
    Send {w up}
}
else
    TrayTip Yes!, Numpad8 is pressed.
Send {LShift up}
return

        ; Loop
        ; {
        ;     ; if !GetKeyState("a") && !GetKeyState("s") &&
        ;     ;     !GetKeyState("d") && !GetKeyState("w")
        ;     if !GetKeyState("a")
        ;     {
        ;         UnRun()
        ;         break
        ;     }
        ;     Sleep 500
        ; }

