-- globals
state=3
-- 0: splash
-- 1: menu
-- 2: intro
-- 3: game

-- splash screen
splash_timer=0

-- menu
menu_state=0
endings={false,false,false,false}

--game
player_x,player_y=100,220
player_z=2
-- -2: temple
-- -1: labyrinth
--  0: cellar
--  1: ground level
--  2: second floor
--  3: third floor
guest_room_visited=true
toilet_visited=true
bedroom_visited=true
office_visited=true
office_part_2_discovered=true
secret_room_discovered=false

function _init()
end