#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  WatchDogs2.exe


UnreadyWeapon()
{
    global ReadyWeapon
        
    if(ReadyWeapon)
    {
        ReadyWeapon := 0
        Send {Click up right}
    }
}

EnableModifier1()
{
    global Modifier1
    Modifier1 := 1
}

DisableModifier1()
{
    global Modifier1
    Modifier1 := 0
}

EnableModifier2()
{
    global Modifier2
    Modifier2 := 1
}

DisableModifier2()
{
    global Modifier2
    Modifier2 := 0
}

EnableModifier3()
{
    global Modifier3
    Modifier3 := 1
}

DisableModifier3()
{
    global Modifier3
    Modifier3 := 0
}


OneEighty(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global OneEightyAll :=    7700
global ReadyWeapon := 0
global Modifier1 := 0

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

*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{Esc DownTemp}
return

*Home up::
SetKeyDelay -1
Send {Blind}{Esc up}
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad8::w
return

~*Numpad0::Space
return

~*Numpad1::c
return

~*Numpad3::
EnableModifier3()
return

~*Numpad3 up::
DisableModifier3()
return

~*Numpad7::e
return

~*Right::
SetKeyDelay -1
global Modifier1
global Modifier2
if(Modifier1)
{
    Send {Blind}{b DownTemp}
    return
}
if(Modifier2)
{
    Send {Blind}{1 DownTemp}
}
return

~*Right up::
SetKeyDelay -1
Send {Blind}{b up}{1 up}
return

~*Down::
SetKeyDelay -1
global Modifier1
global Modifier2
if(Modifier1)
{
    Send {Blind}{h DownTemp}
}
if(Modifier2)
{
    Send {Blind}{2 DownTemp}
}
return

~*Down up::
SetKeyDelay -1
Send {Blind}{h up}{2 up}
return

~*Up::
SetKeyDelay -1
global Modifier2
if(Modifier2)
{
    Send {Blind}{3 DownTemp}
}
return

~*Up up::
SetKeyDelay -1
Send {Blind}{3 up}
return

~*WheelUp::
SetKeyDelay -1
global Modifier1
global Modifier2
global Modifier3
sleep_var := 50
if(Modifier1)
{
    Send {Blind}{9 DownTemp}
    Sleep sleep_var
    Send {Blind}{9 up}
    return
}
if(Modifier2)
{
    Send {Blind}{3 DownTemp}
    Sleep sleep_var
    Send {Blind}{3 up}
    return
}
; if(Modifier3)
; {
;     Send {Blind}{4 DownTemp}
;     Sleep sleep_var
;     Send {Blind}{4 up}
; }
return

*LButton::
global Modifier1
sleep_var := 50
if(Modifier1)
{
    Send {Blind}{g DownTemp}
    Sleep sleep_var
    Send {Blind}{g up}
    return
}
Send {Click DownTemp}
return

*LButton up::
Send {Click up}
return

~*WheelDown::
SetKeyDelay -1
global Modifier1
global Modifier2
sleep_var := 50
if(Modifier1)
{
    Send {Blind}{h DownTemp}
    Sleep sleep_var
    Send {Blind}{h up}
}
if(Modifier2)
{
    Send {Blind}{2 DownTemp}
    Sleep sleep_var
    Send {Blind}{2 up}
}
return

~*PgDn::f
return

~*PgUp::r
return

~*NumpadEnter::
SetKeyDelay -1
EnableModifier1()
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
DisableModifier1()
Send {Blind}{LCtrl up}
return

~*Numpad9::
SetKeyDelay -1
EnableModifier2()
return

~*Numpad9 up::
SetKeyDelay -1
DisableModifier2()
return

~*Delete::v
return

~*End::t
return

~*Insert::Tab
return

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

LCtrl::w
return

~*LAlt::XButton1
return

~*XButton2::
global Modifier1
global Modifier2
sleep_var := 50
if(Modifier1)
{
    Send {Blind}{4 DownTemp}
    Sleep sleep_var
    Send {Blind}{4 up}
    return
}
if(Modifier2)
{
    Send {Blind}{5 DownTemp}
    Sleep sleep_var
    Send {Blind}{5 up}
    return
}
Send {NumpadSub DownTemp}
return

~*XButton2 up::
Send {NumpadSub up}
return
