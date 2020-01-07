; 这是2345阅读器 的 vim 插件  比较 简单…… 
; SunAwtFrame

SunAwtFrame:
    ; 定义注释
    vim.comment("<SunAwtFrame_NormalMode>", "进入normal模式")
    vim.comment("<SunAwtFrame_InsertMode>", "进入insert模式")
    vim.comment("<SunAwtFrame_selectMode>", "进入select模式")
    vim.comment("<SunAwtFrame_deleteMode>", "进入delete模式")

    vim.SetWin("SunAwtFrame", "SunAwtFrame")

    ; insert模式
    vim.mode("insert", "SunAwtFrame")
    vim.map("<esc>", "<SunAwtFrame_NormalMode>", "SunAwtFrame")

    ; delete模式
    vim.mode("delete", "SunAwtFrame")
    ; select模式
    vim.mode("select", "SunAwtFrame")

    ; normal模式
    vim.mode("normal", "SunAwtFrame")




    vim.map("/s", ";", "SunAwtFrame")
    vim.map("<rc-v>", "<切换到vim>", "SunAwtFrame")
    vim.map("<rc-c>", "<切换到chrome>", "SunAwtFrame")
    vim.map("<rc-s>", "<切换到chrome>", "SunAwtFrame")
    vim.map("<rc-n>", "<切换到navicat>", "SunAwtFrame")
    vim.map("<rc-q>", "<切换到postman>", "SunAwtFrame")
    vim.map("<rc-w>", "<切换到word>", "SunAwtFrame")
    vim.map("<rc-e>", "<切换到excel>", "SunAwtFrame")
    vim.map("<rc-s>", "<切换到sourcetree>", "SunAwtFrame")

    vim.map("<rc-g>", "<切换到sourcetree>", "SunAwtFrame")

; 可选
    vim.BeforeActionDo("SunAwtFrame_BeforeActionDo", "SunAwtFrame")


return
; 对符合条件的控件使用insert模式，而不是normal模式
; 此段代码可以直接复制，但请修改AHK_CLASS的值和RegExMatch的第二个参数
SunAwtFrame_BeforeActionDo()
{
    ControlGetFocus, ctrl, AHK_CLASS SunAwtFrame
    ; MsgBox % ctrl
    if RegExMatch(ctrl, "RCPdfSearchEdit1")
        return true
    return false
}



<SunAwtFrame_NormalMode>:
    ControlFocus ,ATL:102CAEE81,AHK_CLASS SunAwtFrame
    vim.mode("normal", "SunAwtFrame")
    return

<SunAwtFrame_InsertMode>:
    vim.mode("insert", "SunAwtFrame")
return

<SunAwtFrame_selectMode>:
    vim.mode("select", "SunAwtFrame")
return

<SunAwtFrame_deleteMode>:
    vim.mode("delete", "SunAwtFrame")
return
<SunAwtFrame_上一个标签>:
send !{left}
return

<SunAwtFrame_下一个标签>:
send !{right}
return

<SunAwtFrame_wheepdown>:
    send {wheeldown}
return

<SunAwtFrame_wheepup>:
    send {wheelup}
return

<SunAwtFrame_重命名>:
    send send+{F6}
return


<SunAwtFrame_单行注释>:
    send send^{/}
return

<SunAwtFrame_完成代码>:
    send,+^{enter}
    send,{Esc}
return

<SunAwtFrame_重构>:
    send +^!t
return

<SunAwtFrame_生成代码>:
    send !{ins} ; 快速生成代码 generage  code
return



;通用 的 动作 

<切换到vim>:
    send #8
    SetDefaultKeyboard(0x0409) ;切换 英语 
return

;切换到 phpstorm
<切换到phpstorm>:
send #1
SetDefaultKeyboard(0x0409) ;切换 英语 
return

<切换到excel>:
send #5
SetDefaultKeyboard(0x0409) ;切换 英语 
return

;切换到 sourcetree
<切换到sourcetree>:
send #6
SetDefaultKeyboard(0x0409) ;切换 英语 
return

<切换到navicat>:
send #3
SetDefaultKeyboard(0x0409) ;切换 英语 
return

<切换到word>:
send #7
SetDefaultKeyboard(0x0409) ;切换 英语 
return

;切换到 postman
<切换到postman>:
send #4
SetDefaultKeyboard(0x0409) ;切换 英语 
return


;切换到 chrome
<切换到chrome>:
send #2
SetDefaultKeyboard(0x0409) ;切换 英语 
return

<上一个标签>:
send ^+{tab}
return

<下一个标签>:
send ^{tab}
return





;切换键盘布局 
; SetDefaultKeyboard(0x0409) ;切换 英语 
SetDefaultKeyboard(LocaleID){
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
	
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(binaryLocaleID, 4, 0)
	NumPut(LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
	
	WinGet, windows, List
	Loop % windows {
		PostMessage 0x50, 0, % Lan, , % "ahk_id " windows%A_Index%
	}
}


