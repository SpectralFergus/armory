#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force ;Simple refresh without the annoying pop-up.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2 ; A window's title can contain inputString anywhere inside it to be a match. 

; ==== global vars ====
practiceWebsite := "JS"

; KILLSWITCHES
^Space::
Reload
return
^!Space::
ExitApp
return

; QUICK START - Launches all windows needed for a specific project
!RAlt:: ; Both "alt" keys
MsgBox, Hello, SpectralFergus.
openOnce("Evernote", "Evernote")
openOnce("Android Studio", "C:\Program Files\Android\Android Studio\bin\studio64.exe")
openOnce("GitHub - Google Chrome", "https://github.com/")
gitBashPath = "C:\Program Files\Git\git-bash.exe" --cd="%A_MyDocuments%\AndroidStudioProjects\TarotApp"
openOnce("MINGW64", gitBashPath)
return

; ____ SCITE4AUTOHOTKEY ____

; ==== UTILITY FUNCTIONS ====
; Global functions that can be called from any keyboard shortcut command

;Opens a [program] if window with [title] does not already exist.
;Since TitleMatchMode is 2, "Chrome" matches "SomeWebsite - Google Chrome"
;[program] can be 
;	the program's name (Notepad), 
;	full path (%a_windir%\system32\notepad.exe), (NOTE THE "A_". AHK-SPECIFIC)
;	or even a website.
openOnce(title, program) {
	if (!WinExist(title)) {
		Run, %program%
	}
	return
}

switchTo(windowTitle) {
	if(WinExist(windowTitle)) {
		WinActivate, %windowTitle%
		WinWaitActive, %windowTitle%
	}
	return
}

; ============ WINDOW-SPECIFIC =====================
; __________________________________________________
; ==== SCITE4AUTOHOTKEY ====
; Fast-Reload logic specific to SciTE4AutoHotkey
#IfWinActive SciTE4AutoHotkey
^s::
Send, ^s
sleep, 250
Send, {F5}
Reload
return

; ____ UTILITY FUNCTIONS ____
#IfWinActive Atom
^s::
Send ^s
switchTo(practiceWebsite)
Send, {F5}
Sleep, 1
switchTo("Atom")
return
