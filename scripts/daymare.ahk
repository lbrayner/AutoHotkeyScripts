#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()

keyboardId := AHI.GetKeyboardId(0x1A2C, 0x2D23)

;; Numpad8

AHI.SubscribeKey(keyboardId, GetKeySC("Numpad8"), true, Func("Numpad8Event"))

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

; ;; Numpad5

; AHI.SubscribeKey(keyboardId, GetKeySC("Numpad5"), true, Func("Numpad5Event"))

; Numpad5Event(state)
; {
;     SetKeyDelay -1
;     if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
;     {
;         if(state == 1)
;         {
;             Send {Numpad5 DownTemp}
;             return
;         }
;         Send {Numpad5 up}
;         return
;     }
;     if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
;     {
;         if(state == 1)
;         {
;             Send {Blind}{s DownTemp}
;             return
;         }
;         Send {Blind}{s up}
;         return
;     }
; }

; ;; Numpad6

; AHI.SubscribeKey(keyboardId, GetKeySC("Numpad6"), true, Func("Numpad6Event"))

; Numpad6Event(state)
; {
;     SetKeyDelay -1
;     if !WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
;     {
;         if(state == 1)
;         {
;             Send {Numpad6 DownTemp}
;             return
;         }
;         Send {Numpad6 up}
;         return
;     }
;     if WinActive("ahk_exe Daymare_MASTER-Win64-Shipping.exe")
;     {
;         if(state == 1)
;         {
;             Send {Blind}{d DownTemp}
;             return
;         }
;         Send {Blind}{d up}
;         return
;     }
; }

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

; ; Numpad4
; *SC04B::
; SetKeyDelay -1
; Send {Blind}{a DownTemp}
; return

; *SC04B up::
; SetKeyDelay -1
; Send {Blind}{a up}
; return

*SC04D::
SetKeyDelay -1
Send {Blind}{d DownTemp}
return

*SC04D up::
SetKeyDelay -1
Send {Blind}{d up}
return

*Numpad5::
SetKeyDelay -1
Send {Blind}{s DownTemp}
return

*Numpad5 up::
SetKeyDelay -1
Send {Blind}{s up}
return

; ; Numpad8
; *SC048::
; SetKeyDelay -1
; Send {Blind}{w DownTemp}
; return

; *SC048 up::
; SetKeyDelay -1
; Send {Blind}{w up}
; return

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
Send {LShift up}
return
