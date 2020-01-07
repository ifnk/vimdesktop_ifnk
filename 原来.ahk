
;************** 几个sub,fun 定义 的函数  ************** {{{2


PastePureText:
	IfWinActive, ahk_class ConsoleWindowClass
	{
		SendInput,!{Space}ep
	}
	else
	{
		clipboard = %clipboard%
		send,{Blind}^v
	}
return


	if winc_presses > 0
	{
Sub_KeyClick123:
		winc_presses += 1
		return
	}
	winc_presses = 1
	SetTimer, KeyWinC, % GV_Timer
return

KeyWinC:
	SetTimer, KeyWinC, off
	if winc_presses = 1
	{
		fun_KeyClickAction123(GV_KeyClickAction1)
	}
	else if winc_presses = 2
	{
		fun_KeyClickAction123(GV_KeyClickAction2)
	}
	else if winc_presses > 2
	{
		fun_KeyClickAction123(GV_KeyClickAction3)
		;MsgBox, 三击
	}
	winc_presses = 0
return

fun_KeyClickAction123(act){
	If RegExMatch(act,"i)^(run,)",m) {
		run,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(send,)",m) {
		Send,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(SendInput,)",m) {
		SendInput,% substr(act,strlen(m1)+1)
	}
	else If RegExMatch(act,"i)^(GoSub,)",m) {
		GoSub,% substr(act,strlen(m1)+1)
	}
}


Sub_MaxRestore:
	WinGet, Status_minmax ,MinMax,A
	If (Status_minmax=1){
		WinRestore A
	}
	else{
		WinMaximize A
	}
return




SCWAUp:
	SendInput {Blind}{RShift up}
	SendInput {Blind}{LShift up}
	SendInput {Blind}{LCtrl up}
	SendInput {Blind}{RCtrl up}
	SendInput {Blind}{LWin up}
	SendInput {Blind}{RWin up}
return


; win 相关快捷键
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

#s:: ;通过 win+s 启动 listray 并且 将 输入法弄成英语  的
send #s
PostMessage, 0x50, 0, 0x4090409, , A ;为英文
return 

#j::PgDn
#k::PgUp
#x::send ^{F4}
#c::Winclose,A
;#c::WinClose,A
;#m::WinMaximize,A
#n::WinMinimize,A

return
#h::WindowPadMove("-1,  0,  0.5, 1.0")

return
#l::WindowPadMove("+1,  0,  0.5, 1.0")

return
;#k:: WindowPadMove("0, -1, 1.0, 0.5")

return
;#j:: WindowPadMove("0, +1, 1.0, 0.5")

;#p:: ; 达到指定文件夹 并且 定位 到 第一 个文件  （不包含文件夹）
;
;run,"C:\TOTALCMD\Totalcmd.exe" /O /T /S L="C:\Users\Administrator\Downloads\"
;PostMessage 1075, 2050, 0, ,  ahk_class TTOTAL_CMD   cm_GoToFirstFile=2050 ;Place cursor on first file in list
;sleep,200
;
;return

#p::
run,"C:\TOTALCMD\Totalcmd.exe" /O /T /S L="C:\Users\Administrator\Downloads\"
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




 ;======================================================

Esc::Send {Esc Down}{Esc Up}
;$Esc::Send {Esc}
;Esc & l Up::WindowPadMove("+1,  0,  0.5, 1.0")
;Esc & h Up::WindowPadMove("-1,  0,  0.5, 1.0")
Esc & l::Send {Right}
Esc & h::Send {Left}
Esc & k::Send, {up}
Esc & j::Send,{Down}

Esc & u::ShiftaltTab
Esc & i::AltTab

esc & w:: SendInput,{Blind}^{Right}
esc & b:: SendInput,{Blind}^{Left}

esc & e:: SendInput,{Blind}{PgDn}
esc & q:: SendInput,{Blind}{PgUp}

Esc & g::Send,^w
Esc & r::Send,^r
Esc & t::Send,^t



Esc & y:: send,{AppsKey}

Esc & v::GoSub,PastePureText

Esc & ,:: (
Esc & .:: )
Esc & Enter:: Delete

Esc & c::WinClose,A
Esc & o::[
Esc & p::]
Esc & n::{
Esc & m::}
Esc & /::Send ^/





;分号 相关的快捷键
;=======================================================
^;:: send ^{;}
!;:: send !{;}
+;:: send +{;}
`;:: send {;}
`; & z::send {'}
`; & lctrl:: (
`; & lalt:: )
`; & f::send {\}
`; & c::send {"}
`; & q::send {_}
`; & v::send {-}
`; & x::send {+}
`; & u::send {|}
`; & a::send {!}
`; & s::send {$}
`; & d::send {=}
`; & n::send {^}
`; & m::send {/}
`; & w::send {?}
`; & g::send {*}
`; & j::send {#}
`; & Space::send {``}
`; & h::send {&}
`; & b::Send {`%}
`; & y::send +{F6}

return
`; & Tab::send +^{Tab}

return
`; & esc::send {;}
`; & e::
sendraw ()
send {left}
return
`; & r::
sendraw []
send {left}
return
`; & t::
sendraw {}
send {left}
return

#If GetKeyState(";","p") ;## 语境约束:意思是当keys被实际按下时,一下内容就生效


#If


;右Ctrl相关的快捷键
;=======================================================
;通过按键切换 输入法
RCtrl::
send {lshift down}{lctrl down}{lshift up}{lctrl up}
return


;RCtrl:: ; 切换 输入法
;Switch := ((Switch = 1) ? 0 : 1)
;If Switch
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
;Else
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;Return


;============================================================================================================
;切换到 phpstorm
RCtrl & a::
send #1
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}
return
;切换到 excel
RCtrl & e::
send #5
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}

return

;切换到 cad
RCtrl & z::
send #6
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}

return

; 切换 到 vs code
RCtrl & v::
send #8
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}

return

;切换到 phpstorm
RCtrl & q::
send #1
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}
return
;============================================================================================================

;============================================================================================================
;切换到 chrome
RCtrl & c::
send #2
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}

return
;============================================================================================================

;============================================================================================================
;切换到 source tree
RCtrl & s::#4

send {blind}{RCtrl Up}
return
;============================================================================================================

;============================================================================================================
;切换到git
Rwin & g::#9
send {blind}{RCtrl Up}
return
;============================================================================================================


;============================================================================================================
;切换到 navicat
RCtrl & n::
send #3
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}
return

;============================================================================================================


;============================================================================================================
RCtrl & w::   ; 切换 word

send #7
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
send {blind}{RCtrl Up}
return
;============================================================================================================


RCtrl & x::send ^{f4} ; 关闭标签

send {blind}{RCtrl Up}
return
;RCtrl & d::Winclose,A ;关闭窗口
;
;send {blind}{RCtrl Up}
;return

RCtrl & k::wheelup ;鼠标滚轮向上
send {blind}{RCtrl Up}
return
RCtrl & j::wheeldown ;鼠标滚轮向下

return
RCtrl & h::send ^+{tab} ;上一个标签
send {blind}{RCtrl Up}
return
RCtrl & l::send ^{tab} ;下一个标签
send {blind}{RCtrl Up}

return
RCtrl & 1::send {f1}
send {blind}{RCtrl Up}

return
RCtrl & 2::send {f2}
send {blind}{RCtrl Up}

return
RCtrl & 3::send {f3}
send {blind}{RCtrl Up}

return
RCtrl & 4::send {f4}
send {blind}{RCtrl Up}

return
RCtrl & 5::send {f5}
send {blind}{RCtrl Up}

return
RCtrl & 6::send {f6}
send {blind}{RCtrl Up}

return
RCtrl & 7::send {f7}
send {blind}{RCtrl Up}

return
RCtrl & 8::send {f8}
send {blind}{RCtrl Up}

return
RCtrl & 9::send {f9}
send {blind}{RCtrl Up}

return
RCtrl & 0::send {f10}
send {blind}{RCtrl Up}

return



;限定 ahk 中文帮助
#IfWinActive AutoHotkey 中文帮助 ;chrome devtools 开发者工具   相关快捷键

RCtrl & h::  ;后退
ControlClick , Internet Explorer_Server1 , , , , ClickCount, NA x324 y17


send {blind}{RCtrl Up}
return

RCtrl & l::  ;前进
ControlClick , Internet Explorer_Server1 , , , , ClickCount, NA x374 y25
send {blind}{RCtrl Up}
return

#if







;限定 postman
#IfWinActive  ahk_exe Postman.exe	;postman  相关快捷键
RCtrl & r::  ;发送send 按钮
ControlFocus,Chrome_RenderWidgetHostHWND1 ;定位 到这个 大框
ControlClick,Chrome_RenderWidgetHostHWND1,, Chrome Legacy Window,,, NA x784 y166 ; 点击
return

#if


;限定 navicat
#IfWinActive  ahk_class TNavicatMainForm	;navicat  相关快捷键
RCtrl & h::
send ^+{tab} ;上一个标签
vim.mode("normal", "navicate") ;进入 normal 模式
send {blind}{RCtrl Up}
return
RCtrl & l::
send ^{tab} ;下一个标签
vim.mode("normal", "navicate") ;进入 normal 模式
send {blind}{RCtrl Up}

RCtrl & k::pgup ;鼠标滚轮向上


send {blind}{RCtrl Up}
return
RCtrl & j::pgdn ;鼠标滚轮向下

send {blind}{RCtrl Up}
return

#if

;限定 chrome
#IfWinActive  ahk_exe chrome.exe	;chrome  相关快捷键

RCtrl & t::  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
    ;ControlFocus 设置输入焦点到窗口的指定控件上.
    ;controlClick 发送鼠标按钮或鼠标滚轮事件到控件.
   ControlClick , Chrome_RenderWidgetHostHWND1, , Chrome Legacy Window

send {blind}{RCtrl Up}

return

RCtrl & d::  ;切换 到  phpstorm
    send #1
send {blind}{RCtrl Up}
return

RCtrl & r::  ;chrome 翻译 网页
    send {appskey}
    send t
    send {blind}{RCtrl Up}
return

;打开chrome 的 扩展面板
RCtrl & f::
send !e
send l
send e
send {alt up}
return
;
;RCtrl & a::  ;chrome 选择上一词
;    send ^+{left}
;
;return
;RCtrl & f::  ;chrome 选择 下一词
;    send ^+{right}
;
;return
;RCtrl & b::  ;chrome 上一词
;    send ^{left}
;
;return
;RCtrl & e::  ;chrome 下一词
;    send ^{right}
;
;return
;RCtrl & s::  ;chrome 到行尾
;    send ^{end}
;
;return
;RCtrl & q::  ;chrome 到行首
;    send ^{home}
;
;return

#if


;限定 tc
#IfWinActive  ahk_exe Totalcmd.exe	;tc  相关快捷键

RCtrl & x::send ^w ; ctrl+w 关闭 标签 栏

send {blind}{RCtrl Up}
return

#if

;限定 phpstorm 目录树
#IfWinActive Project	;phpstorm 目录树  相关快捷键

l::Right
h::Left
k::up
j::Down


#If
;限定 vscode
#IfWinActive  ahk_exe Code.exe	;vscode  相关快捷键
RCtrl & l::send {lalt down}{right}{lalt up}
send {blind}{LAlt Up}
send {blind}{RCtrl Up}
return
RCtrl & h::send {lalt down}{left}{lalt up}
send {blind}{LAlt Up}
send {blind}{RCtrl Up}
return
RCtrl & space::send ^{F12}
send {blind}{RCtrl Up}

return

#If

#If
;限定 phpstorm
#IfWinActive  ahk_exe phpstorm64.exe	;phpstorm  相关快捷键


LCtrl & `;::   ;phpstorm快速单行注释
sendinput {esc}
sendinput +a
sendinput {space}{space}{space}{space}//
PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法

return


LCtrl & RShift::send ^{/}
;LCtrl & LShift & RShift::send ^{/}

return


LCtrl & RCtrl:: !a
send {blind}{RCtrl Up}
return


RCtrl & d:: #2  ;切换 到 chrome

send {blind}{RCtrl Up}
return

RCtrl & f:: !w
send {blind}{RCtrl Up}

return

RCtrl & LCtrl:: !a

send {blind}{RCtrl Up}
return

RCtrl & r::
send,+^{enter}
send,{Esc}
send {blind}{RCtrl Up}

return
RCtrl & t::send +^!t
send {blind}{RCtrl Up}

return

RCtrl & g::send !{ins} ; 快速生成代码 generage  code
send {blind}{RCtrl Up}

return

RCtrl & j::send {F3}
send {blind}{RCtrl Up}

return
RCtrl & k::send +{F3}
send {blind}{RCtrl Up}

return

RCtrl & l::send !{right}
send {blind}{RCtrl Up}
return
RCtrl & h::send !{left}
send {blind}{RCtrl Up}
return
RCtrl & space::send ^{F12}
send {blind}{RCtrl Up}
return

#If



;限定 gvim
#IfWinActive  ahk_exe gvim.exe	;phpstorm  相关快捷键

RCtrl & l::send gt
send {blind}{LCtrl Up}
return
; esc 以后 将 输入法切换 成 英文 的
Esc::
send {Esc}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法啦
return

RCtrl & h::send gT
send {blind}{LCtrl Up}
return

RCtrl & d::send #2
send {blind}{LCtrl Up}
return

RCtrl & x:: ;保存退出 一个文件  相当于 ctrl + F4

SendInput :wq {Enter}
return

#if


;限定 xshell
#IfWinActive  ahk_exe Xshell.exe	;phpstorm  相关快捷键
^m::
Send ^{Ins}
Return
;^p::
;Send +{Ins}
;Return
#IF
;限定 git
#IfWinActive  ahk_exe mintty.exe	;phpstorm  相关快捷键
^m::
Send ^{Ins}
Return
;^p::
;Send +{Ins}
;Return
#IF




;=======================================================





;=======================================================


;Ralt相关快捷键
#If GetKeyState("Ralt","p")

*w::+^!w
*q::+^!q
*d::+^!d
*b::+^!b

#If




;************** tab上面的`相关 抑音符 ************** {{{2
;这个位置顺手
` & `;:: SendInput,{Blind}{Home}+{End} //选中 一行

` & j:: SendInput,{Blind}+{Down}
` & k:: SendInput,{Blind}+{Up}
` & h:: SendInput,{Blind}+{Left}
` & l:: SendInput,{Blind}+{Right}

` & o:: SendInput,{Blind}^+{Left}
` & p:: SendInput,{Blind}^+{Right}

` & n:: SendInput,{Blind}+{PgDn}
` & m:: SendInput,{Blind}+{PgUp}





+`::SendInput,~
`::SendInput,``

#IfWinActive, ahk_group group_disableCtrlSpace
	^Space::Controlsend,,^{Space}
	+Space::Controlsend,,+{Space}
#IfWinActive

#IfWinActive ahk_exe excel.exe
{
	;复制单元格纯文本
	!c:: send,{F2}^+{Home}^c{Esc}
	;筛选
	f3::PostMessage, 0x111, 447, 0, , a
	;定位
	!g::ControlClick, Edit1
	;详细编辑
	!;::ControlClick, EXCEL<1

/*
;前后文档切换
CapsLock & o:: send,^+{F6}
CapsLock & p:: send,^{F6}
^Space::Controlsend,,^{Space}
+Space::Controlsend,,+{Space}
*/

}





