#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Overwatch.exe

CoordMode, Mouse, Screen

global OneEightyAll :=    10600
global OneEightyTracer := 7700
global OneEightyWidow :=  7700

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnFire()
{
	global Fire
		
	Fire := 0
	Send {Click up}
}

StopJumping()
{
	global Var_jumping
	Var_jumping := false
}

StopFloating()
{
    global Floating
	Send {Blind}{Space up}
    Floating := false
}

ModeZero()
{
	global ModeOne
	global ModeTwo
	global ModeThree
	global ModeFour
	ModeOne := false
	ModeTwo := false
	ModeThree := false
	ModeFour := false
}

StopMeleeing()
{
	global Melee
	Melee := false
}

StartJumping()
{
	global Var_jumping
	Var_jumping := true
	sleep_var_jumping := 100
	while(Var_jumping)
	{	
		Send {Blind}{Space DownTemp}
		Sleep sleep_var_jumping
		Send {Blind}{Space up}
		Sleep sleep_var_jumping
	}
}

Ult()
{
    sleep_var_ult := 100
    Send {Blind}{q DownTemp}
    Sleep sleep_var_ult
    Send {Blind}{q up}
}

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

Tracer()
{
    global OneEightyTracer
	sleep_var_tracer := 50
	UnFire()
	Send {Blind}{Click DownTemp right}
	Sleep sleep_var_tracer
	Send {Blind}{Click up right}
	Sleep sleep_var_tracer
	OneEighty(OneEightyTracer)
}

Float()
{
    global Floating
	Send {Blind}{Space DownTemp}
    Floating := true
}

Reset()
{
    ModeZero()
    StopMeleeing()
    StopFloating()
    StopJumping()
    UnFire()
    UnreadyWeapon()
}

~*F1::
global ModeOne
Reset()
ModeOne := true
return

~*F2::
global ModeTwo
Reset()
ModeTwo := true
return

~*F3::
global ModeThree
Reset()
ModeThree := true
return

~*F4::
global ModeFour
Reset()
ModeFour := true
return

~*F10::
Reset()
return

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnFire()
StopMeleeing()
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*RButton::
SetKeyDelay -1
global ModeThree
global Fire
StopMeleeing()
if(!ModeThree)
{
    if(Fire)
    {
        UnFire()
    }
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*Home::Esc
return

~*PgUp::
SetKeyDelay -1
UnFire()
StopMeleeing()
UnreadyWeapon()
StopJumping()
return

~*PgDn::
SetKeyDelay -1
global Fire
UnreadyWeapon()
StopMeleeing()
if(!Fire)
{	
	Fire := 1
	Send {Click DownTemp}
}
return

~*LButton up::
SetKeyDelay -1
StopMeleeing()
UnFire()
return


;~*PgDn up::
;SetKeyDelay -1
;Send {Blind}{Click up}
;return


~*Insert::
SetKeyDelay -1
Send {Blind}{Click DownTemp}
return

~*Insert up::
SetKeyDelay -1
Send {Blind}{Click up}
return

~*Numpad7::
SetKeyDelay -1
UnFire()
UnreadyWeapon()
return

;*Numpad7::
;SetKeyDelay -1
;global Melee
;Melee := true
;sleep_var_n7 := 100
;UnFire()
;UnreadyWeapon()
;while(Melee)
;{	
;	Send {Blind}{Numpad7 DownTemp}
;	Sleep sleep_var_n7
;	Send {Blind}{Numpad7 up}
;	Sleep sleep_var_n7
;}
;return

;*Numpad7 up::
;var_numpad7 := false
;return

~*Delete::
SetKeyDelay -1
global ModeOne
global ModeTwo
if(ModeOne)
{
	Tracer()
	return
}
if(ModeTwo)
{
    Float()
    return
}
StartJumping()
return

~*NumpadEnter::
SetKeyDelay -1
StartJumping()
return

~*Numpad0::
global ModeTwo
global Floating
StopJumping()
if(ModeTwo)
{
    if(Floating)
    {
        StopFloating()
    }
}
return

~*WheelUp::
SetKeyDelay -1
global ModeOne
global ModeTwo
global ModeThree
if(!ModeTwo && !ModeThree)
{
	UnreadyWeapon()
	UnFire()
    StopJumping()
}
if(ModeOne)
{
    Ult()
}
return

~*Numpad9::
global ModeOne
if(ModeOne)
{
    Ult()
}
return

~*WheelDown::
SetKeyDelay -1
global ModeTwo
global ModeThree
if(!ModeTwo && !ModeThree)
{
	UnreadyWeapon()
	UnFire()
}
if(!ModeThree)
{
    StopJumping()
}
return

~*Numpad2::
global ModeOne
global ModeFour
global OneEightyAll
global OneEightyTracer
global OneEightyWidow
;MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 10
;UnFire()
;UnreadyWeapon()
if(ModeOne)
{
    OneEighty(OneEightyTracer)
    return
}
if(ModeFour)
{
    OneEighty(OneEightyWidow)
    return
}
OneEighty(OneEightyAll)
return

SC07E::t
return	
