_W=display.contentWidth
_H=display.contentHeight

local composer = require( "composer" )
local scene = composer.newScene()
local physics = require "physics"
physics.start()








local filepath1=system.pathForFile("normal.txt",system.DocumentsDirectory)

normal=io.open(filepath1,"r")
contents=normal:read()

normal:close()

local filepath2=system.pathForFile("hard.txt",system.DocumentsDirectory)

hard=io.open(filepath2,"r")
contents=hard:read()

hard:close()


--local filepath3=system.pathForFile("easy.txt",system.DocumentsDirectory)



local mydata = require( "mydata" )
local vl = -600
local aaa = 0
local hei = 20
-------physics.setDrawMode("hybrid")

physics.setGravity( 0, 45 )
if level == 2 then
    physics.setGravity( 0, 60 )
    vl = -750
    aaa=70
    hei=50
elseif level==3 then
    physics.setGravity( 0, 80 )
        vl = -900
        aaa=140
        hei=100
	end



local gameStarted = false






local bounce=audio.loadSound("bounce.mp3")
local coin=audio.loadSound("coin.mp3")




--local ads=require "ads"
--local bannerAppID = "ca-app-pub-9534694647722812/8532544881"

--Ad unit name = topbanner
--local adProvider = "admob"



--local function adListener( event )
   
  --  local msg = event.response
    -- Quick debug message regarding the response from the library
    --print( "Message from the ads library: ", msg )
 
    --if ( event.isError ) then
     --   print( "Error, no ad received", msg )
   -- else
      --  print( "Ah ha! Got one!" )
    --end
--end
 









function onCollision( event )
	if ( event.phase == "began" ) then
		composer.gotoScene( "restart" )
		
	end
end

function platformScroller(self,event)
	
	if self.x < (-900 + (self.speed*2)) then
		self.x = 900
	else 
		self.x = self.x - self.speed
	end
	

end



function flyUp(event)
	
   if event.phase == "began" then
       
		if gameStarted == false then
			audio.play(bounce)

			 player.bodyType = "dynamic"
			 instructions.alpha = 0
			 tb.alpha = 1
		 addColumnTimer = timer.performWithDelay(1510-aaa, addColumns, -1)
			 moveColumnTimer = timer.performWithDelay(2, moveColumns, -1)
			 gameStarted = true
			 player:applyForce(0, -300, player.x, player.y)

		else 


if player.y>-170 then
			 audio.play(bounce)
	player:setLinearVelocity(0,vl)
	    --player:applyForce(0, -600, player.x, player.y-10)
end
      end
	end
end

function onKeyEvent()
	-- body
	composer.gotoScene("start","fade",300)
end

function moveColumns()
		for a = elements.numChildren,1,-1 do
			if(elements[a].x < display.contentCenterX - 170) then
				if elements[a].scoreAdded == false then

if mydata.score==50 and level==2 then


hard=io.open(filepath2,"r")
if hard then
contentsh=hard:read()
io.close(hard)
end
if contentsh=="-1" then

	hard=io.open(filepath2,"w")
local ggg=0
hard:write(ggg)
io.close(hard)
end

end




					mydata.score = mydata.score + 1
					tb.text = mydata.score
 
					tb.text = mydata.score
					elements[a].scoreAdded = true
						 audio.play(coin)

if mydata.score==50 and level==1 then
                
easy=io.open(filepath1,"r")
if easy then
contentsv=easy:read()
io.close(easy)
if contentsv=="-1" then

	easy=io.open(filepath1,"w")
local ggg=0
easy:write(ggg)
io.close(easy)

end





	end

						 end
				end
			end
			if(elements[a].x > -100) then
				elements[a].x = elements[a].x - 12
			else 
				elements:remove(elements[a])
			end	
		end
end

function addColumns()
		height = math.random(200,_H-350)


	topColumn = display.newImage('topColumn.png',100,714)
	topColumn.anchorX = 0.5
	topColumn.anchorY = 1
	topColumn.x = display.contentWidth + 100
	topColumn.y = height - 130+hei
	topColumn.scoreAdded = false
	physics.addBody(topColumn, "static", {density=1, bounce=0.1, friction=.2})
	elements:insert(topColumn)
	
	bottomColumn = display.newImage('bottomColumn.png',100,714)
	bottomColumn.anchorX = 0.5
	bottomColumn.anchorY = 0
	bottomColumn.x = display.contentWidth + 100
	bottomColumn.y = height + 300
	physics.addBody(bottomColumn, "static", {density=1, bounce=0.1, friction=.2})
	elements:insert(bottomColumn)

end	

function scroll(self,event)

	if self.x<-(_W/2) then
		self.x=self.x+2*_W
	else
		self.x=self.x-self.speed
	end
	-- body
end


























-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view
   
   gameStarted = false
   mydata.score = 0




	bg = display.newRect(0,0,_W,_H+350)

	bg.x = _W/2
	bg.y = _H/2
	bg:setFillColor(0,228,238)
	
	sceneGroup:insert(bg)


b2=display.newImage("b2.png",_W/2,_H-450)
b2.width=_W+5
b2.height=_H/1.8
sceneGroup:insert(b2)
b2.speed=4

b21=display.newImage("b21.png",_W/2+_W,_H-450)
b21.width=_W+5
b21.height=_H/1.8
sceneGroup:insert(b21)
b21.speed=4


b1=display.newImage("b1.png",_W/2,_H-200)
b1.width=_W+5
b1.height=_H/1.6
sceneGroup:insert(b1)
b1.speed=5


b12=display.newImage("b12.png",_W/2+_W,_H-200)
b12.width=_W+5
b12.height=_H/1.6
sceneGroup:insert(b12)
b12.speed=5


    elements = display.newGroup()
	elements.anchorChildren = true
	elements.anchorX = 0
	elements.anchorY = 1
	elements.x = 0
	elements.y = 0
	sceneGroup:insert(elements)


	platform = display.newImage('platform.png',900,53)
	platform.anchorX = 0
	platform.anchorY = 1
	platform.x = 0
	platform.y =display.viewableContentHeight+100
	physics.addBody(platform, "static", {density=.1, bounce=0.1, friction=.2})
	platform.speed = 4
	sceneGroup:insert(platform)

	platform2 = display.newImage('platform.png',900,53)
	platform2.anchorX = 0
	platform2.anchorY = 1
	platform2.x = platform2.width
	platform2.y = display.viewableContentHeight+100
	physics.addBody(platform2, "static", {density=.1, bounce=0.1, friction=.2})
	platform2.speed = 4
	sceneGroup:insert(platform2)

	ground=display.newImage("ground.png")
	ground.anchorX = 0
	ground.x = 0
	ground.y = display.viewableContentHeight+180
	ground.height=175
	sceneGroup:insert(ground)
	
	
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
	player.x = display.contentCenterX - 150
	player.y = display.contentCenterY
	physics.addBody(player, "static", {density=.1, bounce=0.1, friction=1})
	player:applyForce(0, -300, player.x, player.y)
	player:play()
	sceneGroup:insert(player)
	
	tb = display.newText(mydata.score,display.contentCenterX,150,system.default, 58)
	tb:setFillColor(0)
	tb.x=390
	tb.y=150
	tb.alpha = 0
	sceneGroup:insert(tb)
	
	instructions = display.newImageRect("instructions.png",400,328)
	instructions.anchorX = 0.5
	instructions.anchorY = .5
	instructions.x = display.contentCenterX
	instructions.y = display.contentCenterY
	sceneGroup:insert(instructions)
 
end

-- "scene:show()"
















function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
	  
	composer.removeScene("start")
	composer.removeScene("restart")

	Runtime:addEventListener("touch", flyUp)

	platform.enterFrame = platformScroller
	Runtime:addEventListener("enterFrame", platform)

	platform2.enterFrame = platformScroller
	Runtime:addEventListener("enterFrame", platform2)
    
    Runtime:addEventListener("collision", onCollision)

      -- Example: start timers, begin animation, play audio, etc.
    --  ads.init( adProvider, bannerAppID, adListener )
--ads.show( "banner", { x=0, y=-140, appId=bannerAppID } )

b1.enterFrame=scroll
b12.enterFrame=scroll
b2.enterFrame=scroll
b21.enterFrame=scroll
    Runtime:addEventListener("enterFrame", b1) 
    Runtime:addEventListener("enterFrame", b12) 
    Runtime:addEventListener("enterFrame", b2) 
    Runtime:addEventListener("enterFrame", b21)   
   -- memTimer = timer.performWithDelay( 1000, checkMemory, 0 )

   end
end






















function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
	  Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", platform)
	Runtime:removeEventListener("enterFrame", platform2)
	Runtime:removeEventListener("collision", onCollision)
	timer.cancel(addColumnTimer)
	timer.cancel(moveColumnTimer)

	--timer.cancel(memTimer)
--	  ads.hide( "banner", { x=0, y=-170, appId=bannerAppID } )
	  
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end




















-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene













