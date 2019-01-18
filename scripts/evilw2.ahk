#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  TEW2.exe

CoordMode, Mouse, Screen

global OneEightyAll := 380

OneEighty(x)
{
	MouseMove x,0,25, R
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

~*RButton::
global ReadyWeapon
ReadyWeapon := 0
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

~*Home::Esc
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

~*PgUp::r
return

~*NumpadEnter::
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
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
global ReadyWeapon
if(ReadyWeapon)
{
    return
}
sleep_var := 100
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
return

*WheelDown::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
    return
}
sleep_var := 100
Send {Blind}{3 DownTemp}
Sleep sleep_var
Send {Blind}{3 up}
return

*MButton::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
    return
}
sleep_var := 100
Send {Blind}{4 DownTemp}
Sleep sleep_var
Send {Blind}{4 up}
return

*XButton1::v
return

*XButton2::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
    return
}
sleep_var := 100
Send {Blind}{5 DownTemp}
Sleep sleep_var
Send {Blind}{5 up}
return

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

~*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 50
while(var)
{	
	Send {Blind}{a DownTemp}{f DownTemp}
	Sleep sleep_var	
	Send {Blind}{d DownTemp}{a up}{f up}
	Sleep sleep_var
	Send {Blind}{d up}
}
return

~*NumpadDot up::
var := false
return

