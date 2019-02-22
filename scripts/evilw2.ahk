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
            Send {2 DownTemp}
            Sleep mouse_wheel_var
            Send {2 up}
            return
        }
        Send {3 DownTemp}
        Sleep mouse_wheel_var
        Send {3 up}
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
    Run kill_interaccel.bat, "", Hide
	global WeaponReady
    if(WeaponReady)
    {
        WeaponReady := 0
        Send {Click up right}
    }
}

ReadyWeapon()
{
    Run run_interaccel.bat, "", Hide
    global WeaponReady
    if(!WeaponReady)
    {	
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

~*Numpad4::a
return

~*Numpad5::s
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
Send {w DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
Send {w up}
global Numpad8_down := false
return

~*Numpad0::Space
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::e
return

~*PgDn::f
return

~*PgUp::r
return

~*NumpadMult::Home
return

~*NumpadSub::End
return

~*NumpadEnter::
UnreadyWeapon()
Send {LCtrl DownTemp}
return

~*NumpadEnter up::
Send {LCtrl up}
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
Send {Space DownTemp}
Sleep 50
Send {s up}{Space up}
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
