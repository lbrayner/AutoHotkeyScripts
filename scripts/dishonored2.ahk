#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Dishonored_DO.exe

CoordMode, Mouse, Screen

;global OneEightyAll := 190
global OneEightyAll := 13000

;MoveCursor(x,y)
;{
;    DllCall("SetCursorPos", int, x, int, y)
;}
;
;CenterMouse()
;{
;    MoveCursor(A_ScreenWidth/2,A_ScreenHeight/2)
;}
;
;OneEighty(x)
;{
;	MouseMove x,0,2,R
;}

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

~*Home::Esc
return

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

;*Numpad2::
;global OneEightyAll
;CenterMouse()
;if(var)
;{
;    OneEighty(OneEightyAll)
;}
;else
;{
;    OneEighty(-OneEightyAll)
;}
;var := !var
;return

]::Tab
return

[::Tab
return
