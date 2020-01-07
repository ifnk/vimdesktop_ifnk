#Hotstring EndChars  ◎ ;设置热键仅为空格,◎是充数的,不能单独用空格
#Warn
;~ #SingleInstance force
;~ SetStoreCapsLockMode, Off
#NoEnv  ; 不检查空变量是否为"环境变量"，可以极大地提高效率

;# 声明全局变量
global LongPressWT,TandemWT,TabndemSpeed,Timeout,OP,TA,keys,LongPressLoop,OldTimeout,OtherTabndemKey,FF,Timeout2

;--------------------------------------------------------------------------------------------------------------- 



global TA:=0
;# 通过用户输入的长按等待时间计算检测循环次数
;~ global LongPressLoop :=Ceil(500/50)
;改为10,提高灵敏度
global LongPressLoop :=Ceil(500/10)

;--------------------------------------------------------------------------------------------------------------- 


;# 可自定义参数

;## 全局设置

;### 请选择模式   模式1-修饰键功能保全方案    模式2-可单击修饰键方案    模式3-完全修饰键方案
global MySendMode:="3"

;### 选择要变成修饰键的按键
global keys:="`;"

;### 一键设置替代组合键
global OtherTabndemKey:="" 

;### 设置"中转键"
global FF:="F20"

;### 设置连发时间上限
Timeout=5 ;单位是s

;## 为模式1设置参数

LongPressWT=500 ;### 判断为长按的时间
TandemWT=180 ;### 进入发送模式后,第一个发送与连发的间隔
TabndemSpeed=35 ;### 进入连发模式后,连发之间的间隔

;## 为模式2&3设置参数

;### 功能组合键等待时间(过了等待时间不会响应功能组合键)
OldTimeout=5 ;单位是s

;## 为模式2+设置参数

;### 按键等待时间(过了等待时间,松手也不会发送按键本身,也不会响应功能,-1代表无限)
Timeout2=-1 ;单位是s

;--------------------------------------------------------------------------------------------------------------- 



;通过HotKey的方式定义热键(便于直接使用变量修改)

if(MySendMode==1)
{
Hotkey,%Keys%,MyKey,I2
}
else if(MySendMode==2)
{
Hotkey,%Keys%,OldMyKey,I2

;# 这里是 mode2 中注册 单击映射 的地方
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
MsgBox,16,模式选择出现错误,错误的 MySendMode 值是 "%MySendMode%"
}


;--------------------------------------------------------------------------------------------------------------- 

;# 拼接Timeout2
if (Timeout2>0)
Timeout2:="T" . Timeout2
else 
Timeout2:=-1

;--------------------------------------------------------------------------------------------------------------- 




;# 热键白名单(如果使用此脚本之后,系统或其它应用的相关热键出现问题无法使用,可以把热键添加到这个名单中。新版本已经基本修复了这个问题,但是还留着以防后患吧。)

#inputlevel,3
;## 在这个层级是不覆盖系统默认键的,可以设置系统默认键的白名单
;~的意思是不覆盖系统本身的快捷键
;### 为了能让系统的窗口切换可以正常运行,以Level3的速度发送这些按键,避免受到干扰
;位置0
;# 注意 每个系统热键下面,必须加return
/*

~!Tab::
return
~#Tab::
*/
return


#inputlevel



;<<<<<<<<<<<<功能添加方法1:示例功能区(推荐)>>>>>>>>>>>> Start
#If GetKeyState(keys,"p") ;## 语境约束:意思是当keys被实际按下时,一下内容就生效

*q::
Sleep 25
send ^s
Sleep 25
  Reload
return

;切换程序
*a::#1
*c::#2
*n::#3
*s::#4
*e::#5
*z::#6
*w::#7
*v::#8
*d::
    If WinActive("ahk_exe gvim.exe")  ;限制 gvim ;gvim 切换标签
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
        Winclose,A ;关闭窗口
        return
        }
return

;切换输入法
*tab:: PostMessage, 0x50, , 0x8040804,, A ;切换到中文输入法
*esc:: PostMessage, 0x50, , 0x4090409,, A ;切换到英文输入法
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
*h::
    If WinActive("ahk_exe gvim.exe") ;限制 gvim ;gvim 切换标签
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
;别的操作……
*j::
    If WinActive("ahk_exe chrome.exe")  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
        {
        send {wheeldown} ;chrome 里面 击
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send {F3}  ; phpstorm 查看 下一个 搜索 的 关键次
        return
        }
    else
        {
        send ^j
        return
        }
return
*k::
    If WinActive("ahk_exe chrome.exe")  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
        {
        send {wheelup} ;chrome 里面 击
        return

        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send +{F3}  ; phpstorm 查看 上一个 搜索 的 关键次
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
    If WinActive("ahk_exe chrome.exe") ;限制 chrome ;chrome 翻译 网页
        {
        ;if下面仅单行代码的可以不加括号，多行要加
        ;不是单行的if要加括号
        send {appskey}
        send t
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe") ;phpstorm 自动完成代码加上 分号
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
    If WinActive("ahk_exe chrome.exe")  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
        {
        ;ControlFocus 设置输入焦点到窗口的指定控件上.
        ;controlClick 发送鼠标按钮或鼠标滚轮事件到控件.
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
    If WinActive("ahk_exe chrome.exe")  ;chrome定位到 网页 栏, 只能全屏用   切换 到网页 栏 ，可以正常 使用 vimium
        {
        send {Lbutton} ;chrome 里面 击
        return
        }
    else if WinActive("ahk_exe phpstorm64.exe")
        {
        send !{ins} ; 快速生成代码 generage  code
        return
        }
    else
        {
        send ^g
        return
        }
return

#If ;## 语境约束结束


;--------------------------------------------------------------------------------------------------------------- 





#inputlevel 0

;# 下面是替代连发热键
OtherTabndem:
;修改1
;~ Send,{%keys%}
MySend(keys)
return


EnableClick:
;## 开放单击(根据需求自己考虑开不开)
MySend(keys)
return
#inputlevel

#inputlevel,2

;# 这是旧版发送方式
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

;重置触发器 Reset Trigger
RT(){
global TA
TA:=0
return
}


;设置触发器 Set Trigger
ST(){
global TA
TA:=1
return
}


#inputlevel,2

;位置1
;# 这是新版发送方式
MyKey()
{
	;声明一下，该函数内使用的全局变量
global LongPressWT,TandemWT,TabndemSpeed,Timeout,OP,TA,keys,LongPressLoop,OtherTabndemKey,FF

;# 先按下%FF%(便于后面的捕获)
send,{%FF% Down}

;# 循环十次 如果出了循环之后说明用户是在单独长按,企图发送连续的Tab
loop,%LongPressLoop%
{
	;功能激活在没有检测到keys被松开的时候功能激活了
		if (TA==1)
	{

	KeyWait, %keys%,T%Timeout%
	{
	;~ MsgBox,Tab被释放,所以%FF%被释放

	send,{%FF% Up}
	RT()
	return
	}

	;重置触发器	
	send,{%FF% Up}
	RT()
	return
		}
		;不管是最后Tab等到了释放,或者是过了10秒,程序就结束了
		;重置触发器

	;如果发现功能没有被激活,那就检查是否Tab已经被松开,如果是的话,再检查一下触发器,如果没有触发,那么说明他只是想发送一个单独的Tab,如果触发了,那就释放%FF%,结束程序
	;如果发现功能没有被激活,先检查一下Tab是否被松开,如果被松开了那么再确认一下功能是否被激活,如果确认激活了,那么松开即可,如果没有被激活发送一个Tab松开
	
;中途突然发现keys被松开了
if !(GetKeyState(keys,"P")) 	
{

	if (TA==0)
	{
	send,{%FF% Up}
	MySend(keys)
	RT()
		return
		}

	;离开的同时去了其他线程,既然已经离开了，那么就直接释放%FF%,什么我感觉还是可以的
		send,{%FF% Up}
		RT()
		return
}

;我发现既没激活,都没有被松开,那么就等待50毫秒,如此重复,500毫秒过去之后,说明用户是想长按

	;~ Sleep 50
	;改为10 提高灵敏度
	Sleep 10

}
;# 500毫秒已经过去,并没有触发功能，也没有松开Tab
;## 既然不想触发功能,那么就松开%FF%

send,{%FF% Up}
;## 松开之后，立即发送一个Tab
		MySend(keys)
;## 等待200毫秒 之后检查是否松开
	Sleep %TandemWT%
		;~ Sleep 200
		;等到200毫秒之后,连续发送,直到检查到用户松开
		;持续按下200毫秒,进入循环模式
		;只要检查发现按下就一直发,如果发现没按下就停下
		
loop				
{
	
if !(GetKeyState(keys,"P")) {
		RT()
		return
	break ;如果中途松开，那就跳出循环,	程序也就结束了
}

;如果一直不松开，就一直发送下去,
else
{
	MySend(keys)
	
	Sleep %TabndemSpeed%
}
}

	RT()
	}
		return

;# send模式2+ 的函数
MyKey2_Plus()
{
	;## 声明一下，该函数内使用的全局变量
global Timeout2

;## 按下%FF% (等待被触发)
send,{%FF% Down}
;## 等待被松开
;### 如果是-1那么就一直等,如果不是就等"Timeout2"秒
if (Timeout2==-1)
	KeyWait,%keys%
else
	KeyWait,%keys%,%Timeout2%
	;~ KeyWait,%keys%,T1
	;### 如果超时了
	if (ErrorLevel=1){
		MsgBox,超时
	;#### 释放%FF%	
	send,{%FF% Up}
	;#### 重置计数器
	RT()
	return
	}
	else 
	{
	;~ MsgBox 6
	;## 松开了如果功能已经触发则不发出原按键,否则就发出


	;### 如果松开之后功能已经触发
		if (TA==1){
	;#### 释放%FF%
	send,{%FF% Up}
	;#### 重置计数器
	RT()

		}
	;### 如果松开之后功能并触发,那么就发出原按键即可
else
{

;#### 释放%FF%
	send,{%FF% Up}
	;#### 重置计数器
	RT()
	MySend(keys)
	
		return
}
	}



}



#inputlevel


; # 设置保存并重启当前脚本的热字串 ;rl
#If WinActive(A_ScriptName)
;###保存并重启当前脚本
:?:`;rl:: 
Sleep 25
send ^s
Sleep 25
  Reload
return
#If


;~ 检测目前CapsLock状态
CheckCapsLock(){
	;开着是1,关掉是0
return GetKeyState("CapsLock","T")
}

;实现如果CapsLock开启，则发送大写，测试了几个系统快捷键，没有发现出现BUG,默认关闭,为了避免出现兼容性问题,只是作用于单字符字母键
MySend(ukey){	
	
	;# 如果发现是3种切换键,那么不使用Send,而是直接切换,速度会快很多很多
if(FastSwap(ukey)==1)
	return
	;# 如果CapsLock没开,那么就直接发送即可
if(CheckCapsLock()=0){
Send,{%ukey%}
return
}
;~ /*
;如果发现并非单字符字母键，那么不在该使用场景内，直接发送原版，结束程序
else if !(StrLen(ukey)==1){
	Send,{%ukey%}
	return
	}
	;如果大写是开启的，那么转换为大写再发送一下
	;~ */
else
{	
	StringUpper,ukey,ukey
Send,{%ukey%}
}
return
}


;# 如果发现是"可切换"按键,那么就切换一下,0代表不是"可切换"按键,1代表发送了切换的指令
;## 特别提示,AHK1.3.0新特性,支持用 0/1 代表 OFF/On 但是为了照顾兼容性还是用了字符串
;## 由来:不知道为什么，如果直接send这些可切换键的话，切换会特别慢(帮助文件上说可以这么搞),让人以为是锁定住了,那没办法，只能用另外的方法。

FastSwap(ByRef ukey){
thetemp:=CheckOfukey(ukey,1)
if (thetemp="0001_输入的按键不是可切换键")
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


;# CheckOfukey 函数 检查"可切换按键"的状态
CheckOfukey(ByRef ukey,returnname:="0"){
	TheShow :=""
	; # 提取按键字符 只有returnname不等于0 才会返回按键的第一个字母的小写形式
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
	;错误代码0001
	return,% "0001_输入的按键不是可切换键"
}



; # checkString 函数 检查某字符串中是否含有某关键词(可以是多个,用|隔开即可) 如果有则return 1,没有return 0
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
;# 尾巴：伟大的征途 - 这个脚本的来龙去脉
;# 作为不平凡而且不满足的人,我们想尽可能提升操作电脑的效率,比如说进行文本编辑这件事,那些快捷键实在是太远太乱,如果可以用Space作为修饰键就很好了。
知阳(Power-Keys)和Space(SpaceZ)做了大量的尝试,显然他们的方案已经能够大幅提高效率,但是比较敏感的群友(比如我和Ever)会发现，还是对中文上屏的速度有干扰(因为目前中文输入法的上屏需要按下空格，而且主流的输入法没有自定义选项)。
我本来想搞一个无干扰的方案,但是昨天晚上突然想明白了，无干扰的方案是不存在的(因为某个键有长按和单击,单击的速度几乎是一定要被拖慢的,在最前面举过例子),只是干扰的大小罢了,可以说以上二位的方案应该就是最优方案了,Space修饰键探索可以结束了。
基于以上认识,我就设计了一个可以"把任何按键都变成修饰键不会影响任何本身功能"的解决方案,里边的各个参数都可以自定义,你可以再不明白原理的基础上做出任何你想要的修改(现在可以修改五个参数之后可能会再增加一些),我用了一上午的时间，终于完工了,任何脚本的第一个版本,一定是有一些问题的,您在使用过程中如果遇到了欢迎向我反馈，我们来一起完善它。
最后,希望我的这个脚本能够给您带来更高效率的电脑操作体验。^_^ 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*/




