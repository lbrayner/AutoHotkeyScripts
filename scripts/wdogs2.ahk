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

OpenGadgetMenu()
{
    global GadgetMenu
    GadgetMenu := 1
}

CloseGadgetMenu()
{
    global GadgetMenu
    GadgetMenu := 0
}

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

global OneEightyAll :=    7700
global ReadyWeapon := 0
global GadgetMenu := 0

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

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::e
return

~*Right::
SetKeyDelay -1
global GadgetMenu
if(GadgetMenu)
{
	Send {Blind}{b DownTemp}
}
return

~*Right up::
SetKeyDelay -1
Send {Blind}{b up}
return

~*Down::
SetKeyDelay -1
global GadgetMenu
if(GadgetMenu)
{
	Send {Blind}{h DownTemp}
}
return

~*Down up::
SetKeyDelay -1
Send {Blind}{h up}
return

~*WheelDown::
SetKeyDelay -1
global GadgetMenu
sleep_var := 50
if(GadgetMenu)
{
	Send {Blind}{h DownTemp}
    Sleep sleep_var
    Send {Blind}{h up}
}
return

~*PgDn::f
return

~*PgUp::r
return

~*NumpadEnter::
SetKeyDelay -1
OpenGadgetMenu()
UnreadyWeapon()
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
CloseGadgetMenu()
Send {Blind}{LCtrl up}
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
