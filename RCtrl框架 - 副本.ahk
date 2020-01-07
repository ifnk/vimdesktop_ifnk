#If GetKeyState("Rctrl","p") ;## 语境约束:意思是当keys被实际按下时,一下内容就生效
;切换标签
*l::
    If WinActive("ahk_exe gvim.exe")  ;限制 gvim ;gvim 切换标签
        {
        send gt
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
		{
        send !{Right}
        return
        }
    else
		{
        send ^{tab}
        return
        }
return
#If ;## 语境约束结束


