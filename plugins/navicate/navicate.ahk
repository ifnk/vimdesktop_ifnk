; 因为navicate对快捷键支持很不友好，此插件功能不全而且部分功能有问题。
; 仅用于必须临时使用navicate的场景。

navicate:

    vim.SetWin("navicate", "TNavicatMainForm") ;设置navicat  的class(程序限制)

    ; insert模式
    vim.mode("insert", "navicate")

    vim.map("<esc>", "<navicate_NormalMode>", "navicate")

    vim.map("<c-f>", "<navicate_SearchMode>", "navicate")

    vim.map("<enter>", "<navicat_enter>", "navicate")
    vim.map("<esc>", "<navicat_esc>", "navicate")


    ; search模式
    vim.mode("search", "navicate")

    vim.map("<esc>", "<navicat_esc>", "navicate")

    vim.map("<tab>", "<navicate_search_tab>", "navicate")
    vim.map("<enter>", "<navicate_search_tab>", "navicate")

    ; edit模式(单元格编辑模式)
    vim.mode("edit", "navicate")

    vim.map("<esc>", "<navicate_NormalMode>", "navicate")
    vim.map("<enter>", "<navicate_saveAndGoNormalMode>", "navicate")


    ; normal模式
    vim.mode("normal", "navicate")

    vim.map("i", "<navicate_InsertMode>", "navicate")
    vim.map("<c-f>", "<navicate_SearchMode>", "navicate")
    vim.map("<c-r>", "<navicate_refresh>", "navicate")
    vim.map("s", "<navicate_EditMode>", "navicate")
    vim.map("c", "<navicate_EditMode_Batch>", "navicate")

    vim.map("0", "<0>", "navicate")
    vim.map("1", "<1>", "navicate")
    vim.map("2", "<2>", "navicate")
    vim.map("3", "<3>", "navicate")
    vim.map("4", "<4>", "navicate")
    vim.map("5", "<5>", "navicate")
    vim.map("6", "<6>", "navicate")
    vim.map("7", "<7>", "navicate")
    vim.map("8", "<8>", "navicate")
    vim.map("9", "<9>", "navicate")

    ; hjkl 在 navicate 数据库软件 里面  是 上下左右 空格 是 确定
    vim.map("j", "<down>", "navicate")
    vim.map("k", "<up>", "navicate")
    vim.map("h", "<left>", "navicate")
    vim.map("l", "<right>", "navicate")
    vim.map("x", "<DeleteOneline>", "navicate")
    vim.map("dd", "<navicate_delete>", "navicate")
    vim.map("dh", "<navicate_左侧导航栏切换显示>", "navicate")
    vim.map("<sp-m>", "<navicate_左侧导航栏切换显示>", "navicate")
    vim.map("<space>", "<space>", "navicate")

    ;ctrl+d  设计数据表
    vim.map("o", "<appskey>", "navicate")
    vim.map("ds", "<navicate_delete_str>", "navicate")
    vim.map("as", "<navicate_add_str>", "navicate")
    vim.map("ai", "<navicate_insert_str>", "navicate")
    vim.map("ad", "<navicate_add_data>", "navicate")
    vim.map("y", "<copy>", "navicate")
    vim.map("p", "<paste>", "navicate")

    vim.map("ml", "<move_right_word>", "navicate")
    vim.map("mh", "<move_left_word>", "navicate")
    vim.map("t", "<navicate_main_window>", "navicate")
    vim.map("r", "<rename>", "navicate")
    vim.map("gg", "<home>", "navicate")
    vim.map("G", "<end>", "navicate")
    vim.map("H", "<select_left>", "navicate")
    vim.map("J", "<select_down>", "navicate")
    vim.map("K", "<select_up>", "navicate")
    vim.map("L", "<select_right>", "navicate")
    vim.map("vh", "<select-left-line>", "navicate")
    vim.map("vl", "<select-right-line>", "navicate")
    vim.map("vj", "<select-down-line>", "navicate")
    vim.map("vk", "<select-up-line>", "navicate")
    vim.map("<c-h>", "<+^tab>", "navicate")
    vim.map("<c-l>", "<^tab>", "navicate")
    vim.map("<a-i>", "<backspace>", "navicate")

    vim.BeforeActionDo("navicate_ForceInsertMode", "navicate")

return



<navicate_InsertMode>:

    vim.mode("insert", "navicate")
return

<navicate_NormalMode>:
    send {esc}
    vim.mode("normal", "navicate")
return

<navicate_EditMode>:  ;先发送enter（有个光标 ） ,然后进入 editmode 单元格编辑模式
    send {enter}
    send {right}
    vim.mode("edit", "navicate")
return

<appskey>:
    send {AppsKey}
return
<navicate_SearchMode>:
    send ^f
    PostMessage, 0x50, 0, 0x4090409, , A ;切换为英文输入法
    vim.mode("search", "navicate")
return

<navicate_saveAndGoNormalMode>: ;在 edit 模式 中按 esc 时 ，将会先 发送 ctrl+s 将 保存 数据表，然后 进入 normal 模式
    send ^s
    vim.mode("normal", "navicate")
return
<navicate_search_tab>: ;在search 模式 中按tab 时 ，将会先 发送 tab 将 焦点 切换到 数据表列表，然后 进入 normal 模式
    send {tab}
    vim.mode("normal", "navicate")
return


<navicat_enter>: ;先按enter 然后 进入 Normal模式
    send {enter}
    vim.mode("normal", "navicate")
return
<navicat_esc>: ;先按esc 然后 进入 Normal模式
    send {esc}
    vim.mode("normal", "navicate")
return
<navicate_EditMode_Batch>:
    vim.mode("edit", "navicate")
return

<navicate_main_window>: ;navicat 主窗口
    send,{F8}  ; 进入 navicat 主窗口 
    send,^f ;打开搜索 框
    send,{BackSpace} ;按退格 删除  关键词  显示所有 的列表
    vim.mode("search", "navicate") ;进入 搜索 模式 
    PostMessage, 0x50, 0, 0x4090409, , A ;输入法强制 变成 英文 模式 
return
<+^tab>:
    send,+^{tab}
return

<select-left-line>: ;向左选中正行
    send,+^{left}
return

<select-right-line>: ;向右选中正行
    send,+^{right}
return

<select-up-line>: ;向上选中正行
    send,+^{up}
return

<select-down-line>: ;向下选中正行
    send,+^{down}
return

<select_right>:
    send,+{right}
return
<select_up>:
    send,+{up}
return

<rename>: ;重命名 同时 进入 insert模式
    send,{F2}
    vim.mode("insert", "navicate")
return

<select_down>:
    send,+{down}
return
<select_left>:
    send,+{left}
return
<Delete>:
    send,{Delete}
return
<DeleteOneline>:  ;删除 一行数据
    send,^{Delete}
return

<^tab>:
    send,^{tab}
return

<move_left_word>: ;移动到上一个单词
    send,^{left}
return


<move_right_word>: ;移动到下一个单词
    send,^{right}
return

<v_select_left_word>: ;选中到上一个单词
    send,^+{left}
return


<v_select_right_word>: ;选中到下一个单词
    send,^+{right}
return

<navicate_Tree>: ;navicate切换到 目录树
    ControlFocus, TVirtualStringTree1
    ControlFocus, TVirtualStringTree2
    ControlFocus, TVirtualStringTree3
    ControlFocus, TVirtualStringTree4
    Return
return

<navicate_delete_str>: ;navicate 删除 字段
    ControlClick , TActionToolBar1,,ActionToolBar1,,,NA x267 y13
    send {tab}
    send {enter}
    Return
return

<navicate_add_str>: ;navicate 添加 字段
    ControlClick , TActionToolBar1,,ActionToolBar1,,,NA x113 y13
    Return
return

<copy>: ;navicate 删除 delete
    send ^c

    Return
return
<paste>: ;navicate 删除 delete
    send ^v

    Return
return
<navicate_refresh>:
        sendinput,{F5}
        return
return
<navicate_delete>: ;navicate 删除 delete
    send {delete}

    Return
return
<navicate_add_data>: ;navicate 插入 一条数据 (记得 要在naviacat 里面 所有 的 字段 都有数据（空的也算）才可执行 )
    sendinput ^n
    sendinput ^s
    Return
return
<navicate_insert_str>: ;navicate 插入 字段
    ControlClick , TActionToolBar1,,ActionToolBar1,,,NA x189 y13

    Return
return

<navicate_左侧导航栏切换显示>: 
    ControlClick , TPanel6,,,,,NA x13 y12
    Return
return


return
