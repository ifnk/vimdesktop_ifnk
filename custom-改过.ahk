#x::
    sendinput ^F4
return

#c::Winclose,A
;#c::WinClose,A
;#m::WinMaximize,A
#n::WinMinimize,A

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

#s::
    send #s
    Sleep 100
    SetDefaultKeyboard(0x0409) ;切换 英语 
return




 ;======================================================

Tab::Send {Tab Down}{Tab Up}
;$Tab::Send {Tab}
#tab::#tab
Lalt & tab::Alttab
Tab & Space::Enter
Tab & e::Backspace


;#k:: WindowPadMove("0, -1, 1.0, 0.5")

;#j:: WindowPadMove("0, +1, 1.0, 0.5")
Tab & l::WindowPadMove("+1, 0, 0.5, 1")
Tab & h::WindowPadMove("-1, 0, 0.5, 1")
Tab & k::wheelup
Tab & j::wheeldown
Tab & i::alttab
Tab & u::shiftalttab

Tab & m:: ; 最大化或者 还原窗口大小
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
Esc & l:: Right
Esc & h:: Left
Esc & k:: up
Esc & j::Down

Esc & u::shiftalttab
Esc & i::alttab

esc & w:: ^Right
esc & b:: ^Left

esc & e:: PgDn
esc & q:: PgUp

Esc & g::^w
Esc & r::^r
Esc & t::^t



Esc & y:: send,{AppsKey}


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


;右Ctrl相关的快捷键
;=======================================================
;通过按键切换 输入法
RCtrl::
send {lshift down}{lalt down}{lshift up}{lalt up}
return


;RCtrl:: ; 切换 输入法
;Switch := ((Switch = 1) ? 0 : 1)
;If Switch
;PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文0x4090409=67699721
;Else
;PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
;Return


;============================================================================================================

RAlt::
    send #{F12}
Return



