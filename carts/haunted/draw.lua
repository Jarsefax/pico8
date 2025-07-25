-- draw stuff

-- map positions
sdx,sdy,sux,suy=0,10,3,10
--stairs_down_x,stairs_down_y
--stairs_up_x,stairs_up_y
rty,rly=0,5
--rooms_top_y,rooms_lower_y
hrlx,hrrx=8,12
--house_room_left_x
--house_room_right_x

-- stairs cell positions
temple_labyrinth={x=20,y=5}
garden_down={x=3,y=32}
lobby_cellar={x=6,y=26}
lobby_hall={x=7,y=25}
hall_alcove={x=7,y=33}

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
 x,y=player_x-60,player_y-60
 camera(x,y)
 
 if player_z==-2 then
  draw_temple_level()
 elseif player_z==-1 then
  draw_labyrinth_level()
 elseif player_z==0 then
  draw_cellar_level()
 elseif player_z==1 then
  draw_ground_level()
 elseif player_z==2 then
  draw_second_floor()
 else draw_third_floor() end
 
 spr(1,player_x,player_y)
 
 -- start dev map design code
 print("floor: "..player_z,5-player_x,5-player_y,10)
 -- end dev map design code
end

function draw_temple_level()
 -- stairs up to labyrinth 
 x,y=temple_labyrinth.x*8,temple_labyrinth.y*8
 map(sux,suy,x,y,2,1)
end

function draw_labyrinth_level()
 -- stairs up
 x,y=garden_down.x*8,garden_down.y*8
 map(sux,suy,x,y,2,1)
 
 -- stairs down to temple
 x,y=temple_labyrinth.x*8,temple_labyrinth.y*8
 map(sdx,sdy,x,y,2,1)
end

function draw_cellar_level()
 -- stairs up to lobby
 x,y=lobby_cellar.x*8,lobby_cellar.y*8
 map(sux,suy,x,y,2,1)

 -- stairs between garden and labyrinth
 x,y=garden_down.x*8,garden_down.y*8
 map(sdx,sdy,x,y,2,1)
end

function draw_ground_level()
 -- stairs down to labyrinth
 x,y=garden_down.x*8,garden_down.y*8
 map(sux,suy,x,y,2,1)

 -- stairs down to cellar
 x,y=lobby_cellar.x*8,lobby_cellar.y*8
 map(sdx,sdy,x,y,2,1)

 -- stairs up to hall
 x,y=lobby_hall.x*8,lobby_hall.y*8
 map(sux,suy,x,y,2,1)
end

function draw_second_floor()
 draw_hall()
 if bedroom_visited then
  draw_bedroom()
 end
 if toilet_visited then
  draw_toilet()
 end
 if guest_room_visited then
  draw_guest_room()
 end
end

function draw_hall()
 -- stairs down to lobby
 x,y=lobby_hall.x*8,lobby_hall.y*8
 map(sdx,sdy,x,y,2,1)

 -- stairs up to alcove
 x,y=hall_alcove.x*8,hall_alcove.y*8
 map(sux,suy,x,y,2,1)

 -- lower left corner
 map(hrlx,rly,x-16,y,3,4) 
 -- lower right corner
 map(hrrx,rly,x+8,y,3,4) 
 -- guest room door
 spr(36,x+(3*8),y-8) 
 -- wall over guest room door
 map(hrlx,rty,x+(3*8),y-(4*8),1,3)
 -- lower toilet wall
 if toilet_visited==false then
  map(hrlx,rty,x+(3*8),y-(7*8),1,3)
 end  
 -- toilet door
 spr(36,x+(3*8),y-(8*8))
 -- upper toilet wall
 map(hrlx,rty,x+(3*8),y-(10*8),1,2)
 -- upper wall side
 spr(33,x+(3*8),y-(11*8)) 
 -- upper right corner
 --map(hrlx,ruy,x,y,2,1) 
 -- bedroom door
 --spr(35,x,y+8)
 if (bedroom_visited) then
  --spr(34,x,y)
 end 
 -- upper left corner
 --map(hrlx,rty,left_wall_x,y,3,4)
 -- upper left wall
 --map(hrlx,rty,left_wall_x,y,1,4)
 -- lower left wall
 map(hrlx,rty,left_wall_x,y,1,3)
 
 -- todo center flooring
end

function draw_bedroom(left,bottom)
 -- bottom left corner
 y=bottom-(2*8)
 map(hrlx,rly,left,y,3,3)
 
 -- top left corner
 y-=(4*8)
 map(hrlx,rty,left,y,3,4)
 
 x=left+(3*8)
 -- top wall
 for i=1,3 do  
  map(8,7,x,y,3,2)
  x+=(3*8)
 end
 
 -- top right corner
 map(hrrx,rty,x,y,3,4)
 
 -- bottom right corner
 y=bottom-(2*8)
 map(hrrx,rly,x,y,3,4)
 
 -- bottom wall
 y+=8 
 for i=1,3 do
  x-=8
  map(hrrx,6,x,y,1,3)
 end
 
 -- todo center flooring
end

function draw_toilet(left,top)
 -- upper wall
 x=left+(4*8)
 map(hrlx,7,x,top,3,2)
 x+=(3*8)
 
 -- upper right corner
 map(hrrx,rty,x,top,3,4)
 
 -- lower right corner
 y=top+(4*8)
 map(hrrx,rly,x,y,3,4)
 
 -- lower wall
 --y+=(2*8)
 --x-=(2*8)
 --map(0,7,x,y,3,2)
 
 -- lower left corner
 x-=(3*8)
 --y-=16
 map(hrlx,rly,x,y,3,3)
 map(9,1,x+8,y+24,2,1)
 
 -- todo center flooring
end

function draw_guest_room(left,top)
 -- upper left corner
 map(hrlx,rty,left,top,3,4)
 
 -- upper wall
 x=left+8
 for i=1,2 do
  map(8,7,x,top,3,2)
  x+=(3*8)
 end
 
 -- upper right corner
 map(hrrx,rty,x,top,3,4)
 
 -- right wall
 y=top+16
 map(hrlx,rly,x+16,y,1,3)

 -- right lower corner
 y+=(3*8)
 map(hrrx,rly,x,y,3,4)
 
 -- bottom wall
 y+=16
 for i=1,2 do
  x-=(3*8)
  map(hrlx,7,x,y,3,2)
 end
 
 -- todo center flooring
end

function draw_third_floor()
 left,top=draw_alcove()
 if office_visited then 
  left,bottom=draw_office(left,top)
 end
 if secret_room_discovered then
  draw_secret_room(left,bottom)
 end
end

function draw_alcove() 
 -- stairs
 stairs_x,stairs_y=hall_alcove.x*8,hall_alcove.y*8
 map(sdx,sdy,stairs_x,stairs_y,2,1) 
 
 left=(hall_alcove.x*8)-16
 right=left+32

 -- lower left
 map_x,map_y=8,5
 map(map_x,map_y,left,stairs_y,3,4)
  
 -- lower right
 map_x,map_y=12,5
 map(map_x,map_y,right,stairs_y,3,4)
 
 -- left wall
 map_x,map_y=8,2
 y=stairs_y-16
 map(map_x,map_y,left,y,2,2)
 
 -- right wall
 map_x=13
 x=right+8
 map(map_x,map_y,x,y,2,2)
 
 -- upper right
 map_x,map_y=12,0
 y-=32
 top=y
 map(map_x,map_y,right,y,3,4)
 
 -- upper left
 map_x=8 
 map(map_x,map_y,left,y,3,4)
 
 x=stairs_x+8
 if office_visited then
  -- floor behind door
  spr(34,x,y)
 end
 
 -- door
 y=y+8
 spr(35,x,y)
 
 -- bottom center wall
 map_x,map_y=10,6
 y=stairs_y+8
 map(map_x,map_y,x,y,1,3)

 -- center flooring
 map_y=4
 x=x+8
 map(map_x,map_y,x,stairs_y,1,1)
 
 for i=1,3 do
  y=stairs_y-(i*8)
  map(map_x,map_y,stairs_x,y,3,1)
 end
 
 x,y=x-8,y-8
 map(map_x,map_y,x,y,1,1)
 
 -- todo: draw shotgun
 
 return left,top
end

function draw_office(left,bottom)
 map_x,map_y=8,0
 
 -- lower left
 bottom_y=bottom-32
 map(map_x,map_y,left,bottom_y,1,4)
 
 -- top left
 y=bottom_y-32
 map(map_x,map_y,left,y,3,4)
 
 -- top
 x=left+24
 for i=1,3 do
  map(map_x,map_y,x,y,3,1)
  x+=24
 end
 
 -- top right
 map_x=12
 map(map_x,map_y,x,y,3,4)
 
 -- right wall
 map_x=8
 most_x=x+16
 map(map_x,map_y,most_x,bottom_y,1,4)
 
 -- bottom right
 map_x,map_y=12,5
 if office_part_2_discovered then
  map(map_x,map_y,x,bottom,3,4)
 end
 
 -- bottom
 map_y=7
 x,y=x-24,bottom+16
 if office_part_2_discovered then
  map(map_x,map_y,x,y,3,1)
 end
 
 -- bottom left
 x-=16
 if office_part_2_discovered then
  map(map_x,map_y,x,y,2,1)
 end
 
 -- straggler secret room hint
 if office_part_2_discovered then
  spr(33,x+32,y+8)
 end
 
 -- todo: center flooring
 
 return x,y
end

function draw_secret_room(left,top)
 -- top right
 map_x,map_y=12,0
 x=left+8
 map(map_x,map_y,x,top,3,4)
 
 -- bottom right
 map_y=5
 y=top+32
 map(map_x,map_y,x,y,3,4)
 
 -- bottom left
 map_x=8
 x=left-8
 map(map_x,map_y,x,y,3,4)
 
 -- secret entrence
 x,y=left+8,top+8
 spr(34,x,top) -- doorway
 spr(34,x,top+8) -- floor
 spr(33,x-8,y) -- wall
 
 -- todo: center flooring
end