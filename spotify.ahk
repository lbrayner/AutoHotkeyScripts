#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;|--[ SOURCES ]--|
;|---------------|
;Base Spotify Script from: http://www.autohotkey.com/board/topic/36239-spotify-global-hotkeys/
;Base Starring Script from: http://superuser.com/questions/324416/any-spotify-tweaks-with-keyboard-shortcut-to-star-tracks

;|------------------|
;|--[ SETTING UP ]--|
;|------------------|
DetectHiddenWindows, On ;Detect Spotify even if it's minimized
#IfWinExist ahk_class SpotifyMainWindow ;Only do the following if Spotify is running
spotify = ahk_class SpotifyMainWindow ;Set variable for Spotify Window Name

;|---------------|
;|--[ HOTKEYS ]--|
;|---------------|
; "CTRL + SHIFT + 7" for previous 
^+7:: 
{
	ControlSend, ahk_parent, ^{Left}, %spotify% 
	return 
}

; "CTRL + SHIFT + 9" for next 
^+9:: 
{ 
	ControlSend, ahk_parent, ^{Right}, %spotify% 
	return 
} 

; "CTRL + SHIFT + 8" for pause
^+8::
{ 
	ControlSend, ahk_parent, {Space}, %spotify% 
	return
} 

; "CTRL + ALT + END" for track-name
^!End:: 
{ 
	WinGetTitle, spotify_playing, %spotify% ;Get the title of Spotify which contains the track-name
	
	StringTrimLeft, trimmed_playing, spotify_playing, 10 ;Get rid of extra text and place into 'trimmed_playing'
	StringReplace, replaced_playing, trimmed_playing, –, -, All ;Replace en dash with normal dash and place into 'replaced_playing'
	
	clipboard = %replaced_playing% ;Copy the fixed text to clipboard
	return 
} 

; "CTRL + SHIFT + 6" for volume up
^+6::
{ 
	ControlSend, ahk_parent, ^{Up}, %spotify% 
	return 
} 

; "CTRL + SHIFT + 5" for volume down
^+5::
{ 
	ControlSend, ahk_parent, ^{Down}, %spotify% 
	return 
} 

; "CTRL + ALT + INSERT" for starring the current song
^!Insert::
{ 
	;Store active window and mouse position.
	MouseGetPos, , , winID
	
	;Right click near the song title in the "Now Playing" box.
	WinGetPos,  ,  ,  , spotifyHeight, %spotify%
	clickX := 100
	clickY := spotifyHeight-70 
	ControlClick, x%clickX% y%clickY% , %spotify%, , Right, , NA
	
	;Get the contents of the context menu.
	WinWait, ahk_class #32768
	SendMessage, 0x1E1 ;MN_GETHMENU
	allContextMenuInfo := ErrorLevel

	;The "Star" command is the 2nd menu item.
	;If the song is Unstarred the text is Star, and vice versa. But sometimes some wierd characters are included.
	;The only reliable way I found is to check if the first letter is S.
	menuText_StarUnstar := GetContextMenuItemText(allContextMenuInfo, 2)
	StringGetPos, positionOfS, menuText_StarUnstar, S

	;If S is the first letter, star the song.
	notStarred := (%positionOfS% = 0)
	If notStarred 
	{
		;Arrow down to the Star menu item and press enter.
		ControlSend, ahk_parent, {Down}{Down}{Enter}, %spotify% 
	} 
	Else 
	{
		;Just close the context menu.
		ControlSend, ahk_parent, {Escape}, %spotify% 
	}
	
	;Restore original window and mouse position.
	WinActivate ahk_id %winID%
	
	return
}

;|-----------------|
;|--[ FUNCTIONS ]--|
;|-----------------|

;Context menu helper function.
GetContextMenuItemText(hMenu, nPos)
{
	length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "UInt", 0 ; NULL
			, "Int", 0  ; Get length
			, "UInt", 0x0400)   ; MF_BYPOSITION
		VarSetCapacity(lpString, length + 1)
		length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "Str", lpString
			, "Int", length + 1
			, "UInt", 0x0400)
	return lpString
}
