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
player_x,player_y=120,230
player_z=2
-- -2: temple
-- -1: labyrinth
--  0: cellar
--  1: ground level
--  2: second floor
--  3: third floor
guest_room_visited=false
toilet_visited=false
bedroom_visited=false
office_visited=false
office_part_2_discovered=true
secret_room_discovered=false

function _init()
end