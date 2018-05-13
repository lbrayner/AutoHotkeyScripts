#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe DOOMx64.exe

OneEighty(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
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

UnreadyWeapon()
{
    global ReadyWeapon
        
    if(ReadyWeapon)
    {
        ReadyWeapon := 0
        Send {Click up right}
    }
}

~*Home::Esc
return

~*Insert::Tab
return

~*NumpadSub::i
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

~*Numpad7::e
return

~*NumpadEnter::LCtrl
return

~*Numpad9::q
return

~*Right::1
return

~*PgDn::f
return

~*PgUp::r
return

~*WheelUp::
SetKeyDelay -1
sleep_var := 50
Send {Blind}{4 DownTemp}
Sleep sleep_var
Send {Blind}{4 up}
return

~*WheelDown::
SetKeyDelay -1
global Modifier1
sleep_var := 50
if(Modifier1)
{
    Send {Blind}{9 DownTemp}
    Sleep sleep_var
    Send {Blind}{9 up}
    return
}
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
return

~*Numpad2::
global OneEightyAll
OneEighty(16500)
return

~*Numpad3::
EnableModifier1()
return

~*Numpad3 up::
DisableModifier1()
return

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
