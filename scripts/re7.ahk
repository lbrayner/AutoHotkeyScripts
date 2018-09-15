#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  re7.exe


UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {o up}
}

Attack()
{
    global Attack_var
    Attack_var := true
    attack_sleep_var := 50
    UnreadyWeapon()
    while(Attack_var)
    {	
        Send {Blind}{p DownTemp}
        Sleep attack_sleep_var	
        Send {Blind}{p up}
        Sleep attack_sleep_var	
    }
}

CeaseAttacking()
{
    global Attack_var
    Attack_var := false
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {o DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*Space::
SetKeyDelay -1
UnreadyWeapon()
return

~*NumpadEnter::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{F5 DownTemp}
return

~*NumpadEnter up::
SetKeyDelay -1
Send {Blind}{F5 up}
return

PgDn::f
return

~*PgUp::
UnreadyWeapon()
return

*WheelUp::
SetKeyDelay -1
sleep_var := 50
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
;Sleep sleep_var
;Send {Blind}{2 DownTemp}
;Sleep sleep_var
;Send {Blind}{2 up}
return

*WheelDown::
SetKeyDelay -1
sleep_var := 50
Send {Blind}{3 DownTemp}
Sleep sleep_var
Send {Blind}{3 up}
;Sleep sleep_var
;Send {Blind}{3 DownTemp}
;Sleep sleep_var
;Send {Blind}{3 up}
return

~*MButton::
SetKeyDelay -1
sleep_var := 50
Send {Blind}{1 DownTemp}
Sleep sleep_var
Send {Blind}{1 up}
return


~*Home::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Blind}{Esc up}
return

;Delete::v
;return

~*NumpadDot::
SetKeyDelay -1
Attack()
return

~*NumpadDot up::
CeaseAttacking()
return

~*Delete::
SetKeyDelay -1
Attack()
return

;~*Delete up::
;CeaseAttacking()
;return

~*XButton1::
SetKeyDelay -1
Attack()
return

~*XButton1 up::
CeaseAttacking()
return

~*LButton up::
CeaseAttacking()
return
