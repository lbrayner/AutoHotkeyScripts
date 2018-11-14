#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe destiny2.exe

MouseMoveHorizontally(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
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

~Home::Esc
return

*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{LShift DownTemp}
return

*NumpadEnter up::
SetKeyDelay -1
Send {Blind}{LShift up}
return

~*Numpad2::
MouseMoveHorizontally(13600)
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

~*PgUp::
UnreadyWeapon()
Send {Blind}{r DownTemp}
return

~*PgUp up::
Send {Blind}{r up}
return

~F12::F1
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

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::e
return

~*PgDn::f
return

~*Delete::v
return

~*Insert::Tab
return

~*End::t
return
