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

    if WinActive("ahk_exe TEW2.exe")
    {
        mouse_wheel_var := 100
        if(state == 1)
        {
            Send {2 DownTemp}{PgUp DownTemp}
            Sleep mouse_wheel_var
            Send {2 up}{PgUp up}
            return
        }
        Send {3 DownTemp}{PgDn DownTemp}
        Sleep mouse_wheel_var
        Send {3 up}{PgDn up}
        return
    }

    if(state == 1)
    {
        Send {WheelUp 1}
        return
    }
    Send {WheelDown 1}

    return
}

;; interception code END

#IfWinActive, ahk_exe  TEW2.exe

CoordMode, Mouse, Screen

UnreadyWeapon()
{
	global WeaponReady
    if(WeaponReady)
    {
        Run kill_interaccel.bat, "", Hide
        WeaponReady := 0
        Send {Click up right}
    }
}

ReadyWeapon()
{
    global WeaponReady
    if(!WeaponReady)
    {	
        Run run_interaccel.bat, "", Hide
        WeaponReady := 1
        Send {Click DownTemp right}
    }
}

~*RButton::
UnreadyWeapon()
return

~*NumpadDiv::
SetKeyDelay -1
ReadyWeapon()
return

*Home::Esc
return

~*Numpad4::
SetKeyDelay -1
Send {Blind}{a DownTemp}
return

~*Numpad4 up::
SetKeyDelay -1
Send {Blind}{a up}
return

~*Numpad5::
SetKeyDelay -1
Send {s DownTemp}
return

~*Numpad5 up::
SetKeyDelay -1
Send {s up}
return

~*Numpad6::d
return

~*Numpad8::
SetKeyDelay -1
global Numpad2_down
if(Numpad2_down)
{
    return
}
global Numpad8_down := true
Send {Blind}{w DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
global Numpad8_down := false
Send {Blind}{w up}
return

~*Numpad0::
SetKeyDelay -1
Send {Space DownTemp}
return

~*Numpad0 up::
SetKeyDelay -1
Send {Space up}
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::
SetKeyDelay -1
Send {e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
return

*PgDn::
SetKeyDelay -1
Send {f DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {f up}
return

~*End::t
return

~*PgUp::
SetKeyDelay -1
Send {r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
Send {r up}
return

~*NumpadMult::Home
return

~*NumpadSub::End
return

*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

*NumpadEnter up::
SetKeyDelay -1
Send {Blind}{LCtrl up}
return

~*Delete::v
return

~*Insert::Tab
return

~*Right::1
return

~*Left::5
return

~*Up::6
return

~*Down::7
return

*WheelUp::
SetKeyDelay -1
global WeaponReady
if(WeaponReady)
{
    return
}
sleep_var := 100
Send {2 DownTemp}
Sleep sleep_var
Send {2 up}
return

*WheelDown::
SetKeyDelay -1
global WeaponReady
if(WeaponReady)
{
    return
}
sleep_var := 100
Send {3 DownTemp}
Sleep sleep_var
Send {3 up}
return

*MButton::
SetKeyDelay -1
global WeaponReady
if(WeaponReady)
{
    return
}
sleep_var := 100
Send {4 DownTemp}
Sleep sleep_var
Send {4 up}
return

; *XButton1::v
; return

*XButton2::
SetKeyDelay -1
global WeaponReady
if(WeaponReady)
{
    return
}
sleep_var := 100
Send {5 DownTemp}
Sleep sleep_var
Send {5 up}
return

~*Numpad2::
SetKeyDelay -1
global Numpad2_down := true
global Numpad8_down
if(Numpad8_down)
{
    Send {w up}
}
Send {s DownTemp}
Sleep 50
Send {f DownTemp}
Sleep 50
Send {s up}{f up}
if(Numpad8_down)
{
    Send {w DownTemp}
}
return

~*Numpad2 up::
global Numpad2_down := false
return

~*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 50
while(var)
{	
	Send {a DownTemp}{f DownTemp}
	Sleep sleep_var	
	Send {d DownTemp}{a up}{f up}
	Sleep sleep_var
	Send {d up}
}
return

~*NumpadDot up::
var := false
return
