local composer = require( "composer" )
local scene = composer.newScene()
local useme=0

local score = require( "score" )
local widget = require "widget"
-- background

local mydata = require( "mydata" )

local valuu=0
_W=display.contentWidth
_H=display.contentHeight
mys=mydata.score
local help=0
--local dorara=audio.loadSound("dorara.mp3")

 --audio.play(dorara)


--local ads=require "ads"
--local bannerAppID = "ca-app-pub-9534694647722812/8532544881"
--local adProvider = "admob"




local filepath1=system.pathForFile("normal.txt",system.DocumentsDirectory)

normal=io.open(filepath1,"r")
contents=normal:read()

normal:close()

local filepath2=system.pathForFile("hard.txt",system.DocumentsDirectory)

hard=io.open(filepath2,"r")
contents=hard:read()

hard:close()



local filepath3=system.pathForFile("easy.txt",system.DocumentsDirectory)

normal=io.open(filepath3,"w")

normal:close()


function restartGame1(event)

		saveScore()
		composer.gotoScene("game")

end





function restartGame(event)

		saveScore()
		composer.gotoScene("start")

end

function showStart()
	if level==1 then
	startTransition2 = transition.to(doraeasy,{time=200, alpha=1})
	startTransition2 = transition.to(easy,{time=200, alpha=1})
	elseif level==2 then
    startTransition2 = transition.to(doramed,{time=200, alpha=1})
    startTransition2 = transition.to(normal,{time=200, alpha=1})
    elseif level == 3 then
    startTransition2 = transition.to(dorahard,{time=200, alpha=1})
    startTransition2 = transition.to(hard,{time=200, alpha=1})
    end
	startTransition3 = transition.to(scoree,{time=200, alpha=1})
	startTransition1 = transition.to(realrestart,{time=200, alpha=1})
	startTransition = transition.to(restart,{time=200, alpha=1})
	scoreTextTransition = transition.to(scoreText,{time=600, alpha=1})
	--scoreTextTransition = transition.to(bestText,{time=600, alpha=1})
end

function showScore()
	scoreTransition = transition.to(scoreBg,{time=600, y=display.contentCenterY,onComplete=showStart})
end

function showGameOver()
	fadeTransition = transition.to(gameOver,{time=600, alpha=1,onComplete=showScore})
end

function loadScore()
    
	local prevScore = score.load()
	if prevScore ~= nil then
		if prevScore <= mydata.score then
			score.set(mydata.score,level)
		else 
			score.set(prevScore,level)
		end
	else 
		score.set(mydata.score,level)
	end
end

function saveScore()

	if level==1 then
	score.save()
	elseif level==2 then    

easssy=io.open(filepath1,"r")
if easssy then
contentsv=easssy:read()
useme=tonumber( contentsv)
io.close(easssy)
end
if useme<mys then

	easssy=io.open(filepath1,"w")
local ggg=mys
easssy:write(ggg)
io.close(easssy)

end
elseif level==3 then



harddd=io.open(filepath2,"r")
if harddd then

contentsh=harddd:read()
useme=tonumber( contentsh)
io.close(harddd)
end
if useme<mys then
	harddd=io.open(filepath2,"w")
local ggg=mys

harddd:write(ggg)
io.close(harddd)
end


end
end

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------


function scc(  )

	leadback.isVisible =true
	close.isVisible=true
	easy1.alpha=1
	realeasyText.alpha=1
	easyText.alpha=1
	hardtext.alpha=1
		normal1.alpha=1
			hard1.alpha=1
	-- body
end


function clss( ... )

	leadback.isVisible =false
	close.isVisible=false
		easy1.alpha=0
		normal1.alpha=0
			hard1.alpha=0

	realeasyText.alpha=0
	easyText.alpha=0
	hardtext.alpha=0
	-- body
end

function rett( )
	-- body
	if level==1 then
valuu =score.get()
elseif level==2 then

value=mys

elseif level==3 then



harddd=io.open(filepath2,"r")
if harddd then
contentsh=harddd:read()
useme=tonumber( contentsh)
io.close(harddd)
end
value= useme
if useme>mys then
value =mys
end


end


return valuu
end










-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   	saveScore()

    background = display.newImageRect("gameover.jpg",900,1425)
	background.anchorX = 0.5
	background.anchorY = 0.5
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)
	
	gameOver = display.newImageRect("gameOver.png",500,100)
	gameOver.anchorX = 0.5
	gameOver.anchorY = 0.5
	gameOver.x = display.contentCenterX 
	gameOver.y = display.contentCenterY - 400
	gameOver.alpha = 0
	sceneGroup:insert(gameOver)
	
	scoreBg = display.newImageRect("menuBg.png",480,393)
	scoreBg.anchorX = 0.5
	scoreBg.anchorY = 0.5
    scoreBg.x = display.contentCenterX
    scoreBg.y = display.contentHeight + 500
    sceneGroup:insert(scoreBg)
	


	restart = widget.newButton
	{
	defaultFile="home.png",
	overFile="homeover.png"
	}

	restart.anchorX = 0.5
	restart.anchorY = 1
	restart.x = display.contentCenterX/2
	restart.y = display.contentCenterY + 400
	restart.alpha = 0
	restart.width=130
	restart.height=130
	sceneGroup:insert(restart)



	realrestart = widget.newButton
	{
	defaultFile="res.png",
	overFile="resover.png"
	}

	realrestart.anchorX = 0.5
	realrestart.anchorY = 1
	realrestart.x = display.contentCenterX*3/2
	realrestart.y = display.contentCenterY + 400
	realrestart.alpha = 0
	realrestart.width=130
	realrestart.height=130
	sceneGroup:insert(realrestart)
	
	scoreText = display.newText(mydata.score,display.contentCenterX + 110,display.contentCenterY +50, native.systemFont, 50)
	scoreText:setFillColor(0,0,0)
	scoreText.alpha = 0 
	sceneGroup:insert(scoreText)
	
	bestText = score.init({
	fontSize = 50,
	font = "Helvetica",
	x = display.contentCenterX + 70,
	y = display.contentCenterY + 100,
	maxDigits = 7,
	leadingZeros = false,
	filename = "scorefile.txt",
	})
	
	bestScore = rett()

	bestText.text = bestScore
	bestText.alpha = 0
	bestText:setFillColor(0,0,0)
	sceneGroup:insert(bestText)


	doraeasy=display.newImage("doraeasy.png")
	doraeasy.x=_W/3
	doraeasy.y=_H/2
		sceneGroup:insert(doraeasy)
doraeasy.alpha=0


	doramed=display.newImage("doramed.png")
	doramed.x=_W/3
	doramed.y=_H/2
		sceneGroup:insert(doramed)
doramed.alpha=0

	dorahard=display.newImage("dorahard.png")
	dorahard.x=_W/3
	dorahard.y=_H/2
		sceneGroup:insert(dorahard)
		dorahard.alpha=0


		easy=display.newImage("easy.png")
easy.x = _W/3
easy.y = _H/2+130
easy.height=120/2
easy.width=200/2
sceneGroup:insert(easy)
easy.alpha=0


normal=display.newImage("normal.png")
normal.x = _W/3
normal.y = _H/2+100
normal.height=120/2
normal.width=280/2
sceneGroup:insert(normal)
normal.alpha=0

hard=display.newImage("hard.png")
hard.x = _W/3+10
hard.y = _H/2+130
hard.height=100/2
hard.width=200/2
sceneGroup:insert(hard)
hard.alpha=0

scoree=display.newImage("scoree.png")
scoree.x = _W/2
scoree.y = _H
sceneGroup:insert(scoree)
scoree.alpha=0

leadback=display.newImage("leadback.png")
leadback.x = _W/2
leadback.y = _H/2
leadback.height=_H
leadback.width=_W*4/5
sceneGroup:insert(leadback)
leadback.isVisible=false


close=display.newImage("close.png")
close.x = _W-130
close.y = _H/5-150
sceneGroup:insert(close)
sceneGroup:insert(close)
close.isVisible=false




easy1=display.newImage("easy.png")
easy1.x = display.contentCenterX - 150
easy1.y = display.contentCenterY-60-200
easy1.height=120
easy1.width=200
sceneGroup:insert(easy1)
easy1.alpha=0



normal1=display.newImage("normal.png")
normal1.x = display.contentCenterX - 100
normal1.y = display.contentCenterY-50
normal1.height=120
normal1.width=280
sceneGroup:insert(normal1)
normal1.alpha=0


hard1=display.newImage("hard.png")
hard1.x = easy.x
hard1.y = _H-300
hard1.height=100
hard1.width=200
sceneGroup:insert(hard1)
hard1.alpha=0


vvv=score.get()

realeasyText = display.newText(vvv,display.contentCenterX + 210,display.contentCenterY/2-30 , native.systemFont, 70)
	realeasyText:setFillColor(0,0,0)
	realeasyText.alpha = 0 
	sceneGroup:insert(realeasyText)
	



      
easyyy=io.open(filepath1,"r")
if easyyy then
vvv=easyyy:read()
io.close(easyyy)
end
help=tonumber( vvv)

easyText = display.newText(vvv,display.contentCenterX + 210,display.contentCenterY/2+210 , native.systemFont, 70)
	easyText:setFillColor(0,0,0)
	easyText.alpha = 0
	sceneGroup:insert(easyText)
	





easyyy1=io.open(filepath2,"r")
if easyyy1 then
vvv=easyyy1:read()
io.close(easyyy1)
end
help=tonumber(vvv)

hardtext = display.newText(vvv,display.contentCenterX + 210,display.contentCenterY/2+470 , native.systemFont, 70)
	hardtext:setFillColor(0,0,0)
	hardtext.alpha = 0
	sceneGroup:insert(hardtext)
	









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
   --   ads.init( adProvider, bannerAppID, adListener )
--ads.show( "banner", { x=0, y=-140, appId=bannerAppID } )
	  composer.removeScene("game")
	  	  composer.removeScene("menu")

	restart:addEventListener("tap", restartGame)
realrestart:addEventListener("tap", restartGame1)
scoree:addEventListener("tap",scc)
close:addEventListener("tap",clss)
	showGameOver()

	loadScore()
	  
   end
end

















-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
	realrestart:removeEventListener("tap", restartGame1)  
	restart:removeEventListener("tap", restartGame)
		transition.cancel(fadeTransition)
		transition.cancel(scoreTransition)
		transition.cancel(scoreTextTransition)
		transition.cancel(startTransition)


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













