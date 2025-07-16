pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- dark estate

-- haunted house game
-- by roger norberg

-- todo:s

-- splash screen
-- dark house
-- lightning shows it
-- title comes up

-- menu grfx
-- ??? menu option

-- intro text
-- intro text animation

-- game stufz
-->8
-- init stuff

state=2
-- 0: splash
-- 1: menu
-- 2: intro
-- 3: game

splash_timer=0

menu_state=0

endings={false,false,false,false}

--function _init()
--end
-->8
-- update stuff

function _update()
 if state==0 then update_splash()
 elseif state==1 then update_menu()
 elseif state==2 then update_intro()
 elseif state==3 then update_game() end
end

function update_splash()
 if splash_timer<15 then splash_timer+=1
 else state=1 end
end

function update_menu()
 if menu_state==0 and btn(⬇️) then menu_state=1
 elseif menu_state==1 and btn(⬆️) then menu_state=0
 elseif menu_state==0 and btn(🅾️) then state=2 end
end

function update_intro()
 if btn() > 0 then state=3 end
end

function update_game()

end
-->8
-- draw stuff

function _draw()
 cls()
 
 if state==0 then draw_splash()
 elseif state==1 then draw_menu()
 elseif state==2 then draw_intro()
 elseif state==3 then draw_game() end
end

function draw_splash()
 print("splash, a-ah")
end

function draw_menu()
 if menu_state==0 then
  print("-> start",10,90,6)
  print("   ???",10,100,5)
 else
  print("   start",10,90,5)
  print("-> ???",10,100,6)
 end
 
 print("endings: ",10,120,7)
 if endings[1] then circfill(60,122,4,8)
 else circ(60,122,4,8) end
 
 if endings[2] then circfill(75,122,4,9)
 else circ(75,122,4,9) end
 
 if endings[3] then circfill(90,122,4,10)
 else circ(90,122,4,10) end
 
 if endings[4] then circfill(105,122,4,11)
 else circ(105,122,4,11) end
end

function draw_intro()
 cls(1)
 color(13)
 
 print("you are a pshycic, waking up",7,10)
 print("behind the wheel of your",7,18)
 print("crashed car.",7,26)
 
 print("you see country side and a",7,42)
 print("large mansion outside.",7,50)
 
 print("and your sister is not in the",7,58)
 print("passenger seat anymore.",7,66)

 print("her door is open...",7,82)
 
 print("press any button",60,119,6)
end

function draw_game()

end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
