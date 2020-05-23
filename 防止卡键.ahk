;按键长按检测和预警
#Persistent
LongPress:=new LongPress_Base()
SetTimer(0.015,LongPress_Base.CountAndShow.Bind(LongPress))

::`;ax::
	Send,{Ctrl Down}
return
GetKeyStateOnlyLogic(theKey){
	return GetKeyState(theKey) AND Not(GetKeyState(theKey,isPress := "P"))
}
class LongPress_Base{
	;------------------------------
	Counter := Object("Ctrl","0","Alt","0","Win","0","Shift","0")
	Threshold:=1
	;------------------------------
	__New(){
		return this
	}
;------------------------------
CountAndShow(){
	this.Count(),this.show()
	return
}
;------------------------------
	makeString(){
		theCounter:=this.Counter
		this.theString:=""
		for i,v in theCounter {
			if(v>this.Threshold){
				this.theString.=i . " "
			}
		}
		if(this.theString!="")
			this.theString.=" pressed"
		return
	}
;------------------------------
	show(){
		this.makeString()
					
		if(this.theString!=""){
			ToolTip,% this.theString
			KeyWait RCtrl
			KeyWait LCtrl
			KeyWait LShift
			KeyWait RShift
			KeyWait RAlt
			KeyWait LAlt
			KeyWait RWin
			KeyWait LWin
			#InstallKeybdHook
			#InstallMouseHook
			SendInput {LAlt Up}{RAlt Up}{LCtrl Up}{LShift Up}{RShift Up}{LWin Up}{RWin Up}
			;SendInput {RCtrl Up}{RShift Up}
		}		
		else if(this.theString=""){
			ToolTip
		}
		return
	}
;------------------------------
	Count(){
		if(GetKeyStateOnlyLogic("Ctrl")){
			this.Counter.Ctrl++
		}	
		else{
			this.Counter.Ctrl:=0
		}
;------------------------------
		if(GetKeyStateOnlyLogic("LWin")){
			this.Counter.Win++
		}				
		else if(GetKeyStateOnlyLogic("RWin")){
			this.Counter.Win++
		}	
		else{
			this.Counter.Win:=0
		}
;------------------------------
		if(GetKeyStateOnlyLogic("Shift")){
			this.Counter.Shift++
		}		
		else{
			this.Counter.Shift:=0
		}
;------------------------------
		if(GetKeyStateOnlyLogic("Alt")){
			this.Counter.Alt++
		}
		else{
			this.Counter.Alt:=0
		}
;------------------------------
		return
	}
} ;---------class LongPress_Base End

SetTimer(aMin,FuncObj){
		Type.afObj(FuncObj)
		aMSec:=aMin*1000*60
		Priority:=50000
		SetTimer,%FuncObj%,%aMSec%, %Priority%
		return
	}
