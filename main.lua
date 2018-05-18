display.setStatusBar( display.HiddenStatusBar )
local composer = require "composer"
_W=display.contentWidth
_H=display.contentHeight
 bloop=audio.loadSound("paper.mp3")


function loadAlImages( ... )
  -- body
    --create all your images here.
  bg:removeSelf()
  logo:removeSelf()
  texti:removeSelf()
presents:removeSelf()
composer.gotoScene( "start" )

    --remove LOADING text

end



audio.play(bloop)







  


	bg = display.newImage("bla.png")
	bg.x = _W/2
	bg.y = _H/2
	bg.width=_W
	bg.height=_H+400

logo = display.newImage("logo.png")
logo.alpha=0

logo.x=_W/2
logo.y=_H/2-200

	logo.width=300
	logo.height=300



texti = display.newImage("name.png")
texti.x=_W/2
texti.y=_H/2



presents = display.newImage("presents.png")
presents.x=_W/2-_W
presents.y=_H/2+200


scoreTransition1 = transition.to(presents,{time=400, x=_W/2})





--if you still see black screen at the start try to increase delay > 500 ms  
timer.performWithDelay( 1500, loadAlImages, 1 )

