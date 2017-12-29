#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  HITMAN.exe

CoordMode, Mouse, Screen

global MouseTurnAll := 4000
global Up_var := 0

MouseTurn(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
	;MouseMove x,0,15,R
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
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
SetKeyDelay -1
UnreadyWeapon()
return

~*Numpad2::
global MouseTurnAll
MouseTurn(MouseTurnAll)
return

~*PgUp::
Send {Blind}{p DownTemp}
return

~*PgUp up::
Send {Blind}{p up}
return



~*Home::
UnInstinct()
Send {Blind}{Esc DownTemp}
return

~*Home up::
Send {Blind}{Esc up}
return

~*Numpad7::
SetKeyDelay -1
sleep_var_n7 := 100
var_n7 := true
while(var_n7)
{
    Send {Blind}{e DownTemp}{x DownTemp}
    Sleep sleep_var_n7
    Send {Blind}{e up}{x up}
    Sleep sleep_var_n7
}
return

~*Numpad7 up::
var_n7 := false
return

;~*PgDn::
;SetKeyDelay -1
;sleep_var_pgdn := 100
;var_pgdn := true
;while(var_pgdn)
;{
;    Send {Blind}{f DownTemp}{x DownTemp}
;    Sleep sleep_var_pgdn
;    Send {Blind}{f up}{x up}
;    Sleep sleep_var_pgdn
;}
;return
;
;~*PgDn up::
;var_pgdn := false
;return

~*PgDn::
UnInstinct()
return

Instinct()
{
    global Instinct
    if(!Instinct)
    {
        Send {LCtrl DownTemp}
    }
    Instinct := 1
}

UnInstinct()
{
    global Instinct
    if(Instinct)
    {
        Send {LCtrl up}
    }
    Instinct := 0
}

Insert::F1
return

~*Delete::
global Instinct
if(Instinct)
{
	UnInstinct()
}
else
{
	Instinct()
}
return
