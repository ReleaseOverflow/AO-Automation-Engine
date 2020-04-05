#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon

;; https://myaccount.google.com/lesssecureapps?pli=1

FileRead, MACHINE_IDENTIFIER, %A_ScriptDir%\..\ID\machine_id.txt
FileRead, ENGINE_VERS, %A_ScriptDir%\..\ID\engine_version
FileRead, ENGINE_BUILD, %A_ScriptDir%\..\ID\engine_build
GLOBAL BugReport := "[ANARCHY ONLINE AUTOMATION ENGINE]  BUG SUBMISSION: " . A_Space 
GLOBAL BugReportSubmit := "Bug Report Submission Sent Successfully. Thanks!"
GLOBAL MACHINE_ID := "MACHINE ID:" . A_Space . A_Space . MACHINE_IDENTIFIER
GLOBAL ENGINE_INFO := "ENGINE:" . A_Space . A_Space . "v." . ENGINE_VERS . "-" . ENGINE_BUILD

SetTimer, BugReporterTimeOut, 900000  ;; after 15 minutes of the bug reporter being open without any input, close it

Gui, Add, Text, x130 y20, AUTOMATION ENGINE BUG REPORTER
Gui, Add, Picture, x0 y0, .\..\gui\bug.png
Gui, Add, Edit, x22 y49 w430 h190 vBugContents, 
Gui, Add, Button, x462 y1 w15 h15 gCloseNow +BackgroundTrans, X
Gui, Add, DateTime, x362 y249 w100 h30 vDateAndTime, 
Gui, Add, Button, x22 y249 w330 h30 gSubmit, SUBMIT
Gui, -caption +ToolWindow
; Generated using SmartGUI Creator 4.0
Gui, Show, x690 y434 h293 w479, New GUI Window
Return

Submit:
Gui, Submit, NoHide
Run, "report.exe" -t notumoverflow@gmail.com -f EngineBugReports@gmail.com -ssl -port 465 -auth -smtp smtp.gmail.com -sub subject -M "%BugReport%  {  %MACHINE_ID%  }   {  %ENGINE_INFO%  }   {  DATE/TIME:  %DateAndTime%  }   {  BODY:  %BugContents%  }" -user EngineBugReports@gmail.com -pass hz6vrxon?~Mi0nszduDO,,Hide
Sleep, 500
Gui, Destroy
MsgBox, 64, AUTOMATION ENGINE - BUG REPORTER, %BugReportSubmit%, 20
Sleep, 12500
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, conhost.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe
Process, Close, report.exe

ExitApp


GuiClose:
ExitApp


BugReporterTimeOut:
Sleep, 500
ExitApp

CloseNow:
ExitApp
