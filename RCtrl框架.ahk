#Hotstring EndChars  �� ;�����ȼ���Ϊ�ո�,���ǳ�����,���ܵ����ÿո�
#Warn
;~ #SingleInstance force
;~ SetStoreCapsLockMode, Off
#NoEnv  ; �����ձ����Ƿ�Ϊ"��������"�����Լ�������Ч��

;# ����ȫ�ֱ���
global LongPressWT,TandemWT,TabndemSpeed,Timeout,OP,TA,keys,LongPressLoop,OldTimeout,OtherTabndemKey,FF,Timeout2

;--------------------------------------------------------------------------------------------------------------- 



global TA:=0
;# ͨ���û�����ĳ����ȴ�ʱ�������ѭ������
;~ global LongPressLoop :=Ceil(500/50)
;��Ϊ10,���������
global LongPressLoop :=Ceil(500/10)

;--------------------------------------------------------------------------------------------------------------- 


;# ���Զ������

;## ȫ������

;### ��ѡ��ģʽ   ģʽ1-���μ����ܱ�ȫ����    ģʽ2-�ɵ������μ�����    ģʽ3-��ȫ���μ�����
global MySendMode:="3"

;### ѡ��Ҫ������μ��İ���
global keys:="`;"

;### һ�����������ϼ�
global OtherTabndemKey:="" 

;### ����"��ת��"
global FF:="F20"

;### ��������ʱ������
Timeout=5 ;��λ��s

;## Ϊģʽ1���ò���

LongPressWT=500 ;### �ж�Ϊ������ʱ��
TandemWT=180 ;### ���뷢��ģʽ��,��һ�������������ļ��
TabndemSpeed=35 ;### ��������ģʽ��,����֮��ļ��

;## Ϊģʽ2&3���ò���

;### ������ϼ��ȴ�ʱ��(���˵ȴ�ʱ�䲻����Ӧ������ϼ�)
OldTimeout=5 ;��λ��s

;## Ϊģʽ2+���ò���

;### �����ȴ�ʱ��(���˵ȴ�ʱ��,����Ҳ���ᷢ�Ͱ�������,Ҳ������Ӧ����,-1��������)
Timeout2=-1 ;��λ��s

;--------------------------------------------------------------------------------------------------------------- 



;ͨ��HotKey�ķ�ʽ�����ȼ�(����ֱ��ʹ�ñ����޸�)

if(MySendMode==1)
{
Hotkey,%Keys%,MyKey,I2
}
else if(MySendMode==2)
{
Hotkey,%Keys%,OldMyKey,I2

;# ������ mode2 ��ע�� ����ӳ�� �ĵط�
Hotkey,%FF%,EnableClick,I0
}
else if(MySendMode=="2+")
{
Hotkey,%Keys%,MyKey2_Plus,I2
}
else if(MySendMode==3)
{
Hotkey,%Keys%,OldMyKey,I2
}
else 
{
MsgBox,16,ģʽѡ����ִ���,����� MySendMode ֵ�� "%MySendMode%"
}


;--------------------------------------------------------------------------------------------------------------- 

;# ƴ��Timeout2
if (Timeout2>0)
Timeout2:="T" . Timeout2
else 
Timeout2:=-1

;--------------------------------------------------------------------------------------------------------------- 




;# �ȼ�������(���ʹ�ô˽ű�֮��,ϵͳ������Ӧ�õ�����ȼ����������޷�ʹ��,���԰��ȼ���ӵ���������С��°汾�Ѿ������޸����������,���ǻ������Է��󻼰ɡ�)

#inputlevel,3
;## ������㼶�ǲ�����ϵͳĬ�ϼ���,��������ϵͳĬ�ϼ��İ�����
;~����˼�ǲ�����ϵͳ����Ŀ�ݼ�
;### Ϊ������ϵͳ�Ĵ����л�������������,��Level3���ٶȷ�����Щ����,�����ܵ�����
;λ��0
;# ע�� ÿ��ϵͳ�ȼ�����,�����return
/*

~!Tab::
return
~#Tab::
*/
return


#inputlevel



;<<<<<<<<<<<<������ӷ���1:ʾ��������(�Ƽ�)>>>>>>>>>>>> Start
#If GetKeyState(keys,"p") ;## �ﾳԼ��:��˼�ǵ�keys��ʵ�ʰ���ʱ,һ�����ݾ���Ч

*q::
Sleep 25
send ^s
Sleep 25
  Reload
return

;�л�����
*a::#1
*c::#2
*n::#3
*s::#4
*e::#5
*z::#6
*w::#7
*v::#8
*d::
    If WinActive("ahk_exe gvim.exe")  ;���� gvim ;gvim �л���ǩ
        {
        send #c
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
		{
        send #c
        return
        }
    else
		{
        Winclose,A ;�رմ���
        return
        }
return

;�л����뷨
*tab:: PostMessage, 0x50, , 0x8040804,, A ;�л����������뷨
*esc:: PostMessage, 0x50, , 0x4090409,, A ;�л���Ӣ�����뷨
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
*h::
    If WinActive("ahk_exe gvim.exe") ;���� gvim ;gvim �л���ǩ
        {
        send gT
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
		{
        send !{left}
        return
        }
    else
		{
        send ^+{tab}
        return
        }
return
;��Ĳ�������
*j::
    If WinActive("ahk_exe chrome.exe")  ;chrome��λ�� ��ҳ ��, ֻ��ȫ����   �л� ����ҳ �� ���������� ʹ�� vimium
        {
        send {wheeldown} ;chrome ���� ��
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send {F3}  ; phpstorm �鿴 ��һ�� ���� �� �ؼ���
        return
        }
    else
        {
        send ^j
        return
        }
return
*k::
    If WinActive("ahk_exe chrome.exe")  ;chrome��λ�� ��ҳ ��, ֻ��ȫ����   �л� ����ҳ �� ���������� ʹ�� vimium
        {
        send {wheelup} ;chrome ���� ��
        return

        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send +{F3}  ; phpstorm �鿴 ��һ�� ���� �� �ؼ���
        return
        }
    else
        {
        send ^j
        return
        }
return

*x::^F4

*r::
    If WinActive("ahk_exe chrome.exe") ;���� chrome ;chrome ���� ��ҳ
        {
        ;if��������д���Ŀ��Բ������ţ�����Ҫ��
        ;���ǵ��е�ifҪ������
        send {appskey}
        send t
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe") ;phpstorm �Զ���ɴ������ �ֺ�
        {
			send  ^+{enter}
			send  {esc}
			return
		}
    else
        {
        send ^r
        return
		}

return
*t::
    If WinActive("ahk_exe chrome.exe")  ;chrome��λ�� ��ҳ ��, ֻ��ȫ����   �л� ����ҳ �� ���������� ʹ�� vimium
        {
        ;ControlFocus �������뽹�㵽���ڵ�ָ���ؼ���.
        ;controlClick ������갴ť���������¼����ؼ�.
        ControlClick , Chrome_RenderWidgetHostHWND1, , Chrome Legacy Window
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send +^!t
        return
        }
    else
        {
        send ^r
        return
        }
return

*g::
    If WinActive("ahk_exe chrome.exe")  ;chrome��λ�� ��ҳ ��, ֻ��ȫ����   �л� ����ҳ �� ���������� ʹ�� vimium
        {
        send {Lbutton} ;chrome ���� ��
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send !{ins} ; �������ɴ��� generage  code
        return
        }
    else
        {
        send ^g
        return
        }
return

#If ;## �ﾳԼ������


;--------------------------------------------------------------------------------------------------------------- 





#inputlevel 0

;# ��������������ȼ�
OtherTabndem:
;�޸�1
;~ Send,{%keys%}
MySend(keys)
return


EnableClick:
;## ���ŵ���(���������Լ����ǿ�����)
MySend(keys)
return
#inputlevel

#inputlevel,2

;# ���Ǿɰ淢�ͷ�ʽ
OldMyKey(){

global LongPressWT,TandemWT,TabndemSpeed,Timeout,OP,TA,keys,LongPressLoop,OtherTabndemKey,FF
send,{%FF% Down}

	KeyWait, %keys%,T%OldTimeout%
	{
	send,{%FF% Up}
	}
return
}
#inputlevel 

;���ô����� Reset Trigger
RT(){
global TA
TA:=0
return
}


;���ô����� Set Trigger
ST(){
global TA
TA:=1
return
}


#inputlevel,2

;λ��1
;# �����°淢�ͷ�ʽ
MyKey()
{
	;����һ�£��ú�����ʹ�õ�ȫ�ֱ���
global LongPressWT,TandemWT,TabndemSpeed,Timeout,OP,TA,keys,LongPressLoop,OtherTabndemKey,FF

;# �Ȱ���%FF%(���ں���Ĳ���)
send,{%FF% Down}

;# ѭ��ʮ�� �������ѭ��֮��˵���û����ڵ�������,��ͼ����������Tab
loop,%LongPressLoop%
{
	;���ܼ�����û�м�⵽keys���ɿ���ʱ���ܼ�����
		if (TA==1)
	{

	KeyWait, %keys%,T%Timeout%
	{
	;~ MsgBox,Tab���ͷ�,����%FF%���ͷ�

	send,{%FF% Up}
	RT()
	return
	}

	;���ô�����	
	send,{%FF% Up}
	RT()
	return
		}
		;���������Tab�ȵ����ͷ�,�����ǹ���10��,����ͽ�����
		;���ô�����

	;������ֹ���û�б�����,�Ǿͼ���Ƿ�Tab�Ѿ����ɿ�,����ǵĻ�,�ټ��һ�´�����,���û�д���,��ô˵����ֻ���뷢��һ��������Tab,���������,�Ǿ��ͷ�%FF%,��������
	;������ֹ���û�б�����,�ȼ��һ��Tab�Ƿ��ɿ�,������ɿ�����ô��ȷ��һ�¹����Ƿ񱻼���,���ȷ�ϼ�����,��ô�ɿ�����,���û�б������һ��Tab�ɿ�
	
;��;ͻȻ����keys���ɿ���
if !(GetKeyState(keys,"P")) 	
{

	if (TA==0)
	{
	send,{%FF% Up}
	MySend(keys)
	RT()
		return
		}

	;�뿪��ͬʱȥ�������߳�,��Ȼ�Ѿ��뿪�ˣ���ô��ֱ���ͷ�%FF%,ʲô�Ҹо����ǿ��Ե�
		send,{%FF% Up}
		RT()
		return
}

;�ҷ��ּ�û����,��û�б��ɿ�,��ô�͵ȴ�50����,����ظ�,500�����ȥ֮��,˵���û����볤��

	;~ Sleep 50
	;��Ϊ10 ���������
	Sleep 10

}
;# 500�����Ѿ���ȥ,��û�д������ܣ�Ҳû���ɿ�Tab
;## ��Ȼ���봥������,��ô���ɿ�%FF%

send,{%FF% Up}
;## �ɿ�֮����������һ��Tab
		MySend(keys)
;## �ȴ�200���� ֮�����Ƿ��ɿ�
	Sleep %TandemWT%
		;~ Sleep 200
		;�ȵ�200����֮��,��������,ֱ����鵽�û��ɿ�
		;��������200����,����ѭ��ģʽ
		;ֻҪ��鷢�ְ��¾�һֱ��,�������û���¾�ͣ��
		
loop				
{
	
if !(GetKeyState(keys,"P")) {
		RT()
		return
	break ;�����;�ɿ����Ǿ�����ѭ��,	����Ҳ�ͽ�����
}

;���һֱ���ɿ�����һֱ������ȥ,
else
{
	MySend(keys)
	
	Sleep %TabndemSpeed%
}
}

	RT()
	}
		return

;# sendģʽ2+ �ĺ���
MyKey2_Plus()
{
	;## ����һ�£��ú�����ʹ�õ�ȫ�ֱ���
global Timeout2

;## ����%FF% (�ȴ�������)
send,{%FF% Down}
;## �ȴ����ɿ�
;### �����-1��ô��һֱ��,������Ǿ͵�"Timeout2"��
if (Timeout2==-1)
	KeyWait,%keys%
else
	KeyWait,%keys%,%Timeout2%
	;~ KeyWait,%keys%,T1
	;### �����ʱ��
	if (ErrorLevel=1){
		MsgBox,��ʱ
	;#### �ͷ�%FF%	
	send,{%FF% Up}
	;#### ���ü�����
	RT()
	return
	}
	else 
	{
	;~ MsgBox 6
	;## �ɿ�����������Ѿ������򲻷���ԭ����,����ͷ���


	;### ����ɿ�֮�����Ѿ�����
		if (TA==1){
	;#### �ͷ�%FF%
	send,{%FF% Up}
	;#### ���ü�����
	RT()

		}
	;### ����ɿ�֮���ܲ�����,��ô�ͷ���ԭ��������
else
{

;#### �ͷ�%FF%
	send,{%FF% Up}
	;#### ���ü�����
	RT()
	MySend(keys)
	
		return
}
	}



}



#inputlevel


; # ���ñ��沢������ǰ�ű������ִ� ;rl
#If WinActive(A_ScriptName)
;###���沢������ǰ�ű�
:?:`;rl:: 
Sleep 25
send ^s
Sleep 25
  Reload
return
#If


;~ ���ĿǰCapsLock״̬
CheckCapsLock(){
	;������1,�ص���0
return GetKeyState("CapsLock","T")
}

;ʵ�����CapsLock���������ʹ�д�������˼���ϵͳ��ݼ���û�з��ֳ���BUG,Ĭ�Ϲر�,Ϊ�˱�����ּ���������,ֻ�������ڵ��ַ���ĸ��
MySend(ukey){	
	
	;# ���������3���л���,��ô��ʹ��Send,����ֱ���л�,�ٶȻ��ܶ�ܶ�
if(FastSwap(ukey)==1)
	return
	;# ���CapsLockû��,��ô��ֱ�ӷ��ͼ���
if(CheckCapsLock()=0){
Send,{%ukey%}
return
}
;~ /*
;������ֲ��ǵ��ַ���ĸ������ô���ڸ�ʹ�ó����ڣ�ֱ�ӷ���ԭ�棬��������
else if !(StrLen(ukey)==1){
	Send,{%ukey%}
	return
	}
	;�����д�ǿ����ģ���ôת��Ϊ��д�ٷ���һ��
	;~ */
else
{	
	StringUpper,ukey,ukey
Send,{%ukey%}
}
return
}


;# ���������"���л�"����,��ô���л�һ��,0������"���л�"����,1���������л���ָ��
;## �ر���ʾ,AHK1.3.0������,֧���� 0/1 ���� OFF/On ����Ϊ���չ˼����Ի��������ַ���
;## ����:��֪��Ϊʲô�����ֱ��send��Щ���л����Ļ����л����ر���(�����ļ���˵������ô��),������Ϊ������ס��,��û�취��ֻ��������ķ�����

FastSwap(ByRef ukey){
thetemp:=CheckOfukey(ukey,1)
if (thetemp="0001_����İ������ǿ��л���")
	return 0
else if (SubStr(thetemp,1,1)="c")
	{
SetCapsLockState,% GetKeyState("CapsLock","T") ? "OFF" : "On"
	return 1
}
else if (SubStr(thetemp,1,1)="n")
{

		SetNumLockState,% GetKeyState("NumLock","T") ? "OFF" : "On"
	return 1
}
else if (SubStr(thetemp,1,1)="s")
	{
	SetScrollLockState,% GetKeyState("ScrollLock","T") ? "OFF" : "On"
	return 1
}
return 0

}


;# CheckOfukey ���� ���"���л�����"��״̬
CheckOfukey(ByRef ukey,returnname:="0"){
	TheShow :=""
	; # ��ȡ�����ַ� ֻ��returnname������0 �Ż᷵�ذ����ĵ�һ����ĸ��Сд��ʽ
	if(returnname!="0"){
	TheShow := SubStr(ukey,1,1)
	StringLower, TheShow, TheShow
}

if(ukey="CapsLock")
return % TheShow GetKeyState("CapsLock","T")
if(ukey="NumLock")
return % TheShow GetKeyState("NumLock","T")
if(ukey="ScrollLock")
return % TheShow GetKeyState("ScrollLock","T")

else 
	;�������0001
	return,% "0001_����İ������ǿ��л���"
}



; # checkString ���� ���ĳ�ַ������Ƿ���ĳ�ؼ���(�����Ƕ��,��|��������) �������return 1,û��return 0
checkString(WaitCheck,TheKey){
	Loop,parse,TheKey,`|
{
	if(InStr(WaitCheck,A_LoopField,false,1,1))
	return 1
}
return 0
}






/*

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;# β�ͣ�ΰ�����; - ����ű�������ȥ��
;# ��Ϊ��ƽ�����Ҳ��������,�����뾡���������������Ե�Ч��,����˵�����ı��༭�����,��Щ��ݼ�ʵ����̫Զ̫��,���������Space��Ϊ���μ��ͺܺ��ˡ�
֪��(Power-Keys)��Space(SpaceZ)���˴����ĳ���,��Ȼ���ǵķ����Ѿ��ܹ�������Ч��,���ǱȽ����е�Ⱥ��(�����Һ�Ever)�ᷢ�֣����Ƕ������������ٶ��и���(��ΪĿǰ�������뷨��������Ҫ���¿ո񣬶������������뷨û���Զ���ѡ��)��
�ұ������һ���޸��ŵķ���,������������ͻȻ�������ˣ��޸��ŵķ����ǲ����ڵ�(��Ϊĳ�����г����͵���,�������ٶȼ�����һ��Ҫ��������,����ǰ��ٹ�����),ֻ�Ǹ��ŵĴ�С����,����˵���϶�λ�ķ���Ӧ�þ������ŷ�����,Space���μ�̽�����Խ����ˡ�
����������ʶ,�Ҿ������һ������"���κΰ�����������μ�����Ӱ���κα�����"�Ľ������,��ߵĸ��������������Զ���,������ٲ�����ԭ��Ļ����������κ�����Ҫ���޸�(���ڿ����޸��������֮����ܻ�������һЩ),������һ�����ʱ�䣬�����깤��,�κνű��ĵ�һ���汾,һ������һЩ�����,����ʹ�ù�������������˻�ӭ���ҷ�����������һ����������
���,ϣ���ҵ�����ű��ܹ�������������Ч�ʵĵ��Բ������顣^_^ 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*/




