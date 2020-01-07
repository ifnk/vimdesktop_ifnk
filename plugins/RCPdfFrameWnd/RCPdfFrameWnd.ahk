; 这是2345阅读器 的 vim 插件  比较 简单…… 

RCPdfFrameWnd:
    ; 定义注释
    vim.comment("<RCPdfFrameWnd_NormalMode>", "进入normal模式")
    vim.comment("<RCPdfFrameWnd_InsertMode>", "进入insert模式")
    vim.comment("<RCPdfFrameWnd_selectMode>", "进入select模式")
    vim.comment("<RCPdfFrameWnd_deleteMode>", "进入delete模式")

    vim.SetWin("RCPdfFrameWnd", "SUMATRA_PDF_FRAME")

    ; insert模式
    vim.mode("insert", "RCPdfFrameWnd")

    vim.map("<esc>", "<RCPdfFrameWnd_NormalMode>", "RCPdfFrameWnd")

    ; delete模式
    vim.mode("delete", "RCPdfFrameWnd")

    ; select模式
    vim.mode("select", "RCPdfFrameWnd")


    ; normal模式

    vim.mode("normal", "RCPdfFrameWnd")

    vim.map("<esc>", "<RCPdfFrameWnd_NormalMode>", "RCPdfFrameWnd")
    vim.map("i", "<RCPdfFrameWnd_InsertMode>", "RCPdfFrameWnd")



    vim.map("j", "<RCPdfFrameWnd_wheepdown>", "RCPdfFrameWnd")
    vim.map("k", "<RCPdfFrameWnd_wheepup>", "RCPdfFrameWnd")
    vim.map("<c-y>", "<RCPdfFrameWnd_wheepup>", "RCPdfFrameWnd")
    vim.map("<c-e>", "<RCPdfFrameWnd_wheepdown>", "RCPdfFrameWnd")
    vim.map("<c-d>", "<pgdn>", "RCPdfFrameWnd")
    vim.map("<c-u>", "<pgup>", "RCPdfFrameWnd")
    vim.map("d", "<pgdn>", "RCPdfFrameWnd")
    vim.map("u", "<pgup>", "RCPdfFrameWnd")
; 可选
    vim.BeforeActionDo("RCPdfFrameWnd_BeforeActionDo", "RCPdfFrameWnd")


return
; 对符合条件的控件使用insert模式，而不是normal模式
; 此段代码可以直接复制，但请修改AHK_CLASS的值和RegExMatch的第二个参数
RCPdfFrameWnd_BeforeActionDo()
{
    ControlGetFocus, ctrl, AHK_CLASS RCPdfFrameWnd
    ; MsgBox % ctrl
    if RegExMatch(ctrl, "RCPdfSearchEdit1")
        return true
    return false
}



<RCPdfFrameWnd_NormalMode>:
    ControlFocus ,ATL:102CAEE81,AHK_CLASS RCPdfFrameWnd
    vim.mode("normal", "RCPdfFrameWnd")
    return

<RCPdfFrameWnd_InsertMode>:
    vim.mode("insert", "RCPdfFrameWnd")
return

<RCPdfFrameWnd_selectMode>:
    vim.mode("select", "RCPdfFrameWnd")
return

<RCPdfFrameWnd_deleteMode>:
    vim.mode("delete", "RCPdfFrameWnd")
return

<RCPdfFrameWnd_wheepdown>:
    send {down}
return

<RCPdfFrameWnd_wheepup>:
    send {up}
return




