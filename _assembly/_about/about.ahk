﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon

Gui, -Caption +ToolWindow
Gui, Add, Button, x300 y280 w0 h0, UNSTEALFOCUS
Gui, Add, Picture, x0 y14, .\about_bg.png
Gui, Add, Picture, x560 y0 gclose +BackgroundTrans, ab_x.png
Gui, Add, Picture, x0 y0 gUImove, about_bar.png
Gui, Add, Link, x301 y229 +BackgroundTrans, <a href="https://github.com/ReleaseOverflow/AO-Automation-Engine/releases">HERE</a>
Gui, Add, Link, x369 y267 +BackgroundTrans, <a href="https://github.com/ReleaseOverflow/AO-Automation-Engine/wiki">HERE</a>

Gui, Show, x632 y276 h452 w581, New GUI Window

Process, WaitClose, AutomationEngine.exe
ExitApp
Return


UImove:
PostMessage, 0xA1, 2,,, A
Return


close:
GuiClose:
ExitApp