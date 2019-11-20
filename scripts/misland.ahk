#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe Monkey2.exe

*~Home::Esc
return

*~Insert::MButton
return

PgUp::MButton
return

Numpad1::MButton
return

*~XButton1::MButton
return

*~XButton2::
SetKeyDelay -1
Send {Blind}{Click DownTemp}{Click DownTemp right}
return

*~XButton2 up::
SetKeyDelay -1
Send {Blind}{Click up}{Click up right}
return

*PgDn::
SetKeyDelay -1
Send {Blind}{Click DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {Blind}{Click up}
return

*Numpad9::
SetKeyDelay -1
Send {Blind}{Click DownTemp right}
return

*Numpad9 up::
SetKeyDelay -1
Send {Blind}{Click up right}
return

*Numpad7::
SetKeyDelay -1
Send {Blind}{Click DownTemp right}
return

*Numpad7 up::
SetKeyDelay -1
Send {Blind}{Click up right}
return
