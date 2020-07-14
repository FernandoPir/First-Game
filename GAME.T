%Fernando Pires Rui      GAME TRIAL

%Imput: make the user click a button that will "shoot" at the enemy
%Processing: calculate the score and the time and make the user die if he shoots wrongly or delay to shoot
%Output:Show the aim, move the aim in the place to shoot the enemy, show the enemy appearing and other graphic implements

randomize
setscreen ("graphics:maxx,maxy;nobuttonbar,nooffscreenonly,noecho,")
setscreen ("nocursor")
setscreen ("noecho")

%Declaration Section
var letter, start : string
var zombie : int
var randy, randx, xCord, yCord, aim : int
var player, difficulty : string (1)
var font1 : int

var timerC, timerU, timer : int
var timerSec : int := 0
font1 := Font.New ("mono:20:bold")



%Start Screen
for c : 16 .. 31
    cls
    locate (10, 11)
    color (c)
    put "Welcome to my  first game!"
    delay (200)
end for


%Processing part of the start screen
getch (difficulty)

timerC := Time.Sec

loop

    %Background
    Draw.FillBox (0, 0, maxx, maxy, 187)
    Draw.FillBox (0, 0, maxx, maxy, 187)
    Draw.ThickLine (0, 0, maxx, 0, 30, black)
    Draw.ThickLine (0, 210, maxx, 210, 15, black)
    Font.Draw ("A", 55, 375, font1, white)
    Font.Draw ("S", 280, 375, font1, white)
    Font.Draw ("D", 505, 375, font1, white)
    Font.Draw ("J", 55, 175, font1, white)
    Font.Draw ("K", 280, 175, font1, white)
    Font.Draw ("L", 505, 175, font1, white)
    %Upper right side door
    Draw.FillBox (10, 218, 125, 370, brown)

    %Upper Mid door
    Draw.FillBox (225, 218, 350, 370, brown)

    %Upper left side door
    Draw.FillBox (450, 218, 575, 370, brown)

    %Lower right side door
    Draw.FillBox (10, 15, 125, 167, brown)

    %Lower mid side door
    Draw.FillBox (225, 15, 350, 167, brown)

    %Lower left side door
    Draw.FillBox (450, 15, 575, 167, brown)


    %Enemy Spawn
    randint (randy, 1, 2)
    randint (randx, 1, 3)

    if randy = 1 then
	yCord := 215
    elsif randy = 2 then
	yCord := 10
    end if

    if randx = 1 then
	xCord := (125 - 150) div 2 + 10
    elsif randx = 2 then
	xCord := (350 - 360) div 2 + 225
    elsif randx = 3 then
	xCord := (1250 - 450) div 2 + 45
    end if

    zombie := Pic.FileNew ("zombie.jpg")
    zombie := Pic.Scale (zombie, 130, 150)
    Pic.Draw (zombie, xCord, yCord, picMerge)

    %Timer
    
    timerU := Time.Sec
    if difficulty = "5" then
    exit when timerU + 5 < timerU
    timerU := timerU -1 
    elsif difficulty = "2" then
    exit when timerC + 3 < timerU
    elsif difficulty = "3" then
    exit when timerC + 1 < timerU
    end if
   
    %Player Aim
    getch (player)
    if randy = 1 and randx = 1 then
	letter := "A"
	letter := "a"
    elsif randy = 1 and randx = 2 then
	letter := "S"
	letter := "s"
    elsif randy = 1 and randx = 3 then
	letter := "D"
	letter := "d"
    elsif randy = 2 and randx = 1 then
	letter := "J"
	letter := "j"
    elsif randy = 2 and randx = 2 then
	letter := "K"
	letter := "k"
    elsif randy = 2 and randx = 3 then
	letter := "L"
	letter := "l"
    end if
    if player not= letter then
	exit
    end if
end loop

cls
