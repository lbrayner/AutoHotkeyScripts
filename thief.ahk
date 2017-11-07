#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

global Sprint := 0
global Dodge := 0
global Stealth := 0
global ReadyThrowable := 0

UnreadyThrowable()
{
	global ReadyThrowable
		
	ReadyWeapon := 0
	Send {Click up}
}

UnStealth()
{
	global Stealth
		
	Stealth := 0
	Send {NumpadEnter up}
}

End::ExitApp
return

; ~*NumpadDiv::
; SetKeyDelay -1
; global ReadyThrowable
; if(!ReadyThrowable)
; {	
	; ReadyThrowable := 1
	; Send {Click DownTemp}
; }
; return

; ~*RButton up::
; SetKeyDelay -1
; UnreadyThrowable()
; return

*NumpadEnter::
global Stealth
if(!Stealth)
{
	Stealth := 1
	Send {NumpadEnter DownTemp}
}
return


; ~*Numpad1::
; Send {c DownTemp}
; return

; ~*Numpad1 up::
; Send {c up}
; return

; *~Numpad8::
; SetKeyDelay -1
; global Sprint
; Sprint := 1
; return

; *~Numpad8 up::
; SetKeyDelay -1
; global Sprint
; Sprint := 0 
; return

; *~Numpad4::
; SetKeyDelay -1
; global Dodge
; Dodge := 1
; return

; *~Numpad4 up::
; SetKeyDelay -1
; global Dodge
; Dodge := 0 
; return

; *~Numpad5::
; SetKeyDelay -1
; global Dodge
; Dodge := 1
; return

; *~Numpad5 up::
; SetKeyDelay -1
; global Dodge
; Dodge := 0 
; return

; ~*Numpad0::
; SetKeyDelay -1
; global Sprint
; if(Dodge)
; {
	; Send {v DownTemp}
; }
; UnStealth()
; UnreadyThrowable()
; return

;~*Numpad0 up::
; SetKeyDelay -1
; Send {v up}
; return

~*Numpad0::
UnStealth()
return

*NumpadDot::
SetKeyDelay -1
numpad7_sleep_var := 50
numpad7_var := true
while(numpad7_var)
{
	Send {Blind}{Numpad7 DownTemp}
	Sleep numpad7_sleep_var
	Send {Blind}{Numpad7 up}
	Sleep numpad7_sleep_var
}
return

*NumpadDot up::
numpad7_var := false
return

; NumpadMult::e