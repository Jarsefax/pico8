pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- dark estate

-- haunted house game
-- by roger norberg

-- todo:s

-- splash screen grafix
-- splash screen timer

-- menu grfx
-- start menu option
-- controls menu option
-- progress display in menu

-- intro text
-- intro timer

-- game stufz
-->8
-- init stuff

state=0
-- 0: splash
-- 1: menu
-- 2: intro
-- 3: game

function _init()

end
-->8
-- update stuff

function _update()
 if state==0 then update_splash()
 elseif state==1 then update_menu()
 elseif state==2 then update_intro()
 elseif state==3 then update_game()
end

function update_splash()

end

function update_menu()

end

function update_intro()

end

function update_game()

end
-->8
-- draw stuff

function _draw()
 if state==0 then draw_splash()
 elseif state==1 then draw_menu()
 elseif state==2 then draw_intro()
 elseif state==3 then draw_game()
end

function draw_splash()

end

function draw_menu()

end

function draw_intro()

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
