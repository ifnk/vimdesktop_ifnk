#If GetKeyState("Rctrl","p") ;## �ﾳԼ��:��˼�ǵ�keys��ʵ�ʰ���ʱ,һ�����ݾ���Ч
;�л���ǩ
*l::
    If WinActive("ahk_exe gvim.exe")  ;���� gvim ;gvim �л���ǩ
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
#If ;## �ﾳԼ������


