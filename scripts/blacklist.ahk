#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe Blacklist_DX11_game.exe

MouseMoveHorizontally(x)
{
    MouseMove, x, 0, 5, Relative
}

UnreadyWeapon()
{
	global WeaponReady
    if(WeaponReady)
    {
        Run kill_interaccel.bat, "", Hide
        WeaponReady := 0
        Send {Click up right}
    }
}

ReadyWeapon()
{
    global WeaponReady
    if(!WeaponReady)
    {
        Run run_interaccel.bat, "", Hide
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

~*Numpad2::
MouseMoveHorizontally(120)
return

~*Home::
SetKeyDelay -1
Send {Esc}
return

; ~*Insert::Tab
; return

~*Numpad0::Space
return

; ~*Right::
; SetKeyDelay -1
; global Cycle
; if(Cycle)
;     Send {1}
; else
;     Send {2}
; Cycle := !Cycle
; return
