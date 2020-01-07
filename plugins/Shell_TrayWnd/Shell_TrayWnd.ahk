; 这是任务栏 当你 按 win+ t 的时候 进行 hjkl 上下左右操作 ~
; Shell_TrayWnd

Shell_TrayWnd:
    ; 定义注释
    vim.comment("<Shell_TrayWnd_NormalMode>", "进入normal模式")
    vim.comment("<Shell_TrayWnd_InsertMode>", "进入insert模式")
    vim.comment("<Shell_TrayWnd_selectMode>", "进入select模式")
    vim.comment("<Shell_TrayWnd_deleteMode>", "进入delete模式")

    vim.SetWin("Shell_TrayWnd", "Shell_TrayWnd")

    ; insert模式
    vim.mode("insert", "Shell_TrayWnd")
    vim.map("<esc>", "<Shell_TrayWnd_NormalMode>", "Shell_TrayWnd")

    ; delete模式
    vim.mode("delete", "Shell_TrayWnd")
    ; select模式
    vim.mode("select", "Shell_TrayWnd")

    ; normal模式
    vim.mode("normal", "Shell_TrayWnd")


    vim.map("0", "<0>", "Shell_TrayWnd")
    vim.map("1", "<1>", "Shell_TrayWnd")
    vim.map("2", "<2>", "Shell_TrayWnd")
    vim.map("3", "<3>", "Shell_TrayWnd")
    vim.map("4", "<4>", "Shell_TrayWnd")
    vim.map("5", "<5>", "Shell_TrayWnd")
    vim.map("6", "<6>", "Shell_TrayWnd")
    vim.map("7", "<7>", "Shell_TrayWnd")
    vim.map("8", "<8>", "Shell_TrayWnd")
    vim.map("9", "<9>", "Shell_TrayWnd")


    vim.map("h", "<left>", "Shell_TrayWnd")
    vim.map("j", "<down>", "Shell_TrayWnd")
    vim.map("k", "<up>", "Shell_TrayWnd")
    vim.map("l", "<right>", "Shell_TrayWnd")
    vim.map("a", "<切换到phpstorm>", "Shell_TrayWnd")
    vim.map("v", "<切换到vim>", "Shell_TrayWnd")
    vim.map("c", "<切换到chrome>", "Shell_TrayWnd")
    vim.map("s", "<切换到chrome>", "Shell_TrayWnd")
    vim.map("n", "<切换到navicat>", "Shell_TrayWnd")
    vim.map("q", "<切换到postman>", "Shell_TrayWnd")
    vim.map("w", "<切换到word>", "Shell_TrayWnd")
    vim.map("e", "<切换到excel>", "Shell_TrayWnd")
    vim.map("s", "<切换到sourcetree>", "Shell_TrayWnd")


; 可选
    vim.BeforeActionDo("Shell_TrayWnd_BeforeActionDo", "Shell_TrayWnd")


return
; 对符合条件的控件使用insert模式，而不是normal模式
; 此段代码可以直接复制，但请修改AHK_CLASS的值和RegExMatch的第二个参数
Shell_TrayWnd_BeforeActionDo()
{
    ControlGetFocus, ctrl, AHK_CLASS Shell_TrayWnd
    ; MsgBox % ctrl
    if RegExMatch(ctrl, "RCPdfSearchEdit1")
        return true
    return false
}



<Shell_TrayWnd_NormalMode>:
    ControlFocus ,ATL:102CAEE81,AHK_CLASS Shell_TrayWnd
    vim.mode("normal", "Shell_TrayWnd")
    return

<Shell_TrayWnd_InsertMode>:
    vim.mode("insert", "Shell_TrayWnd")
return

<Shell_TrayWnd_selectMode>:
    vim.mode("select", "Shell_TrayWnd")
return

<Shell_TrayWnd_deleteMode>:
    vim.mode("delete", "Shell_TrayWnd")
return
<Shell_TrayWnd_上一个标签>:
send !{left}
return

<Shell_TrayWnd_下一个标签>:
send !{right}
return

<Shell_TrayWnd_wheepdown>:
    send {wheeldown}
return

<Shell_TrayWnd_wheepup>:
    send {wheelup}
return

<Shell_TrayWnd_重命名>:
    send send+{F6}
return


<Shell_TrayWnd_单行注释>:
    send send^{/}
return

<Shell_TrayWnd_完成代码>:
    send,+^{enter}
    send,{Esc}
return

<Shell_TrayWnd_重构>:
    send +^!t
return

<Shell_TrayWnd_生成代码>:
    send !{ins} ; 快速生成代码 generage  code
return




