#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe re5dx9.exe

; Weapon
; Weapon
; Weapon

UnReadyWeapon()
{
    if GetKeyState("RButton")
        Send {Click up right}
}

DoReadyWeapon()
{
    if !GetKeyState("RButton")
        Send {Click DownTemp right}
}

IsWeaponReady()
{
    return GetKeyState("RButton")
}

; Run
; Run
; Run

IsRunning()
{
    return GetKeyState("SC01D")
}

UnRun()
{
    if GetKeyState("Space")
        Send {Space up}
}

DoRun()
{
    if !GetKeyState("Space")
        Send {Space DownTemp}
}

IsStrafing()
{
    return GetKeyState("a") || GetKeyState("d")
}

~*NumpadDiv::
SetKeyDelay -1
DoReadyWeapon()
return

~*RButton up::
SetKeyDelay -1
UnReadyWeapon()
return

~*Numpad8::
SetKeyDelay -1
UnReadyWeapon()
if !IsStrafing()
    DoRun()
Send {w DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
UnRun()
Send {w up}
return

~*Numpad4::
SetKeyDelay -1
UnReadyWeapon()
UnRun()
Send {a DownTemp}
keywait Numpad4
Send {a up}
return

~*Numpad5::
SetKeyDelay -1
UnReadyWeapon()
UnRun()
Send {s DownTemp}
keywait Numpad5
Send {s up}
return

~*Numpad6::
SetKeyDelay -1
UnReadyWeapon()
UnRun()
Send {d DownTemp}
keywait Numpad6
Send {d up}
return

~*Numpad0::Space
return

~*Numpad7::e
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad2::x
return

*Home::
SetKeyDelay -1
UnReadyWeapon()
Send {Esc DownTemp}
keywait Home
Send {Esc up}
return

; Wesker

; *Numpad2::
; SetKeyDelay -1
; UnreadyWeapon()
; Send {x DownTemp}{Space DownTemp}
; return

; *Numpad2 up::
; SetKeyDelay -1
; Send {x up}{Space up}
; return

;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************

*PgDn::
SetKeyDelay -1
pgdn_var := true
pgdn_sleep_var := 50
while(pgdn_var)
{
	Send {f DownTemp}
	Sleep pgdn_sleep_var
	Send {f up}
	Sleep pgdn_sleep_var
}
return

*PgDn up::
pgdn_var := false
return

*Numpad9::
SetKeyDelay -1
var := true
sleep_var := 100
while(var)
{
	Send {q DownTemp}
	Sleep sleep_var
	Send {q up}
	Sleep sleep_var
}
return

*Numpad9 up::
var := false
return

; *Numpad1::
; SetKeyDelay -1
; Send {Numpad7 DownTemp}{Del DownTemp}
; Send {Numpad4 DownTemp}{Numpad6 DownTemp}
; return

; *Numpad1 up::
; Send {Numpad7 up}{Del up}
; Send {Numpad4 up}{Numpad6 up}
; return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 1
while(var)
{
	Send {a DownTemp}
	Sleep sleep_var
	Send {d DownTemp}{a up}
	Sleep sleep_var
	Send {d up}
}
return

*NumpadDot up::
var := false
return

;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************

*PgUp::
SetKeyDelay -1

sleep_var := 100
speed := 10

;MouseMove, 0, 0, speed

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{z DownTemp}
Sleep sleep_var
Send {z up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{z DownTemp}
Sleep sleep_var
Send {z up}{c DownTemp}
Sleep sleep_var
Send {c up}

return

*Insert::
SetKeyDelay -1

sleep_var := 100
speed := 10

;MouseMove, 0, 0, speed

Send {c DownTemp}
Sleep sleep_var
Send {c up}{z DownTemp}
Sleep sleep_var
Send {z up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{z DownTemp}
Sleep sleep_var
Send {z up}{c DownTemp}
Sleep sleep_var
Send {c up}

return

*Delete::
SetKeyDelay -1

sleep_var := 100
speed := 1

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Right DownTemp}
Sleep sleep_var
Send {Right up}{z DownTemp}
Sleep sleep_var
Send {z up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{z DownTemp}
Sleep sleep_var
Send {z up}{c DownTemp}
Sleep sleep_var
Send {c up}
return

;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************

*F6::
SetKeyDelay -1

sleep_var := 100

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Right DownTemp}
Sleep sleep_var
Send {Right up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{c DownTemp}
Sleep sleep_var
Send {c up}

return

*F7::
SetKeyDelay -1

sleep_var := 100

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{Down DownTemp}
Sleep sleep_var
Send {Down up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{Return DownTemp}
Sleep sleep_var
Send {Return up}

return

*F8::
SetKeyDelay -1

sleep_var := 100

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Down DownTemp}
Sleep sleep_var
Send {Down up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{c DownTemp}
Sleep sleep_var
Send {c up}

return

*F9::
SetKeyDelay -1

sleep_var := 100

Send {c DownTemp}
Sleep sleep_var
Send {c up}{Right DownTemp}
Sleep sleep_var
Send {Right up}{Down DownTemp}
Sleep sleep_var
Send {Down up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Up DownTemp}
Sleep sleep_var
Send {Up up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{Left DownTemp}
Sleep sleep_var
Send {Left up}{Return DownTemp}
Sleep sleep_var
Send {Return up}{c DownTemp}
Sleep sleep_var
Send {c up}

return

;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************

*WheelUp::
Send {3 DownTemp}
Send {3 up}
return

*WheelDown::
Send {2 DownTemp}
Send {2 up}
return

~*XButton1::1
return
