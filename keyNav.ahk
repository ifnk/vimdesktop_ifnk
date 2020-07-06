;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/2k/7
; Author:         Jos¨¦ A. Romero L.<escherdragon@gmail.com>
;
; Script Function:
;       Keynav for Windows
;

#SingleInstance force

#IfWinExist, _keynav
h::
    scWidth /= 2
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
+h::
    posX -= %scWidth%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
l::
    scWidth /= 2
    posX += %scWidth%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
+l::
    posX += %scWidth%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
j::
    scHeight /= 2
    posY += %scHeight%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
+j::
    posY += %scHeight%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
k::
    scHeight /= 2
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
+k::
    posY -= %scHeight%
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
t::
    scWidth := A_ScreenWidth
    scHeight := A_ScreenHeight / 32
    posX := 0
    posY := 0
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
v::
    scWidth := A_ScreenWidth
    scHeight := A_ScreenHeight / 16
    posX := 0
    posY := scHeight * 15
    Draw( _keynav, posX, posY, scWidth, scHeight )
    return
g::
    Warp( posX, posY, scWidth, scHeight )
    return
m::
    Gui, destroy
    Sleep, 50
    MouseMove, 5, 5, 0
    return
`;::
    Gui, destroy
    return
Esc::
    Gui, destroy
    return
Space::
    Warp( posX, posY, scWidth, scHeight )
    MouseClick, Left
    return
+Space::
    Warp( posX, posY, scWidth, scHeight )
    MouseClick, Left, ,, 2
    return
1::
    MouseClick, Left
    return
+1::
    MouseClick, Left, ,, 2
    return
2::
    MouseClick, Middle
    Gui, destroy
    return
+2::
    MouseClick, Middle, ,, 2
    Gui, destroy
    return
3::
    MouseClick, Right
    Gui, destroy
    return
+3::
    MouseClick, Right, ,, 2
    Gui, destroy
    return
+a::
    Click Down
    return
a::
    Click Up
    return


#IfWinExist
;; activate by Ctrl + ;
#;::

#IfWinExist, _keynav
Gui, destroy

#IfWinExist
scWidth = %A_ScreenWidth%
scHeight = %A_ScreenHeight%
posX = 0
posY = 0

Gui +AlwaysOnTop -Caption +ToolWindow
Gui, Color, EEEEEE, _keynav
Gui, Show,  X%A_ScreenWidth% Y%A_ScreenHeight% W%A_ScreenWidth% H%A_ScreenHeight% NoActivate, _keynav

WinSet, Transparent, 0, _keynav
WinSet, ExStyle, ^0x20, _keynav
WinSet, TransColor, EEEEEE, _keynav

Gui, Show, X0 Y0
CrossHair( scWidth, scHeight )
return

GuiClose:
ExitApp

Draw( _keynav, posX, posY, scWidth, scHeight )
{
    CoordMode, Mouse, Screen
    WinMove, _keynav, , %posX%, %posY%, %scWidth%, %scHeight%
    CrossHair( scWidth, scHeight )
}

Warp( posX, posY, scWidth, scHeight )
{
    CoordMode, Mouse, Screen
    toX := posX + scWidth/2
    toY := posY + scHeight/2
    MouseMove, toX, toY, 0
}

CrossHair( scWidth, scHeight )
{
    Gui +AlwaysOnTop -Caption +ToolWindow
    Gui, Add, Text, % "x0 y" . scHeight/2 . " w"       . scWidth  . " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x"    . scWidth/2  . " y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y0 w"    . scWidth  .  " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x0 y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y" . scHeight-1 . " w"       . scWidth  . " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x"    . scWidth-1  . " y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"
}