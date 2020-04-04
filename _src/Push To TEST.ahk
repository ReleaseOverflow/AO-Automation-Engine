#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, FORCE
#NoTrayIcon

FileRemoveDir, %A_ScriptDir%\test, 1
Sleep, 500
FileCreateDir, %A_ScriptDir%\test
Sleep, 500

FileCopy, %A_ScriptDir%\ENGINE_MAIN_REWRITE.ahk, %A_ScriptDir%\test\, 1  ; Make a copy but keep the orig. file name.
FileCopyDir, %A_ScriptDir%\_assembly, %A_ScriptDir%\test\_assembly, 1
Sleep, 500

Run, %A_ScriptDir%\test
ExitApp