; win 相关快捷键 {{{1
;======================================================
;#if Not WinGet_A_MinMax() ;当前窗口既不处于最小化状态也不处于最大化状态时以下热键才可用.
;#k:: ;向上
;#j:: ;向下
;#h:: ;向左
;#l:: ;向右
;	WinGetPos,PosX,PosY,,,A
;	if (instr(A_ThisHotkey,"k"))
;		WinMove,A,,,% PosY-500  ;这个2是移动距离
;	if (instr(A_ThisHotkey,"j"))
;		WinMove,A,,,% PosY+500
;	if (instr(A_ThisHotkey,"h"))
;		WinMove,A,,% Posx-500
;	if (instr(A_ThisHotkey,"l"))
;		WinMove,A,,% Posx+500
;return
;WinGet_A_MinMax() {
;; 返回0 窗口既不处于最小化状态也不处于最大化状态.
;;-1: 窗口处于最小化状态
;;1: 窗口处于最大化状态
;	WinGet,MinOrMax,MinMax,A
;	return %MinOrMax%
;}

#x::
    sendinput ^F4
return

#c::Winclose,A
;#c::WinClose,A
;#m::WinMaximize,A
#n::WinMinimize,A


#k:: WindowPadMove("0, -1, 1.0, 0.5")

#j:: WindowPadMove("0, +1, 1.0, 0.5")



;#j::#down
;#k::#up
;#h::#left

;#l::#right

;#k:: WindowPadMove("0, -1, 1.0, 0.5")

;#j:: WindowPadMove("0, +1, 1.0, 0.5")

;#p:: ; 达到指定文件夹 并且 定位 到 第一 个文件  （不包含文件夹）
;
;run,"C:\TotalCMD64\Totalcmd64.exe" /O /T /S L="C:\Users\Administrator\Downloads\"
;PostMessage 1075, 2050, 0, ,  ahk_class TTOTAL_CMD   cm_GoToFirstFile=2050 ;Place cursor on first file in list
;sleep,200
;
;return

;打开我的下载 文件夹

#p::
run,"C:\TotalCMD64\Totalcmd64.exe" /O /S L="C:\Users\Administrator\Downloads\"
Sleep 100
WinWaitActive ahk_class TTOTAL_CMD
WinActivate ahk_class TTOTAL_CMD
WinShow ahk_class TTOTAL_CMD
PostMessage 1075, 2050, 0, ,  ahk_class TTOTAL_CMD   ;cm_GoToFirstFile=2050;Place cursor on first file in list
Return

;<cm_GoToFirstFile>   这个命令 就 是tc 里面 查找 第一 个文件 （不包含文件夹）

#0::   ;复制文件路径（带文件）
send, ^c
clipwait
clipboard = %clipboard% 
return

#m:: ; 最大化或者 还原窗口大小
Switch := ((Switch = 1) ? 0 : 1)
If Switch
WinMaximize, A
Else
WinRestore,A
Return



;窗口置顶
#f12::Winset, Alwaysontop, toggle, A



;tab相关快捷键{{{1
 ;======================================================


Tab::send {tab down}
Tab up::send,{tab up}

Lalt & tab::Alttab
LCtrl & tab::^tab
Tab & Space::Enter
Tab & e::Backspace
;Tab & l::WindowPadMove("+1, 0, 0.5, 1")
;Tab & h::WindowPadMove("-1, 0, 0.5, 1")

;Tab & l::
; WinGetPos,,, Width, Height, A
;    WinMove, A,, 940, 0,980,1060
;    return
;
;Tab & h::
; WinGetPos,,, Width, Height, A
;    WinMove, A,, -10,0,960,1060
;    return


;窗口恢复原来的小或者最大化
;Tab & m:: GoSub,Sub_MaxRestore

Tab & i:: SendInput,{End}


Tab & u:: SendInput,{Home}


Tab & j:: 
        SendInput,#{down}
        SendInput,{Blind}{Win up}
return


Tab & k::
        SendInput,#{up}
        SendInput,{Blind}{Win up}
return

Tab & l::
        sendinput #{right}
        SendInput,{Blind}{Win up}
return
Tab & h::
        sendinput #{left}
        SendInput,{Blind}{Win up}
return





;Esc相关快捷键{{{1
 ;======================================================

Esc::SendInput,{Escape} 
;$Esc::Send {Esc}
Escape & j:: SendInput,{Blind}{Down}
Escape & k:: SendInput,{Blind}{Up}
Escape & h:: SendInput,{Blind}{Left}
Escape & l:: SendInput,{Blind}{Right}

Escape & f:: SendInput,{Backspace}
Escape & d:: SendInput,{Delete}

Escape & y:: send,{AppsKey}


Esc & u::shiftalttab
Esc & i::alttab

Escape & w:: SendInput,{Blind}^{Right}
Escape & b:: SendInput,{Blind}^{Left}

Escape & e:: SendInput,{Blind}{PgDn}
Escape & q:: SendInput,{Blind}{PgUp}


Esc & g::^w
Esc & r::^r
Esc & t::
    sendinput, ^t
    PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return
    






Esc & ,:: (
Esc & .:: )
Esc & Enter:: Delete

Esc & c::WinClose,A
Esc & o::[
Esc & p::]
Esc & n::{
Esc & m::}
Esc & /::Send ^/


Esc & +::
; 透明度调整，增加。
WinGet, Transparent, Transparent,A
If (Transparent="")
	Transparent=255
	;Transparent_New:=Transparent+10
	Transparent_New:=Transparent+20
	If (Transparent_New > 254)
		Transparent_New =255
	WinSet,Transparent,%Transparent_New%,A

	tooltip 原透明度: %Transparent_New% `n新透明度: %Transparent%
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

Esc & -::
;透明度调整，减少。
WinGet, Transparent, Transparent,A
If (Transparent="")
	Transparent=255
	Transparent_New:=Transparent-10  ;◆透明度减少速度。
	;msgbox,Transparent_New=%Transparent_New%
	If (Transparent_New < 30)    ;◆最小透明度限制。
		Transparent_New = 30
	WinSet,Transparent,%Transparent_New%,A
	tooltip 原透明度: %Transparent_New% `n新透明度: %Transparent%
	;查看当前透明度（操作之后的）。
	;sleep 1500
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

;设置Lwin &Mbutton直接恢复透明度到255。
Esc & 0::
	WinGet, Transparent, Transparent,A
	WinSet,Transparent,255,A
	tooltip 恢复 ;查看当前透明度（操作之后的）。
	;sleep 1500
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

;透明度相关 的 tooltip
RemoveToolTip_transparent_Lwin:
	tooltip
	SetTimer, RemoveToolTip_transparent_Lwin, Off
return

Escape & LButton::
	CoordMode, Mouse  ; Switch to screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
	WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
	if EWD_WinState = 0  ; Only if the window isn't maximized 
		SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
	GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U  ; Button has been released, so drag is complete.
	{
		SetTimer, EWD_WatchMouse, off
		return
	}
	;GetKeyState, EWD_EscapeState, Escape, P
	;if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
	;{
	;	SetTimer, EWD_WatchMouse, off
	;	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	;	return
	;}
	; Otherwise, reposition the window to match the change in mouse coordinates
	; caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1   ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
return
;************** 按住ESC拖动$    **************

;***************** 剪贴板相关^ ************** {{{2
Escape & v::
	if EscapeV_presses > 0
	{
		EscapeV_presses += 1
		return
	}
	EscapeV_presses = 1
	SetTimer, KeyEscapeV, 175
return

KeyEscapeV:
	SetTimer, KeyEscapeV, off
	if EscapeV_presses = 1
	{
		GoSub,PastePureText
	}
	else if EscapeV_presses = 2
	{
		;msgbox 285
		;Menu, MyMenu, Show
		;EzMenuShow()
		;EzOtherMenuShow()
	}
	EscapeV_presses = 0
return



PastePureText:
	IfWinActive, ahk_class ConsoleWindowClass
	{
		;SendInput,!{Space}ep
		Send {Click Right}
	}
	else
	{
		clipboard = %clipboard%
		send,{Blind}^v
	}
return



;分号 相关的快捷键{{{1
;=======================================================

;恢复分号自身功能
;$`;:: SendInput,`;
`;:: SendInput,`;
#`;:: SendInput,#`;
^`;:: SendInput,^`;
^+`;:: SendInput,^+`;
!`;:: SendInput,!`;
::: SendInput,:

`; & z::sendinput {'}
`; & f::sendinput {\}
`; & c::sendinput {"}
`; & q::sendinput {_}
`; & v::sendinput {-}
`; & x::sendinput {+}
`; & u::sendinput {|}
`; & a::sendinput {!}
`; & s::sendinput {$}
`; & d::sendinput {=}
`; & n::sendinput {^}
`; & w::sendinput {?}
`; & g::sendinput {*}
`; & j::sendinput {#}
`; & i::sendinput {~}
`; & h::sendinput {&}
`; & b::Sendinput {`%}
`; & y::sendinput +{F6}
`; & Space::sendinput {``}

`; & m::
        PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
        sendinput {/}
return

;`; & Tab::send +^{Tab}

return
`; & esc::sendinput {;}
`; & e::
sendraw ()
sendinput {left}
return
`; & r::
sendraw []
sendinput {left}
return
`; & t::
sendraw {}
sendinput {left}
return



; `花号键相关 {{{1
;这个位置顺手，主要是在按住做了那么选择之后，再去按ctrl或者；分号等就显得远了

;单按 ` 的作用哈……
;+`::SendInput,~
;`::SendInput,``
;^`::SendInput,^``
;!`::SendInput,!``
;+!`::SendInput,+!``
;
;` & 1:: SendInput,^x
;` & 2:: SendInput,^c
;` & 3:: SendInput,^v
;` & 4:: SendInput,{Del}
;` & `;:: SendInput,{Blind}{Home}+{End}
;
;` & j:: SendInput,{Blind}+{Down}
;` & k:: SendInput,{Blind}+{Up}
;` & h:: SendInput,{Blind}+{Left}
;` & l:: SendInput,{Blind}+{Right}
;
;` & b:: SendInput,{Blind}^+{Left}
;` & e:: SendInput,{Blind}^+{Right}
;
;;` & o:: SendInput,{Blind}^{PgUp}
;;` & p:: SendInput,{Blind}^{PgDn}
;;` & y:: SendInput,{Blind}{Home}+{End}
;` & u:: SendInput,{Blind}+{Home}
;` & i:: SendInput,{Blind}+{End}
;
;` & s:: SendInput,{Blind}+{End}
;` & n:: SendInput,{Blind}+{Home}


;Backspace 相关 快捷键{{{1

^Backspace::sendinput,^[
Backspace::Sendinput,{Backspace}

;删除到行首

Backspace & u:: SendInput,+{Home}{Backspace}
Backspace & n:: SendInput,+{Home}{Backspace}
;删除到行尾
Backspace & i:: SendInput,+{End}{Backspace}
Backspace & s:: SendInput,+{End}{Backspace}
;删除到下一词(英语有用中文没用)
Backspace & e:: SendInput,^+{right}{Backspace}
;删除到上一词(英语有用中文没用)
Backspace & b:: SendInput,^+{left}{Backspace}

;全选粘贴
Backspace & v:: SendInput,^{Home}^+{End}^v

;删除一行
Backspace & d::SendInput,{Home}+{End}{Delete}
;删除所有
Backspace & a::SendInput,^{Home}^+{End}{Delete}



;Enter 相关 快捷键{{{1

;单按的Enter 作用 
+Enter::SendInput,+{Enter}
Enter::SendInput,{Enter}
^Enter::SendInput,^{Enter}
!Enter::SendInput,!{Enter}
!+Enter::SendInput,+!{Enter}
+^Enter::SendInput,+^{Enter}
!^Enter::SendInput,!^{Enter}
+!^Enter::SendInput,+!^{Enter}

Enter & e:: SendInput,^{right}
Enter & b:: SendInput,^{left}
Enter & s:: SendInput,{end}
Enter & n:: SendInput,{home}

Enter & k::MouseMove, 0, -1, 0, R
Enter & j::MouseMove, 0, 1, 0, R
Enter & h::MouseMove, -1, 0, 0, R
Enter & l::MouseMove, 1, 0, 0, R

;RAlt 相关 快捷键{{{1
;跳到上一词
>!b:: SendInput,^+{left}
>!e:: SendInput,^+{right}

;跳到行首 行尾




;跳到下一词
;搜索选中的文本
>!q::
        sendinput,^c
        GoSub,Sub_SearchSelectTxt
        return
Sub_SearchSelectTxt:
	clip:=
	clip:=clipboard
	If RegExMatch(clip, "^\d{6}$"){
		Out := gv_url_tdx_f10 . clip . gv_url_html
		run,%Out%
	}
	else{
		run,http://www.baidu.com/s?ie=utf-8&wd=%clip%
	}
return


;右Ctrl相关的快捷键{{{1
;=======================================================
;通过按键切换 输入法



LCtrl:: ;左Ctrl  切换 成中文 输入法
    PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
return

RCtrl:: ;右Ctrl  切换 成英文 输入法
;send {shift down}{alt down}{shift up}{alt up}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return

;RCtrl:: ; 切换 输入法
;Switch := ((Switch = 1) ? 0 : 1)
;If Switch
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
;Else
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;Return


;============================================================================================================

;获取当前鼠标下的像素颜色 


;切换到 phpstorm

RCtrl & a::
sendinput #1
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
return
;切换到 excel
RCtrl & e::
sendinput #5
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 


return

;切换到 小程序开发者工具 
RCtrl & z::
sendinput #6
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return

; 切换 到 vs code
RCtrl & v::
sendinput #8
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return

;; 切换 到 有道云笔记
;RCtrl & b::
;send ^+!b
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
;sendinput {Blind}{RCtrl up}
;sendinput {Blind}{LWin up}
;sendinput {Blind}{RWin up}
;return

;切换到 phpstorm
RCtrl & q::
send #4
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return
;============================================================================================================

;============================================================================================================
;切换到 帮助 
RCtrl & c::
send #9
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return
;============================================================================================================

;============================================================================================================
;切换到 source tree
RCtrl & s::
send  #2
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return
;============================================================================================================



;============================================================================================================
;切换到 navicat
RCtrl & n::
sendinput #3
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return

;============================================================================================================


;============================================================================================================
RCtrl & w::   ; 切换 word
sendinput #7
;sendinput #2
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
sendinput {Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return
;============================================================================================================


RCtrl & x:: 
        sendinput,^{f4} ; 关闭标签
        sendinput,{Blind}{RCtrl up}
sendinput {Blind}{LWin up}
sendinput {Blind}{RWin up}
return
;
;return

;RCtrl & k::wheelup ;鼠标滚轮向上
;
;return
;RCtrl & j::wheeldown ;鼠标滚轮向下
;return

RCtrl & h::
    sendinput ^+{tab}
    sendinput {Blind}{RCtrl up}
    sendinput {Blind}{shift up}
return

RCtrl & l::
    sendinput ^{tab}
    sendinput {Blind}{RCtrl up}
    sendinput {Blind}{shift up}
return



RCtrl & 1::
    send {f1}
return

RCtrl & 2::
    send {f2}
return

RCtrl & 3::send {f3}


send {Blind}{RCtrl up}
return
RCtrl & 4::send {f4}

send {Blind}{RCtrl up}

return
RCtrl & 5::send {f5}


send {Blind}{RCtrl up}
return
RCtrl & 6::send {f6}

send {Blind}{RCtrl up}

return
RCtrl & 7::send {f7}


send {Blind}{RCtrl up}
return
RCtrl & 8::send {f8}


send {Blind}{RCtrl up}
return
RCtrl & 9::send {f9}
send {Blind}{RCtrl up}
return

RCtrl & 0::send {f10}
send {Blind}{RCtrl up}
return
RCtrl & -::send {f11}
send {Blind}{RCtrl up}
return

RCtrl & =::send {f12}
send {Blind}{RCtrl up}
return

^Esc::send {Esc}
send {Blind}{RCtrl up}
return




;限定 ahk 中文帮助{{{1
#IfWinActive AutoHotkey 中文帮助 ;chrome devtools 开发者工具   相关快捷键

RCtrl & h::  ;后退
ControlClick , Internet Explorer_Server1 , , , , ClickCount, NA x324 y17



return

RCtrl & l::  ;前进
ControlClick , Internet Explorer_Server1 , , , , ClickCount, NA x374 y25

return

#if







;限定 postman{{{1
#IfWinActive  ahk_exe Postman.exe	;postman  相关快捷键
RCtrl & r::  ;发送send 按钮
ControlFocus,Chrome_RenderWidgetHostHWND1 ;定位 到这个 大框
ControlClick,Chrome_RenderWidgetHostHWND1,, Chrome Legacy Window,,, NA x1743 y173 ; 点击
send {Blind}{RCtrl up}

return

#if


;限定 navicat{{{1
#IfWinActive  ahk_class TNavicatMainForm	;navicat  相关快捷键
RCtrl & h::
send ^+{tab} ;上一个标签
vim.mode("normal", "navicate") ;进入 normal 模式

send {Blind}{RCtrl up}
return
RCtrl & l::
send ^{tab} ;下一个标签
vim.mode("normal", "navicate") ;进入 normal 模式

send {Blind}{RCtrl up}

RCtrl & k::
    send {pgup} ;鼠标滚轮向上
return
RCtrl & j::
    send {pgdn} ;鼠标滚轮向下
send {Blind}{RCtrl up}
return

#if


;限定 PotPlayerMini{{{1
#IfWinActive  ahk_exe PotPlayerMini.exe	;potplayer 播放器  相关快捷键

#If

;限定 chrome 和 edge{{{1

#if, winactive("ahk_exe chrome.exe") || winactive("ahk_exe msedge.exe") 

RCtrl & t::  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
    ;ControlFocus 设置输入焦点到窗口的指定控件上.
    ;controlClick 发送鼠标按钮或鼠标滚轮事件到控件.
   ControlClick , Chrome_RenderWidgetHostHWND1, , Chrome Legacy Window

send {Blind}{RCtrl up}


return

;LCtrl & w:: ^+c ;查看元素源码





RCtrl & k::  ;后退
    Send !{Left}
    send {Blind}{RCtrl up}
Return
RCtrl & j::  ;前进
    Send !{Right}
    send {Blind}{RCtrl up}
Return

RCtrl & r::
    sendinput {appskey}
    sleep 100
    sendinput t

send {Blind}{RCtrl up}
Return

    
;将msdn 的 网址英语弄成中文 
RCtrl & 1::
    send !d^c ;定位到当前地址栏
    StringReplace, clipboard, clipboard, en-us, zh-cn, All ; 把剪贴板中所有 en-us 替换为 zh-cn (同时把剪贴板的内容转换为纯文本).
    send ^v{enter} ;粘贴刷新

return



;打开chrome 的 扩展面板
RCtrl & f::
send !ex
send {alt up}
send {Blind}{RCtrl up}
return

RCtrl & d::
sendinput {F11}
sendinput {Blind}{RCtrl up}
return

;切换到地址栏 并且 输入法 改成英文 
LAlt & d::
send !d
Sleep 100
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{Lalt up}
return

#if




;限定 tc{{{1
#IfWinActive  ahk_exe Totalcmd.exe	;tc  相关快捷键

RCtrl & x::
    send ^w ; ctrl+w 关闭 标签 栏

send {Blind}{RCtrl up}

return

#if




;限定 phpstorm 目录树{{{1
#if, winactive("Project") 

l::right
h::left
k::up
j::down
o::appskey
space::enter




#if

;#o:: 
;        isChildExist()
;return
;
;isChildExist() {
;	WinGet, abc, ControlList ,ahk_exe rider64.exe
;	;winget, abc, Controllist, ahk_class SunAwtFrame
;	msgbox, % abc
;}

;这个代码 有用哈 rider 检测 alt+home 的窗口 
;DetectHiddenWindows, on
;#ifwinexist ahk_class  SunAwtWindow
;l::send {right}
;h::send {left}
;k::send {up}
;j::send {down}
;o::send {appskey}
;#if

;限定 rider 目录树{{{1

#IfWinActive  ahk_class  SunAwtWindow ;rider  相关快捷键

l::send {right}
h::send {left}
k::send {up}
j::send {down}
o::send {appskey}

#If


;限定 visual studio {{{1
#IfWinActive  ahk_exe devenv.exe	;visual studio 相关快捷键

; esc 以后 将 输入法切换 成 英文 的
Esc::
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Esc}{Esc}
return

`; & esc::
send {F2} ;关闭多余的选项卡
return
;关闭多余的选项卡
`; & tab::
send ^+!=
return

;RCtrl & b::
;send ^+!b
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
;sendinput {Blind}{RCtrl up}
;sendinput {Blind}{LWin up}
;sendinput {Blind}{RWin up}
;return


RCtrl & f:: ;停止运行 stop
    sendinput ^n
    sendinput {Blind} {RCtrl up}
Return

RCtrl & o:: ;停止运行 stop
    send +{F5}
    sendinput {Blind}{RCtrl Up}
Return

RCtrl & m:: ;错误列表
    send ^\e
    sendinput {Blind}{RCtrl Up}
Return
RCtrl & d:: ;调试 
    send {F10}
    sendinput {Blind}{RCtrl Up}
Return

RCtrl & Space:: ;显示该文件的所有方法 
    send ^{F12}
    sendinput {Blind}{RCtrl Up}
Return
RCtrl & i:: ;运行 不调试 
    send {F5}
    sendinput {Blind}{RCtrl Up}
Return

;上一个 选项卡 
RCtrl & h::
        sendinput ^{PgUp}
    sendinput {Blind}{RCtrl Up}
    return
 ;下一个 选项卡 
RCtrl & l:: sendinput ^{PgDn}
    sendinput {Blind}{RCtrl Up}
    return

Rctrl & r:: ;自动完成代码 
    send ^\
    send ^\
    sendinput {Blind}{RCtrl Up}
Return




`; & e::
sendraw (
return
`; & r::
sendraw [
return
`; & t::
sendraw {
return


#If

;限定 vscode{{{1
#IfWinActive  ahk_exe Code.exe	;vscode  相关快捷键
RCtrl & l::send {lalt down}{right}{lalt up}
send {blind}{LAlt Up}

return
RCtrl & h::send {lalt down}{left}{lalt up}
send {blind}{LAlt Up}

return
RCtrl & space::send ^{F12}

send {blind}{RCtrl Up}



return

#If

#If
;限定 phpstorm 和 rider 和 idea  和  webstorm  {{{1
#if, winactive("ahk_exe phpstorm64.exe") || winactive("ahk_exe rider64.exe") || winactive("ahk_exe webstorm64.exe") || winactive("ahk_exe idea64.exe") 

Esc::
        sendinput,{Esc}
        PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return

Enter::
        sendinput,{Enter}
        PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return



;`; & t:: ;由于Rider  会自动补全{} 导致 多加一个} ，所以 改下 只弄一个 { 防止补全
;sendraw {}
;sendinput {left}
;return

`; & t:: ;由于Rider  会自动补全{} 导致 多加一个} ，所以 改下 只弄一个 { 防止补全
sendraw {
return


`; & esc::+F6

;关闭多余的选项卡
`; & tab:: sendinput,+{Esc} 

;LCtrl & h::
;    send ^h
;    ;SetDefaultKeyboard(0x8040804) ;切换中文输入法（这是切换英文输入法，中文代码忘了……）
;    PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;    ;这时候会输入 中文(一个汉字),按键数 1-4 个吧
;    ;然后按空格确定要 选择输入的中文 
;    ;KeyWait,space ;ahk 等待 空格键 这个不会写……
;    KeyWait,space,d
;    SetDefaultKeyboard(0x0409) ;如果有空格的话就将输入法切换到英文输入法
;    return

LCtrl & `;::   ;phpstorm快速单行注释
;sendinput {Esc}A<{!}---->{left}{left}{left}	 ;注释代码 
sendinput {Esc}A{Space}//{Space} ;注释代码 
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{LCtrl up}
return


LCtrl & RShift::
SendInput ^/ ;注释代码 
return


;寻找任意文件  

RCtrl & f::
        sendinput,^+n 
        sendinput,{Blind}{RCtrl up}
return



RCtrl & r:: ;自动完成代码 
send,+^{enter}
send,{Esc}
send {Blind}{RCtrl up}
send {Blind}{LWin up}
send {Blind}{RWin up}
return


RCtrl & o:: ;停止运行 stop
    send ^{F2}
send {Blind}{RCtrl up}
Return

RCtrl & i:: ;运行 不调试 
    send +{F9}
send {Blind}{RCtrl up}
Return

RCtrl & d:: ;显示名称
    send !{Home}
        sendinput {Blind}{Alt up}
        sendinput {Blind}{RCtrl up}
Return



RCtrl & t::  +^!t  ;快速导航 

RCtrl & g::  !ins ; 快速生成代码 generage  code

RCtrl & j::  
    send !{F9}
        sendinput {Blind}{RCtrl up}
        sendinput {Blind}{Alt up}
    Return


RCtrl & k::  +F3

RCtrl & l::  
    SendInput,{Blind}!{right}
    Return

RCtrl & h:: 
    SendInput,{Blind}!{left}
    Return

RCtrl & space:: ^F12 

#If


;限定 Qtranslate {{{2
#IfWinActive  ahk_exe QTranslate.exe	;Qtranslate  翻译软件  相关快捷键

tab::
        ControlFocus , RICHEDIT50W1
        sendinput,^a
return
+tab::
        ControlFocus , RICHEDIT50W2
        sendinput,^a
Return
enter::
        sendinput,^{enter}
return






#If

;限定 gvim{{{1
#IfWinActive  ahk_exe gvim.exe	;gvim  相关快捷键

Esc:: ; 按esc 切换 输入法 为英文 
        sendinput {Esc}
        PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return

;LCtrl & h::
;    send ^h
;    ;SetDefaultKeyboard(0x8040804) ;切换中文输入法（这是切换英文输入法，中文代码忘了……）
;    PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;    ;这时候会输入 中文(一个汉字),按键数 1-4 个吧
;    ;然后按空格确定要 选择输入的中文 
;    KeyWait,space,d  ;等待 空格键 
;    SetDefaultKeyboard(0x0409) ;如果有空格的话就将输入法切换到英文输入法 
;    return

RCtrl & l::
        sendinput,gt
return

RCtrl & h::
        SendInput,gT
return

RCtrl & i:: sendinput,{F5}


RCtrl & o:: sendinput,{F4}

^!l:: sendinput {F3}

;保存退出 一个文件  相当于 ctrl + F4

RCtrl & x:: SendInput :q {Enter}

#if

;限定 totalcommander{{{1
#IfWinActive  ahk_exe Totalcmd64.exe	;totalcommander  相关快捷键
RCtrl & x:: ;关闭当前标签页
SendInput ^w
return
#IF

;限定 xshell{{{1
#IfWinActive  ahk_exe Xshell.exe	;phpstorm  相关快捷键
^m::
Send ^{Ins}
Return
;^p::
;Send +{Ins}
;Return
#IF
;限定 git{{{1
#IfWinActive  ahk_exe mintty.exe	;phpstorm  相关快捷键
^m::
Send ^{Ins}
Return
;^p::
;Send +{Ins}
;Return
#IF











;限定 photoshop PS{{{1

#IfWinActive ahk_class Photoshop	;PS���
#persistent

;锁定图层
space & d::
send,^/
return
space & c::
send,+^!c
return
space & v::
send,+^!v
return
space & b::
send,+^!b
return
f1::send n
space & q::
send,+^{f7}
Return
space & `::
send,!{delete}
return
space & a::
send,^j
return
space & s::
send,^+j
return
space & e::
send,{del}
return

$mbutton::send,{space down}{lbutton down}	;�����
$mbutton up::send,}{space up}{lbutton up}	;�����
return
~space & wheeldown::
send,[	;�С�������
return
~space & wheelup::
send,]	;�Ŵ󻭱����
return
lalt & wheeldown::send,{alt down}[{alt up}	;����
return
lalt & wheelup::send,{alt down}]{alt up}	;����
return
ctrl & wheeldown::send ^{tab}	;����
return
ctrl & wheelup::send ^+{tab}	;����
return

shift & wheeldown::send,{ctrl down}[{ctrl up}	;���˳�
return
shift & wheelup::send,{ctrl down}]{ctrl up}	;���˳�
return
f1 & wheeldown::send,{shift down}={shift up}	;����ӷ�ʽ
return
f1 & wheelup::send,{shift down}-{shift up}	;����ӷ�ʽ
return
#IfWinActive












;限定 honeyView 看图软件{{{1

#IfWinActive ahk_exe Honeyview.exe	

;滚轮抓手工具 
$mbutton::send,{ctrl down}{lbutton down}
$mbutton up::send,}{ctrl up}{lbutton up}
return
^d::sendinput,9

RCtrl & l::sendinput,{right}
RCtrl & h::sendinput,{left}

#IfWinActive

