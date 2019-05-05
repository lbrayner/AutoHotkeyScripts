#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe bio4.exe

CoordMode, Mouse, Screen

~*RAlt::
global Chat
Chat := not Chat
return

~*k::
SetKeyDelay -1
global Chat
if(!Chat)
{
	Send {Blind}{x DownTemp}{c DownTemp}
}
return

~*k up::
SetKeyDelay -1
Send {Blind}{x up}{c up}
return

~*l::
SetKeyDelay -1
global Chat
if(!Chat)
{
	Send {Blind}{Click down}{Click down right}
}
return

~*l up::
SetKeyDelay -1
global Chat
if(!Chat)
{
	Send {Blind}{Click up}{Click up right}
}
return

~*o::
SetKeyDelay -1
global Chat
displacement := 30
var := true
sleep_var := 1
speed := 1
if(!Chat)
{
	while(var)
	{	
		MouseMove, (A_ScreenWidth/2 + displacement), A_ScreenHeight/2, speed
		Sleep sleep_var
		MouseMove, (A_ScreenWidth/2 - displacement), A_ScreenHeight/2, speed
		Sleep sleep_var
	}
}
return

~*o up::
var := false
return

~*p::
SetKeyDelay -1
global Chat
var := true
sleep_var := 1
if(!Chat)
{
	while(var)
	{	
		Send {Blind}{x DownTemp}{c DownTemp}
		Sleep sleep_var
		Send {Blind}{x up}{c up}
		Sleep sleep_var
	}
}
return

~*p up::
var := false
return
