local composer = require( "composer" )
local scene = composer.newScene()
_W=display.contentWidth
_H=display.contentHeight
level=1
local ishard=0
local isnormal=0
local backe=audio.loadSound('back.mp3')
audio.play(backe,{loops=1000})

pppp=0
local mydata = require( "mydata" )
score1=require "score1"
			--fornor.set("1")

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
local widget = require "widget"

local physics = require "physics"
physics.start()








local filepath1=system.pathForFile("normal.txt",system.DocumentsDirectory)

normal=io.open(filepath1,"r")
if normal then
contents=normal:read()
io.close(normal)
else
normal=io.open(filepath1,"w")
normal:write(-1)
end


local filepath2=system.pathForFile("hard.txt",system.DocumentsDirectory)

hard=io.open(filepath2,"r")
if hard then
contents=hard:read()

io.close(hard)
else
hard=io.open(filepath1,"w")
hard:write(-1)
io.close(hard)
end



local filepath3=system.pathForFile("easy.txt",system.DocumentsDirectory)
easyy1=io.open(filepath3,"r")
if easyy1 then
contents=easyy1:read()

io.close(easyy1)
else
easyy1=io.open(filepath2,"w")
easyy1:write(-1)
io.close(easyy1)
end

--normal2=io.open(filepath3,"w")
--io.close(normal2)
-------------------------------------------------------------------------------------
local yyy = 10

score1.set(yyy)




	local prevScore = score1.get()







ads=require "ads"
bannerAppID = "ca-app-pub-9534694647722812/8532544881"

--Ad unit name = topbanner
adProvider = "admob"



function adListener( event )
   
    local msg = event.response
    -- Quick debug message regarding the response from the library
    print( "Message from the ads library: ", msg )
 
    if ( event.isError ) then
        print( "Error, no ad received", msg )
    else
        print( "Ah ha! Got one!" )
    end
end
 

function startGame1(  )
	level=1
composer.gotoScene("game")
end

function gogo(  )
	-- body
	finor.alpha=0
	fihard.alpha=0
end

function startGame2(  )
	if isnormal==0 then
	level=2
composer.gotoScene("game")
else
	finor.alpha=1
		fihard.alpha=0
	timer.performWithDelay("1300",gogo)
end
end





function startGame3(  )
	if ishard==0 then
	level=3
composer.gotoScene("game")
else
	fihard.alpha=1
		finor.alpha=0
		timer.performWithDelay("1300",gogo)
end
end









function startGame(event)

--transition.to(titleGroup,{time=450, y=titleGroup.y+20,onComplete=titleTransitionUp})

transition.to(easy,{time=450, alpha=1})

transition.to(hard,{time=450, alpha=1})

transition.to(normal,{time=450, alpha=1})
titleGroup.isVisible=false


transition.to(start1,{time=900, alpha=1})
transition.to(start2,{time=900, alpha=1})
transition.to(start3,{time=900, alpha=1})
if isnormal==-1 then
transition.to(lock1,{time=450, alpha=1})
end
if ishard==-1 then
transition.to(lock2,{time=450, alpha=1})
end
start.isVisible=false
--		composer.gotoScene("game")
    
end

function groundScroller(self,event)
	
	if self.x < (-900 + (self.speed*2)) then
		self.x = 900
	else 
		self.x = self.x - self.speed
	end
	
end

function titleTransitionDown()
transition.to(titleGroup,{time=450, y=titleGroup.y+20,onComplete=titleTransitionUp})
	
end

function titleTransitionUp()
transition.to(titleGroup,{time=450, y=titleGroup.y-20, onComplete=titleTransitionDown})
	
end

function titleAnimation()
	titleTransitionDown()
end

---------------------------------------------------------------------------------





function closegame( ... )
	-- body
	os.exit() 
end




function checkitdude( )


              
easy=io.open(filepath1,"r+")
if easy then
contentsn=easy:read()
io.close(easy)
end

if contentsn=="-1" then
isnormal=-1
end
              
easy=io.open(filepath2,"r+")
if easy then
contentsh=easy:read()
io.close(easy)
end
if contentsh=="-1" then

ishard=-1
end
	-- body
end




function scene:create( event )


   local sceneGroup = self.view
--sceneGroup:insert(exitback)

checkitdude()



background = display.newRect(0,0,_W,_H+350)
	--background.anchorX = 1
	--background.anchorY = 1
	background.x = _W/2
	background.y = _H/2
	background:setFillColor(0,228,238)
	sceneGroup:insert(background)

b2=display.newImage("b2.png",_W/2,_H-450)
b2.width=_W
b2.height=_H/1.8
sceneGroup:insert(b2)
          b1=display.newImage("b1.png",_W/2,_H-200)
b1.width=_W
b1.height=_H/1.6
sceneGroup:insert(b1)



easy=display.newImage("easy.png")
easy.x = display.contentCenterX - 200
easy.y = display.contentCenterY-120-200
easy.height=120
easy.width=200
sceneGroup:insert(easy)
easy.alpha=0


normal=display.newImage("normal.png")
normal.x = display.contentCenterX - 200
normal.y = display.contentCenterY-50
normal.height=120
normal.width=280
sceneGroup:insert(normal)
normal.alpha=0


hard=display.newImage("hard.png")
hard.x = easy.x
hard.y = _H-300
hard.height=100
hard.width=200
sceneGroup:insert(hard)
hard.alpha=0

  	title = display.newImageRect("title.png",500,100)

	title.x = display.contentCenterX - 80
	title.y = display.contentCenterY 
	sceneGroup:insert(title)
	
	ground=display.newImage("ground.png")
	ground.anchorX = 0
	ground.x = 0
	ground.y = display.viewableContentHeight+180
	ground.height=175
	sceneGroup:insert(ground)

	platform = display.newImage("platform.png",900,53)
	platform.anchorX = 0
	platform.anchorY = 1
	platform.x = 0
	platform.y = display.viewableContentHeight+100
	physics.addBody(platform, "static", {density=.1, bounce=0.1, friction=.2})
	platform.speed = 4
	sceneGroup:insert(platform)

	platform2 = display.newImage("platform.png",900,53)
	platform2.anchorX = 0
	platform2.anchorY = 1
	platform2.x = platform2.width
	platform2.y = display.viewableContentHeight + 100
	physics.addBody(platform2, "static", {density=.1, bounce=0.1, friction=.2})
	platform2.speed = 4
	sceneGroup:insert(platform2)
	



	start = widget.newButton
	{
	defaultFile="start_btn.png",
	overFile="start_btnover.png"
	}
	start.anchorX = 1
	start.anchorY = 1
	start.x = display.contentCenterX+50
	start.y = display.contentHeight - 400
		start.width=130
	start.height=130
	sceneGroup:insert(start)
	




	start1 = widget.newButton
	{
	defaultFile="start_btn.png",
	overFile="start_btnover.png"
	}
	start1.anchorX = 1
	start1.anchorY = 1
	start1.x = display.contentCenterX+300
	start1.y = display.contentCenterY-55-200
		start1.width=130


	start1.height=130
	sceneGroup:insert(start1)
start1.alpha=0





start2 = widget.newButton
	{
	defaultFile="start_btn.png",
	overFile="start_btnover.png"
	}
	start2.anchorX = 1
	start2.anchorY = 1
	start2.x = display.contentCenterX+240+55

	start2.y = display.contentHeight - 500
		start2.width=130

	start2.height=130
	sceneGroup:insert(start2)
start2.alpha=0

		start3 = widget.newButton
	{
	defaultFile="start_btn.png",
	overFile="start_btnover.png"
	}
	start3.anchorX = 1
	start3.anchorY = 1
	start3.x = display.contentCenterX+240+55
	start3.y = display.contentHeight - 500+300
		start3.width=130

	start3.height=130
	sceneGroup:insert(start3)
start3.alpha=0

	p_options = 
	{
		-- Required params
		width = 70,
		height = 70,
		numFrames = 2,
		-- content scaling
		sheetContentWidth = 140,
		sheetContentHeight = 70,
	}

	playerSheet = graphics.newImageSheet( "dora.png", p_options )

	player = display.newSprite( playerSheet, { name="player", start=1, count=2, time=500 } )
	player.anchorX = 0.5
	player.anchorY = 0.5
	player.x = display.contentCenterX + 290
	player.y = display.contentCenterY 
	player:play()
	sceneGroup:insert(player)

	titleGroup = display.newGroup()

	titleGroup.anchorX = 0.5
	titleGroup.anchorY = 0.5
	titleGroup.x = display.contentCenterX/100
	titleGroup.y = -350
	titleGroup:insert(title)
	titleGroup:insert(player)


	
   lock1=display.newImage("lock.png")
    lock1.x=_W/3+100
    lock1.y=_H/2
lock1.width=80
lock1.height=100
lock1.alpha=0
   sceneGroup:insert(lock1)
   lock2=display.newImage("lock.png")
    lock2.x=_W/3+100
lock2.y=_H*3/4   
lock2.width=80
lock2.height=100
lock2.alpha=0
sceneGroup:insert(lock2)
	sceneGroup:insert(titleGroup)
    titleAnimation()


finor=display.newImage("50+.png")
 finor.x=_W/3+150
finor.y=_H+100
finor.width=_W
finor.height=100
finor.alpha=0


fihard=display.newImage("50+hard.png")
 fihard.x=_W/3+150
fihard.y=_H+100 
fihard.width=_W
fihard.height=100
fihard.alpha=0

--exit=display.newImage("home.png",_W*1/9,30)

--	sceneGroup:insert(exit)
end















function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then

ads.init( adProvider, bannerAppID, adListener )

ads.show( "banner", { x=0, y=10000, appId=bannerAppID } )


		composer.removeScene("restart")
		start:addEventListener("tap", startGame)
		start1:addEventListener("tap", startGame1)
	    start2:addEventListener("tap", startGame2)
	    	    start3:addEventListener("tap", startGame3)
		platform.enterFrame = groundScroller
		platform2.enterFrame = groundScroller
		Runtime:addEventListener("enterFrame", platform)
		Runtime:addEventListener("enterFrame", platform2)
       -- exit:addEventListener("tap",closegame)
   end
end












-- "scene:hide()"





function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
	    start:removeEventListener("tap", startGame)
	    start1:removeEventListener("tap", startGame1)
	    start2:removeEventListener("tap", startGame2)
	    start3:removeEventListener("tap", startGame3)


		Runtime:removeEventListener("enterFrame", platform)
		Runtime:removeEventListener("enterFrame", platform2)
		transition.cancel(downTransition)
		transition.cancel(upTransition)
		audio.pause(backe)
       -- exit:removeEventListener("tap",closegame)
--			  ads.hide( "banner", { x=0, y=-140, appId=bannerAppID } )
   elseif ( phase == "did" ) then

   end
end






function scene:destroy( event )

   local sceneGroup = self.view

end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene










