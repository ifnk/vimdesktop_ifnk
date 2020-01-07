;{{{1  一些变量
;双击快捷键间隔175微秒，别改
GV_Timer := 175
GV_KeyClickAction1 :=
GV_KeyClickAction2 :=
GV_KeyClickAction3 :=


;************** 自定义方法^ ************** {{{1
GF_GetSysVar(sys_var_name)
{
	EnvGet, sv,% sys_var_name
	return % sv
}

AscSend(str){
	SetFormat, Integer, H
	for k,v in StrSplit(str)
	out.="{U+ " Ord(v) "}"
	Sendinput % out
}

;适合单行直接调用
CoordWinClick(x,y){
	CoordMode, Mouse, Window
	click %x%, %y%
}

;在调用的过程前面统一加上一句 CoordMode, Mouse, Window 较好，下同
ClickSleep(x,y,s){
	click %x%, %y%
	Sleep, % 100*s
}


ControlClickSleep(ctl,s){
	ControlClick, %ctl%
	Sleep, % 100*s
}

MyWinWaitActive(title){
	WinWait, %title%, 
	IfWinNotActive, %title%, , WinActivate, %title%, 
	WinWaitActive, %title%, 
}

/*
If (GetCursorShape() = 161920)      ;I 型光标
	SwitchIME("E0220804")               ;搜狗输入法中文半角
else 
	SwitchIME("4090409")	              ;英文键盘布局
return
*/
;SwitchIME(dwLayout){
;	DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, (DllCall("LoadKeyboardLayout", "Str", dwLayout, UInt, 0x01)))
;}

/*
SwitchIME(dwLayout){ ;修改当前窗口输入法
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}
*/

GetCursorShape(){   ;获取光标特征码 by nnrxin  
    VarSetCapacity( PCURSORINFO, 20, 0) ;为鼠标信息 结构 设置出20字节空间
    NumPut(20, PCURSORINFO, 0, "UInt")  ;*声明出 结构 的大小cbSize = 20字节
    DllCall("GetCursorInfo", "Ptr", &PCURSORINFO) ;获取 结构-光标信息
    if ( NumGet( PCURSORINFO, 4, "UInt")="0" ) ;当光标隐藏时，直接输出特征码为0
        return, 0
    VarSetCapacity( ICONINFO, 20, 0) ;创建 结构-图标信息
    DllCall("GetIconInfo", "Ptr", NumGet(PCURSORINFO, 8), "Ptr", &ICONINFO)  ;获取 结构-图标信息
    VarSetCapacity( lpvMaskBits, 128, 0) ;创造 数组-掩图信息（128字节）
    DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 12), "UInt", 128, "UInt", &lpvMaskBits)  ;读取 数组-掩图信息
    loop, 128{ ;掩图码
        MaskCode += NumGet( lpvMaskBits, A_Index, "UChar")  ;累加拼合
    }
    if (NumGet( ICONINFO, 16, "UInt")<>"0"){ ;颜色图不为空时（彩色图标时）
        VarSetCapacity( lpvColorBits, 4096, 0)  ;创造 数组-色图信息（4096字节）
        DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 16), "UInt", 4096, "UInt", &lpvColorBits)  ;读取 数组-色图信息
        loop, 256{ ;色图码
            ColorCode += NumGet( lpvColorBits, A_Index*16-3, "UChar")  ;累加拼合
        }  
    } else
        ColorCode := "0"
    DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 12))  ; *清理掩图
    DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 16))  ; *清理色图
    VarSetCapacity( PCURSORINFO, 0) ;清空 结构-光标信息
    VarSetCapacity( ICONINFO, 0) ;清空 结构-图标信息
    VarSetCapacity( lpvMaskBits, 0)  ;清空 数组-掩图
    VarSetCapacity( lpvColorBits, 0)  ;清空 数组-色图
    return, % MaskCode//2 . ColorCode  ;输出特征码
}

Sub_KeyClick123:
	if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
	{
		winc_presses += 1
		return
	}
	; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
	; 计时器：
	winc_presses = 1
	SetTimer, KeyWinC, % GV_Timer ; 在 400 毫秒内等待更多的键击.
return

KeyWinC:
	SetTimer, KeyWinC, off
	if winc_presses = 1 ; 此键按下了一次.
	{
		fun_KeyClickAction123(GV_KeyClickAction1)
	}
	else if winc_presses = 2 ; 此键按下了两次.
	{
		fun_KeyClickAction123(GV_KeyClickAction2)
	}
	else if winc_presses > 2
	{
		fun_KeyClickAction123(GV_KeyClickAction3)
		;MsgBox, Three or more clicks detected.
	}
	; 不论触发了上面的哪个动作, 都对 count 进行重置
	; 为下一个系列的按下做准备:
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


;%A_YYYY%-%A_MM%-%A_DD%-%A_MSec%
;msgbox % fun_GetFormatTime("yyyy-MM-dd-HH-mm-ss")
fun_GetFormatTime(f,t="")
{
;FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
;FormatTime, TimeString, ,'Month Name': MMMM`n'Day Name': dddd
FormatTime, TimeString, %t% ,%f%
return %TimeString%
}

Sub_ClipAppend:
	;SendInput,^{Home}^+{End}^c
	Send,^c
	ToolTip 已经添加到 %GV_TempPath%\ClipAppend.txt
	FileAppend, %ClipBoard%.`n, %GV_TempPath%\ClipAppend.txt
	Sleep 1000
	ToolTip
return


Sub_MaxRestore:
	WinGet, Status_minmax ,MinMax,A
	If (Status_minmax=1){
		WinRestore A
	}
	else{
		WinMaximize A
	}
return


Sub_WindowNoCaption:
	WinGetPos, xTB, yTB,lengthTB,hightTB, ahk_class Shell_TrayWnd
	;msgbox %xTB%
	;msgbox %yTB%
	;msgbox %lengthTB%
	;msgbox %hightTB%
	bd := 8 ;win8Border = 4
	lW := A_ScreenWidth
	hW := A_ScreenHeight
	if(xTB == 0){ ;左边和上、下面的情况
		if(yTB == 0){ ;任务栏在上和左
			if(lengthTB == A_ScreenWidth){ ;在上
				xW := 0
				yW := hightTB
				lW := A_ScreenWidth
				hW := A_ScreenHeight - hightTB
			}
			else{ ;在左
				xW := lengthTB
				yW := 0
				lW := A_ScreenWidth - lengthTB
				hW := A_ScreenHeight
			}
		}
		else{ ;在下
			xW := 0	
			yW := 0
			lW := A_ScreenWidth
			hW := A_ScreenHeight - hightTB
		}
	}
	else{ ;在右
		xW := 0
		yW := 0
		lW := A_ScreenWidth - lengthTB
		hW := A_ScreenHeight
	}
	WinSet, Style, ^0xC00000, A
return

;打开剪贴板中多个链接
OpenClipURLS:
	Loop, parse, clipboard, `n, `r  ; 在 `r 之前指定 `n, 这样可以同时支持对 Windows 和 Unix 文件的解析.
	{
		cu := A_LoopField
		if(RegExMatch(A_LoopField,"^http")){
			sleep 200
			run, nircmd shexec open "%A_LoopField%"
		}
	}
return
;************** 自定义方法$ **************






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


;#k:: WindowPadMove("0, -1, 1.0, 0.5")

;#j:: WindowPadMove("0, +1, 1.0, 0.5")

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


;#a:: WinClose A
;去掉标题栏
#f11::
	;WinSet, Style, ^0xC00000, A ;用来切换标题行，主要影响是无法拖动窗口位置。
	;WinSet, Style, ^0x40000, A ;用来切换sizing border，主要影响是无法改变窗口大小。
	GoSub, Sub_WindowNoCaption
return

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

Tab & l::sendinput #{right}
Tab & h::sendinput #{left}
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
Tab & m:: GoSub,Sub_MaxRestore

Tab & i:: SendInput,{End}


Tab & u:: SendInput,{Home}


Tab & j:: SendInput,{PgDn}


Tab & k:: SendInput,{PgUp}





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


Escape & c::
	GoSub,Sub_ClipAppend
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
^`;:: SendInput,^`;
^+`;:: SendInput,^+`;
!`;:: SendInput,!`;
::: SendInput,:

`; & z::send {'}
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
`; & LCtrl::send {~}
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



>!g::
	GV_KeyClickAction1 := "SendInput,^{Home}^+{End}^v{Enter}"
	GV_KeyClickAction2 := "SendInput,^v{Enter}"
	GoSub,Sub_KeyClick123
return

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
RCtrl::
send {lshift down}{lalt down}{lshift up}{lalt up}
send {Blind}{RCtrl Up}
return

;RCtrl:: ; 切换 输入法
;Switch := ((Switch = 1) ? 0 : 1)
;If Switch
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
;Else
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;Return


;============================================================================================================

;测试
>^p::
    MsgBox,%A_CaretX% %A_CaretY%, A_CaretX, A_CaretY 
return
;切换到 phpstorm
RCtrl & a::
send #1
send {Blind}{RCtrl up}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
return
;切换到 excel
RCtrl & e::
send #5
send {Blind}{RCtrl up}
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 


return

;切换到 小程序开发者工具 
RCtrl & z::
send #6
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return

; 切换 到 vs code
RCtrl & v::
send #8
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return

; 切换 到 有道云笔记
RCtrl & b::
send ^+!b
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return

;切换到 phpstorm
RCtrl & q::
send #4
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return
;============================================================================================================

;============================================================================================================
;切换到 帮助 
RCtrl & c::
send #9
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return
;============================================================================================================

;============================================================================================================
;切换到 source tree
RCtrl & s::
send  #2
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return
;============================================================================================================



;============================================================================================================
;切换到 navicat
RCtrl & n::
send #3
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return

;============================================================================================================


;============================================================================================================
RCtrl & w::   ; 切换 word
send #7
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{RCtrl up}
return
;============================================================================================================


RCtrl & x:: 
        sendinput,^{f4} ; 关闭标签
return
;
;return

;RCtrl & k::wheelup ;鼠标滚轮向上
;
;return
;RCtrl & j::wheeldown ;鼠标滚轮向下
;return

RCtrl & h::
    send ^+{tab}
return

RCtrl & l::
    send ^{tab}
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
#IfWinActive  ahk_exe PotPlayerMini.exe	;chrome  相关快捷键

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
^!1::
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


;限定 vs 目录树{{{1
#if WinActiveListTree()
space::SendInput,{enter}
!o::SendInput,{appskey}
+j::SendInput,+{Down}
+k::SendInput,+{Up}
;l::SendInput, {Right}
;j::SendInput, {Down}
;k::SendInput, {Up}
;h::SendInput, {Left}
!e::SendInput,{Delete} ;删除文件 
!r::SendInput,+{F6} ;重命名文件 
#if 
WinActiveListTree(){
	WinGetClass, this_class, A
	WinGetTitle, this_title, A
	If (this_class ~= "^HwndWrapper.*")  ;正则 class 里面 有没有含 HwndWrapper.* 这个类
	{
        if(InStr(this_title,"添加新项")==false){
            if(InStr(this_title,"Microsoft Visual Studio(管理员)")==false) ;字符串 标题里面 必须不包含 指定字符串
                return true ;两个都满足 返回 true 
            return false ;不然 就 false 
            } 
        return false ;不然 就 false 
    } 
	return false
}


;限定 phpstorm 目录树{{{1
#if, winactive("Project") 

l::right
h::left
k::up
j::down
o::appskey


#if


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

`; & tab::
send ^+!=;关闭多余的选项卡
return


RCtrl & o:: ;停止运行 stop
    send +{F5}
Return

RCtrl & m:: ;错误列表
    send ^\e
Return
RCtrl & d:: ;调试 
    send {F10}
Return

RCtrl & Space:: ;显示该文件的所有方法 
    send ^{F12}
Return
RCtrl & i:: ;运行 不调试 
    send +{F10}
Return

RCtrl & h:: ;上一个 选项卡 
    send ^{PgUp}
Return
RCtrl & l:: ;下一个 选项卡 
    send ^{PgDn}
Return

Rctrl & r:: ;自动完成代码 
    send ^\
    send ^\
    send {Blind} {RCtrl Up}
Return


`; & t:: ;由于visual studio 会自动补全{} 导致 多加一个} ，所以 改下 只弄一个 { 防止补全
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
;限定 phpstorm 和 rider {{{1
#if, winactive("ahk_exe phpstorm64.exe") || winactive("ahk_exe rider64.exe") || winactive("ahk_exe webstorm64.exe") 
Esc::
        sendinput {Esc}
        PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
return

;#IfWinActive  ahk_exe phpstorm65.exe 和 rider64.exe	;phpstorm  相关快捷键

`; & t:: ;由于Rider  会自动补全{} 导致 多加一个} ，所以 改下 只弄一个 { 防止补全
sendraw {}
sendinput {left}
return


`; & esc::+F6

`; & tab::
send +{Esc} ;关闭多余的选项卡
return

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
sendinput {Esc}A// ;注释代码 
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721 
send {Blind}{LCtrl up}
return


LCtrl & RShift::
SendInput ^/ ;注释代码 
return




RCtrl & r:: ;自动完成代码 
send,+^{enter}
send,{Esc}
send {Blind}{RCtrl up}
return


RCtrl & o:: ;停止运行 stop
    send ^{F2}
Return

RCtrl & i:: ;运行 不调试 
    send +{F10}
Return

RCtrl & d:: ;调试模式  (Debug)
    send +{F9}
Return



RCtrl & t::  +^!t  ;快速导航 

RCtrl & g::  !ins ; 快速生成代码 generage  code

RCtrl & j::  
    send {F8}
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


;限定 Qtranslate {{{1
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
    sendinput gt
;send {Blind}{RCtrl up}
return

RCtrl & h::
    SendInput gT
;send {Blind}{RCtrl up}

RCtrl & i::
    send {F5}
;send {Blind}{RCtrl up}
return


RCtrl & o::
    send {F4}
send {Blind}{RCtrl up}
return

^!l::
    send {F3}
return




return

RCtrl & x:: ;保存退出 一个文件  相当于 ctrl + F4

SendInput :q {Enter}
send {Blind}{RCtrl up}
return

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
