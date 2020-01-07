; 因为word对快捷键支持很不友好，此插件功能不全而且部分功能有问题。
; 仅用于必须临时使用word的场景。

word:
    ; 定义注释
    vim.comment("<word_NormalMode>", "进入normal模式")
    vim.comment("<word_InsertMode>", "进入insert模式")
    vim.comment("<word_selectMode>", "进入select模式")
    vim.comment("<word_deleteMode>", "进入delete模式")

    vim.SetWin("word", "OpusApp")

    ; insert模式
    vim.mode("insert", "word")

    vim.map("<esc>", "<word_NormalMode>", "word")

    ; delete模式
    vim.mode("delete", "word")
    vim.map("<esc>", "<word_NormalMode>", "word")

    vim.map("d", "<word_删除一行>", "word")
    vim.map("e", "<word_删除下一个单词>", "word")
    vim.map("E", "<word_向后删除到标点符号结尾>", "word")
    vim.map("b", "<word_删除上一个单词>", "word")
    vim.map("B", "<word_向前删除到标点符号开头>", "word")
    vim.map(";s", "<word_删除到行尾>", "word")
    vim.map(";q", "<word_删除到行首>", "word")

    ; select模式
    vim.mode("select", "word")

    vim.map("0", "<0>", "word")
    vim.map("1", "<1>", "word")
    vim.map("2", "<2>", "word")
    vim.map("3", "<3>", "word")
    vim.map("4", "<4>", "word")
    vim.map("5", "<5>", "word")
    vim.map("6", "<6>", "word")
    vim.map("7", "<7>", "word")
    vim.map("8", "<8>", "word")
    vim.map("9", "<9>", "word")

    vim.map("zjd", "<word_字号加大>", "word")

    vim.map("<esc>", "<word_NormalMode>", "word")

    vim.map("gg", "<word_选择至文档开头>", "word")
    vim.map("G", "<word_选择至文档结尾>", "word")
    vim.map("x", "<word_删除_select>", "word")
    vim.map("d", "<word_删除_select>", "word")
    vim.map("s", "<word_修改_select>", "word")
    vim.map("j", "<word_向下选择一个字符>", "word")
    vim.map("k", "<word_向上选择一个字符>", "word")
    vim.map("h", "<word_向左选择一个字符>", "word")
    vim.map("l", "<word_向右选择一个字符>", "word")
    vim.map("y", "<word_复制>", "word")
    vim.map("e", "<word_向右选择一个词语>", "word")
    vim.map("E", "<word_向后选择到标点符号结尾>", "word")
    vim.map("B", "<word_向前选择到标点符号开头>", "word")

    vim.map("b", "<word_向左选择一个词语>", "word")
    vim.map(";q", "<word_选择到行首>", "word")
    vim.map(";s", "<word_选择到行尾>", "word")
    vim.map("K", "<word_扩展选择>", "word")
    vim.map("J", "<word_缩小选择>", "word")
    vim.map("p", "<word_无格式粘贴>", "word")


    vim.map("ip", "<word_选择当前段落>", "word")

    vim.map("<c-d>", "<word_向下翻页_select>", "word")
    vim.map("<c-u>", "<word_向上翻页_select>", "word")

    ; normal模式
    vim.mode("normal", "word")

    vim.map("i", "<word_InsertMode>", "word")
    vim.map("I", "<word_在行首插入>", "word")
    vim.map("a", "<word_InsertMode>", "word")
    vim.map("A", "<word_在行末附加>", "word")
    vim.map("v", "<word_selectMode>", "word")
    vim.map("d", "<word_deleteMode>", "word")


    vim.map("qq", "<word_录制宏>", "word")
    vim.map("qw", "<word_暂停录制宏>", "word")
    vim.map("qe", "<word_查看宏>", "word")
    vim.map("n", "<word_查找下一个关键词>", "word")
    vim.map("N", "<word_查找上一个关键词>", "word")

    vim.map("s", "<word_修改_normal>", "word")

    vim.map("0", "<0>", "word")
    vim.map("1", "<1>", "word")
    vim.map("2", "<2>", "word")
    vim.map("3", "<3>", "word")
    vim.map("4", "<4>", "word")
    vim.map("5", "<5>", "word")
    vim.map("6", "<6>", "word")
    vim.map("7", "<7>", "word")
    vim.map("8", "<8>", "word")
    vim.map("9", "<9>", "word")


    vim.map("<s-v>", "<word_选择当前行>", "word")
    vim.map("<s-k>", "<word_扩展选择>", "word")
    vim.map("<s-h>", "<word_移至窗口顶端>", "word")
    vim.map("<s-l>", "<word_移至窗口结尾>", "word")
    vim.map("<s-p>", "<word_粘贴>", "word")
    ; hjkl 在 word 数据库软件 里面  是 上下左右 空格 是 确定
    vim.map("j", "<down>", "word")
    vim.map("J", "<word_连接下一行>", "word")
    vim.map("k", "<up>", "word")
    vim.map("h", "<left>", "word")
    vim.map("l", "<right>", "word")
    vim.map("zd", "<word_比例放大>", "word")
    vim.map("zx", "<word_比例缩小>", "word")
    vim.map("x", "<DeleteOneline>", "word")
    vim.map("u", "<word_撤销>", "word")
    vim.map("p", "<word_无格式粘贴>", "word")

    vim.map(";;ym", "<word_页眉>", "word")

    vim.map(";q", "<word_到行首>", "word")
    vim.map(";s", "<word_到行尾>", "word")


    vim.map("zjd", "<word_字号加大>", "word")

    vim.map("x", "<word_删除_normal>", "word")
    vim.map("e", "<word_向右移动一个单词>", "word")
    vim.map("E", "<word_向后移到标点符号结尾>", "word")
    vim.map("b", "<word_向左移动一个单词>", "word")
    vim.map("w", "<word_向后移到标点符号结尾>", "word")
    vim.map("B", "<word_向前移到标点符号开头>", "word")
    vim.map("r", "<rename>", "word")
    vim.map("yy", "<word_复制一行>", "word")
    vim.map("<s-o>", "<word_往上另起一行>", "word")
    vim.map("o", "<word_往下另起一行>", "word")
    vim.map("gg", "<word_移至文档开头>", "word")
    vim.map("G", "<word_移至文档结尾>", "word")
    vim.map("<c-r>", "<word_回退撤销>", "word")
    vim.map("<c-d>", "<word_向下翻页>", "word")
    vim.map("<c-u>", "<word_向上翻页>", "word")
    vim.map("<c-y>", "<word_滚轮上移>", "word")
    vim.map("<c-e>", "<word_滚轮下移>", "word")
    vim.map("<a-i>", "<backspace>", "word")

    vim.BeforeActionDo("word_ForceInsertMode", "word")

return


;===================================================================
/*
    函数:  Word_Get
    作用: 返回word对象
    参数: 
    返回: 
    作者:  Kawvin
    版本:  0.1
*/
Word_Get() {
	global word
	word:=ComObjActive("Word.Application")
return
}

/*
    函数:  Word_Destroy
    作用: 摧毁word对象
    参数: 
    返回: 
    作者:  Kawvin
    版本:  0.1
*/
Word_Destroy(){
	global word
	word:=
}


<word_NormalMode>:
    Word_Get()
    word.selection.EndOf
    vim.mode("normal", "word")
    return

<word_InsertMode>:
    vim.mode("insert", "word")
return

<word_selectMode>:
    vim.mode("select", "word")
return

<word_deleteMode>:
    vim.mode("delete", "word")
return


Word_Zoom(fZoom:="-5"){
	if (fZoom="")
		return
	global word
	Word_Get()
	if (regexmatch(fZoom,"\+[0-9]+")) {		;放大
		ZoomNum:=substr(fZoom,2)
		try
			word.ActiveWindow.ActivePane.View.Zoom.Percentage+=ZoomNum
	}else if (regexmatch(fZoom,"\-[0-9]+")) {	;缩小
		ZoomNum:=substr(fZoom,2)
		try
			word.ActiveWindow.ActivePane.View.Zoom.Percentage-=ZoomNum
	}else if (regexmatch(fZoom,"[0-9]+")) {		;设置比例 		
		ZoomNum:=substr(fZoom,1)
		if(ZoomNum<10)
			ZoomNum:=10
		if(ZoomNum>500)
			ZoomNum:=500
		try
			word.ActiveWindow.ActivePane.View.Zoom.Percentage:=ZoomNum
	}else {
		try
			word.ActiveWindow.ActivePane.View.Zoom.Percentage-=5
	}
	Word_Destroy()
}

<word_比例放大>:
    fZoom:="+5"
	global word
	Word_Get()
    ZoomNum:=substr(fZoom,2)
    try
        word.ActiveWindow.ActivePane.View.Zoom.Percentage+=ZoomNum
	Word_Destroy()
return
<word_比例缩小>:
    fZoom:="-5"
	global word
	Word_Get()
    ZoomNum:=substr(fZoom,2)
    try
        word.ActiveWindow.ActivePane.View.Zoom.Percentage-=ZoomNum
	Word_Destroy()
return

<word_删除一行>:
    vim.mode("normal", "word")
	global word
	Word_Get()
    try
        word.Selection.HomeKey(5)
        word.Selection.EndKey(5,1)
        word.Selection.Cut

        ;取消选中状态，将区域或选定内容的结束字符位置移动或扩展至最近的一个指定文本单元开头。
        word.Selection.Startof(1)
	Word_Destroy()
return
<word_复制一行>:
	global word
	Word_Get()
    try
        word.Selection.HomeKey(5)
        word.Selection.EndKey(5,1)
        word.Selection.Copy

        ;取消选中状态，将区域或选定内容的结束字符位置移动或扩展至最近的一个指定文本单元开头。
        word.Selection.Startof(1)
	Word_Destroy()
return

<word_查找上一个关键词>:
	global word
	Word_Get()
	try
        word.Selection.MoveRight(2,1,1)
        st:=word.Selection
        msgbox st
		Word_Destroy()
return
    ;ComObjActive("word.application").ActiveWindow.selection.find.execute("订单", , , , , , 0, , , "^&", 1)
<word_查找下一个关键词>:
    ComObjActive("word.application").ActiveWindow.selection.find.execute("订单", , , , , , 1, , , "^&", 1)
return
<word_往上另起一行>:
    vim.mode("insert", "word")
	global word
	Word_Get()
    try
        word.Selection.HomeKey(5)
        word.Selection.TypeText(Text:=Chr(13))
        word.Selection.MoveUp(5,1)
	Word_Destroy()
return
return
<word_往下另起一行>:
    vim.mode("insert", "word")
	global word
	Word_Get()
    try
        word.Selection.EndKey(5)
        word.Selection.TypeText(Text:=Chr(13))
        word.Selection.TypeText(Text:=Chr(13))
	Word_Destroy()
return
<word_滚轮下移>:
	global word
	Word_Get()
    try
        word.ActiveWindow.SmallScroll(4,0)

	Word_Destroy()
return
<word_滚轮上移>:
	global word
	Word_Get()
    try
        word.ActiveWindow.SmallScroll(0,4)
	Word_Destroy()
return

<word_修改_normal>:
    vim.mode("insert","word")
	global word
	Word_Get()
    try
        word.Selection.MoveRight(1,1,1)
        word.Selection.Cut
	Word_Destroy()
return
return

<word_删除_select>:
	global word
	Word_Get()
    try
        word.Selection.Cut
        word.Selection.MoveRight(1,1,0)
	Word_Destroy()
return

<word_删除_normal>:
	global word
	Word_Get()
    try
        word.Selection.MoveRight(1,1,1)
        word.Selection.Cut
        word.Selection.MoveRight(1,1,0)
	Word_Destroy()
return

<word_修改_select>:
    vim.mode("insert","word")
	global word
	Word_Get()
    try
        word.Selection.Cut
	Word_Destroy()
return

<word_向上翻页_select>:
	global word
	Word_Get()
    try
        word.Selection.MoveUp(7,1,1)
	Word_Destroy()
return
<word_向下翻页_select>:
	global word
	Word_Get()
    try
        word.Selection.MoveDown(7,1,1)
	Word_Destroy()
return

<word_向上翻页>:
	global word
	Word_Get()
    try
        word.Selection.MoveUp(7)
	Word_Destroy()
return
<word_向下翻页>:
	global word
	Word_Get()
    try
        word.Selection.MoveDown(7)
	Word_Destroy()
return
<word_缩小选择>:
	global word
	Word_Get()
    try
        word.Selection.Shrink
	Word_Destroy()
    vim.mode("select", "word") ;然后进入插入模式
return
<word_扩展选择>:
	global word
	Word_Get()
    try
        word.Selection.Extend
	Word_Destroy()
    vim.mode("select", "word") ;然后进入插入模式
return

<word_选择至文档开头>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
    try
        word.Selection.HomeKey(6,1)
	Word_Destroy()
return
<word_选择至文档结尾>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
    try
        word.Selection.EndKey(6,1)
	Word_Destroy()
return
<word_移至文档开头>:
	global word
	Word_Get()
    try
        word.Selection.HomeKey(6)
	Word_Destroy()
return

<word_向后删除到标点符号结尾>:
    vim.mode("normal", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveEndUntil("、,。, ，……")
        word.Selection.Cut
        ;word.Selection.EndOf()
        ;word.Selection.MoveRight(1,1,1)
	Word_Destroy()
return
<word_向前删除到标点符号开头>:
    vim.mode("normal", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveStartUntil("、,。, ，……",-1073741823)
        word.Selection.Cut
        ;word.Selection.MoveLeft(1,1,1)
	Word_Destroy()
return

<word_向后选择到标点符号结尾>:
    vim.mode("select", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveEndUntil("、,。, ，……")
        ;word.Selection.EndOf()
        word.Selection.MoveRight(1,1,1)
	Word_Destroy()
return
<word_向前选择到标点符号开头>:
    vim.mode("select", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveStartUntil("、,。, ，……",-1073741823)
        ;word.Selection.MoveLeft(1,1,1)
	Word_Destroy()
return

<word_向后移到标点符号结尾>:
    vim.mode("normal", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveEndUntil("、,。, ，……")
        word.Selection.EndOf()
        word.Selection.MoveRight(1)
	Word_Destroy()
return
<word_向前移到标点符号开头>:
    vim.mode("normal", "word")
	global word
	Word_Get()
    try
        word.Selection.MoveEndUntil("、,。, ，……",-1073741823)
        word.Selection.StartOf()
        word.Selection.MoveLeft(1)
	Word_Destroy()
return

<word_移至文档结尾>:
	global word
	Word_Get()
    try
        word.Selection.EndKey(6)
	Word_Destroy()
return
<word_移至窗口结尾>:

	global word
	Word_Get()
	try
        word.Selection.MoveDown(11)
	Word_Destroy()
return

return
<word_移至窗口顶端>:
	global word
	Word_Get()
	try
        word.Selection.MoveUp(11)
	Word_Destroy()
return

<word_撤销>:
	global word
	Word_Get()
	try
        word.ActiveDocument.Undo
	Word_Destroy()
return

<word_回退撤销>:
	global word
	Word_Get()
	try
        word.ActiveDocument.Redo
	Word_Destroy()
return

<word_去除选中文本里的换行符>:
    vim.mode("normal", "word")  ;进入 normal 模式 
	global word
	Word_Get()
    try
 ;       word.Selection.Range.Text := Replace(word.Selection.Range.Text, Chr(13), "")
        ;将所选内容 里面 带有  enter 换行 符 的 字符替换 成 空的
        ;RegExReplace 是 ahk 自带 的 替换 字符串函数 ，原来 vba 里面 的是 Replace (换一下就行)
        word.Selection.Range.Text := RegExReplace(word.Selection.Range.Text, Chr(13), "")


	Word_Destroy()
return

<word_连接下一行>:
    vim.mode("normal", "word")  ;进入 normal 模式 
	global word
	Word_Get()
    try
        word.Selection.HomeKey(5) ;光标移动到行首
        word.Selection.EndKey(5,1) ;选择到行尾
 ;       word.Selection.Range.Text := Replace(word.Selection.Range.Text, Chr(13), "")
        ;将所选内容 里面 带有  enter 换行 符 的 字符替换 成 空的
        ;RegExReplace 是 ahk 自带 的 替换 字符串函数 ，原来 vba 里面 的是 Replace (换一下就行)
        ;word.Selection.Range.Text := RegExReplace(word.Selection.Range.Text, Chr(13), "")
        word.Selection.Range.Text := StrReplace(word.Selection.Range.Text, Chr(13), "")

	Word_Destroy()
return

<word_字号加大>:
	global word
	Word_Get()
	try
		word.selection.font.Grow
	Word_Destroy()
return

<word_页眉>:
	global word
	Word_Get()
    ;没看懂 
    if(word.ActiveWindow.View.SplitSpecial <> 0)
    {
        word.ActiveWindow.Panes(2).Close
    }

    ;如果 视图 为  1（普通视图 wdNormalView） 或者 2(大纲视图 wdOutlineView)
    if(word.ActiveWindow.ActivePane.View.Type := 1 Or word.ActiveWindow.ActivePane.View.Type = 2)
    {
        ; 则将其 弄成  3（页面视图） 不然 没法 打开 页眉
        word.ActiveWindow.ActivePane.View.Type := 3
    }
    word.ActiveWindow.ActivePane.View.SeekView := 9 ;打开页眉
    word.selection.EndKey.Unit:=wdStory, Extend:=wdMove ;到行尾
	Word_Destroy()
return

<word_到行首>:

	global word
	Word_Get()
	try
        word.Selection.HomeKey(5)
		Word_Destroy()
return


<word_到行尾>:
	global word
	Word_Get()
	try
        word.Selection.EndKey(5)
		Word_Destroy()
return

<word_在行末附加>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
	try
        word.Selection.EndKey(5)
		Word_Destroy()
return

<word_在行首插入>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
	try
        word.Selection.HomeKey(5)
		Word_Destroy()
return


<word_录制宏>:
        send {lalt}
        send wmr
    return

<word_暂停录制宏>:
        send {lalt}
        send wmr
    return
<word_查看宏>:
        send {lalt}
        send wmv
    return

<word_下一个窗口>:
	global word
	Word_Get()
	try
        word.ActiveDocument.ActiveWindow.Next.Activate 
		Word_Destroy()
return

<word_选择当前段落>:
	global word
	Word_Get()
	try
        ;选择光标所在段落的内容
        word.Selection.MoveUp(4,1,0)
        word.Selection.MoveDown(4,1,1)
		Word_Destroy()
return
<word_选择当前行>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
    try
        word.Selection.HomeKey(5)
        word.Selection.EndKey(5,1)
	Word_Destroy()
return

;选择到行尾

<word_删除到行首>:
    vim.mode("normal", "word")
	global word
	Word_Get()
	try
        word.Selection.HomeKey(5,1)
        word.Selection.Cut
        Word_Destroy()
return

<word_删除上一个单词>:
    vim.mode("normal", "word")
	global word
	Word_Get()
	try
        word.Selection.MoveLeft(2,1,1)
        word.Selection.Cut
        Word_Destroy()
return

<word_删除下一个单词>:
    vim.mode("normal", "word")
	global word
	Word_Get()
	try
        word.Selection.MoveRight(2,1,1)
        word.Selection.Cut
        Word_Destroy()
return

<word_删除到行尾>:
    vim.mode("normal", "word")
	global word
	Word_Get()
	try
        word.Selection.EndKey(5,1)
        word.Selection.Cut
        Word_Destroy()
return

<word_选择到行首>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
	try
        word.Selection.HomeKey(5,1)
        Word_Destroy()
return

<word_选择到行尾>:
    vim.mode("select", "word")  ;进入 select 模式 
	global word
	Word_Get()
	try
        word.Selection.EndKey(5,1)
        Word_Destroy()
return

<word_向下选择一个字符>:

	global word
	Word_Get()
	try
        word.Selection.MoveDown(5,1,1)
		Word_Destroy()
return

<word_向上选择一个字符>:

	global word
	Word_Get()
	try
        word.Selection.MoveUp(5,1,1)
		Word_Destroy()
return

<word_向左选择一个字符>:
	global word
	Word_Get()
	try
        word.Selection.MoveLeft(1,1,1)
		Word_Destroy()
return

<word_向右选择一个字符>:
	global word
	Word_Get()
	try
        word.Selection.MoveRight(1,1,1)
		Word_Destroy()
return
<word_向右选择一个词语>:

	global word
	Word_Get()
	try
        word.Selection.MoveRight(2,1,1)
		Word_Destroy()
return


<word_向左选择一个词语>:
	global word
	Word_Get()
	try
        word.Selection.MoveLeft(2,1,1)
		Word_Destroy()
return

<word_向右移动一个单词>:

	global word
	Word_Get()
	try
        word.Selection.MoveRight(2,1,0)
		Word_Destroy()
return

<word_向左移动一个单词>:

	global word
	Word_Get()
	try
        word.Selection.MoveLeft(2,1,0)
		Word_Destroy()
return

<word_向右移动一个句子>:

	global word
	Word_Get()
	try
        word.Selection.MoveRight(3,1,0)
		Word_Destroy()
return

<word_向左移动一个句子>:

	global word
	Word_Get()
	try
        word.Selection.MoveLeft(3,1,0)
		Word_Destroy()
return

<word_向右选择一个句子>:

	global word
	Word_Get()
	try
        word.Selection.MoveRight(3,1,1)
		Word_Destroy()
return

<word_向左选择一个句子>:

	global word
	Word_Get()
	try
        word.Selection.MoveLeft(3,1,1)
		Word_Destroy()
return

<word_无格式粘贴>:
    vim.mode("normal", "word")  ;进入 normal 模式 
	global word
	Word_Get()
	try
    ;22 代表 PasteAndFormat(type) 类型 是 22  (wdFormatPlainText 22	粘贴为无格式的纯文本文字)
        word.Selection.PasteAndFormat(22)
		Word_Destroy()
return

<word_粘贴>:

    vim.mode("normal", "word")  ;进入 normal 模式 
	global word
	Word_Get()
	try
    ;22 代表 PasteAndFormat(type) 类型 是 16  (wdFormatPlainText 16	保留所粘贴材料的原始格式。)
        word.Selection.PasteAndFormat(16)
		Word_Destroy()
return

<word_复制>:

    vim.mode("normal", "word")  ;进入 normal 模式 
	global word
	Word_Get()
	try
    ;22 代表 PasteAndFormat(type) 类型 是 22  (wdFormatPlainText 22	粘贴为无格式的纯文本文字)
        word.Selection.Copy
        word.Selection.EndOf
		Word_Destroy()
return





