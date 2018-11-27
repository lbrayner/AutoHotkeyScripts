#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  SOTTR.exe

global ReadyWeapon := 0
global Walk := 0
global Modifier1 := false

global OneEighty := 5900

MouseMoveHorizontally(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnWalk()
{
    global Walk

    Walk =: 0
    Send {Blind}{F6 up}
}
	
Walk()
{
    global Walk

    Walk =: 1
    Send {Blind}{F6 DownTemp}
}

EnableModifier1()
{
    global Modifier1

    if(!Modifier1)
    {
        Modifier1 := true
    }
}

DisableModifier1()
{
    global Modifier1
    Modifier1 := false
}

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
UnreadyWeapon()
return

*Numpad1::
SetKeyDelay -1
var := true
sleep_var := 100
UnreadyWeapon()
Send {Blind}{F7 DownTemp}
while(var)
{	
	Send {Blind}{c DownTemp}
	Sleep sleep_var	
	Send {Blind}{c up}
	Sleep sleep_var	
}
return

*Numpad1 up::
var := false
Send {Blind}{F7 up}
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
UnWalk()
return

*~Insert::
UnreadyWeapon()
return

*~Home::
UnreadyWeapon()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return


*~SC07E::
Send {f DownTemp}
return

*~SC07E up::
Send {f up}
return

NumpadSub::c
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 100
while(var)
{	
	Send {Blind}{Numpad4 DownTemp}
	Sleep sleep_var	
	Send {Blind}{Numpad4 up}{Numpad6 DownTemp}
	Sleep sleep_var	
	Send {Blind}{Numpad6 up}
}
return

*NumpadDot up::
var := false
return

~*NumpadEnter::
UnreadyWeapon()
UnWalk()
EnableModifier1()
return

~*NumpadEnter up::
DisableModifier1()
return

*Numpad7::
SetKeyDelay -1
sleep_var := 50
var := true
while(var)
{
    Send {Blind}{e DownTemp}
    Sleep sleep_var
    Send {Blind}{e up}
    Sleep sleep_var
}
return

*Numpad7 up::
var := false
return

~*PgDn::
SetKeyDelay -1
global ReadyWeapon
global Modifier1
if(Modifier1)
{
    alt := true
}
if(ReadyWeapon || alt)
{
    Send {Blind}{F5 DownTemp}
    return
}
sleep_var := 50
var := true
while(var)
{
    Send {Blind}{f DownTemp}
    Sleep sleep_var
    Send {Blind}{f up}
    Sleep sleep_var
}
return

~*PgDn up::
var := false
alt := false
DisableModifier1()
Send {Blind}{F5 up}
return

F12::Escape

*~Numpad2::
global OneEighty
MouseMoveHorizontally(OneEighty)
return

*~XButton2::4
return

~*XButton1::
global ReadyWeapon
if(ReadyWeapon)
{
    Send {Blind}{F8 DownTemp}
    return
}
Walk()
return

~*XButton1 up::
Send {Blind}{F8 up}
return
