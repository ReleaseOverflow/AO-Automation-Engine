#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, FORCE
#NoTrayIcon

Random, Rand, 1, 900


FileCopy, %A_ScriptDir%\_assembly\_psd\test3_.psd, %A_ScriptDir%\_assembly\_psd\test3_%Rand%.psd

Run, %A_ScriptDir%\_assembly\_psd\test3_.psd
ExitApp