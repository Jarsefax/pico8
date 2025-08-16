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
grlx,grrx=0,4
--garden_room_left_x
--garden_room_right_x
gx,gy=24,2
-- ground_x,ground_y

-- stairs cell positions
temple_labyrinth={x=20,y=5}
garden_down={x=2,y=32}
lobby_cellar={x=7,y=26}
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
  draw_front()
  if entre_visited then
    draw_entre()
  end
  if kitchen_visited then
    draw_kitchen()
  end
  if dining_room_dicovered then
    draw_dining_room()
  end
  if bathroom_visited then
    draw_bathroom()
  end
  if right_garden_visited then
    draw_right_garden()
  end
  if upper_garden_discovered then
    draw_upper_garden()
  end
  if left_garden_dicovered then
    draw_left_garden()
  end
end

function draw_front()
  draw_woods()
  draw_gravel()
  draw_road()
end

function draw_woods()
  x,y=garden_down.x-4,garden_down.y+2

  -- left outline (right to left, top to bottom)
  map(grlx+1,rty, x*8,y*8, 2,2)
  map(grlx,rly+1, (x-1)*8,y*8, 1,3)
  map(grlx+1,rty, (x-2)*8,(y+1)*8, 1,2)
  map(grlx,rly+1, (x-3)*8,(y+1)*8, 1,3)
  map(grlx+1,rty, (x-4)*8,(y+2)*8, 1,2)
  map(grlx,rly+1, (x-5)*8,(y+2)*8, 1,3)
  map(grlx+1,rty, (x-6)*8,(y+3)*8, 1,2)
  map(grlx,rly+1, (x-7)*8,(y+3)*8, 1,3)
  map(grlx+1,rty, (x-8)*8,(y+4)*8, 1,2)
  map(grlx,rly+1, (x-9)*8,(y+4)*8, 1,3)
  map(grlx+1,rty, (x-10)*8,(y+5)*8, 1,2)
  map(grlx,rly+2, (x-15)*8,(y+5)*8, 5,2)
  map(grlx,rly+2, (x-19)*8,(y+5)*8, 5,2)
  -- todo: left fill
  
  -- right outline (left to right, top to bottom)
  map(grlx+1,rty, (x+30)*8,y*8, 2,2)
  map(grlx,rly+1, (x+32)*8,y*8, 1,3)
  map(grlx+1,rty, (x+33)*8,(y+1)*8, 1,2)
  map(grlx,rly+1, (x+34)*8,(y+1)*8, 1,3)
  map(grlx+1,rty, (x+35)*8,(y+2)*8, 1,2)
  map(grlx,rly+1, (x+36)*8,(y+2)*8, 1,3)
  map(grlx+1,rty, (x+37)*8,(y+3)*8, 1,2)
  map(grlx,rly+1, (x+38)*8,(y+3)*8, 1,3)
  map(grlx+1,rty, (x+39)*8,(y+4)*8, 1,2)
  map(grlx,rly+1, (x+40)*8,(y+4)*8, 1,3)
  map(grlx+1,rty, (x+41)*8,(y+5)*8, 1,2)
  map(grlx,rly+2, (x+42)*8,(y+5)*8, 5,2)
  map(grlx,rly+2, (x+47)*8,(y+5)*8, 5,2)
  -- todo: right fill
end

function draw_gravel()
  x,y=garden_down.x-4,garden_down.y+4
  
  -- top left
  map(6,12, x*8,y*8, 12,1)
  map(6,12, (x-2)*8,(y+1)*8, 14,1)
  -- top center
  map(6,12, (x+12)*8,y*8, 12,2)
  --top right
  map(6,12, (x+24)*8,y*8, 8,1)
  map(6,12, (x+24)*8,(y+1)*8, 10,1)
  -- middle left
  map(6,12, (x-4)*8,(y+2)*8, 12,1)
  map(6,12, (x-6)*8,(y+3)*8, 14,1)
  -- middle center
  map(6,12, (x+8)*8,(y+2)*8, 8,2)
  map(6,12, (x+16)*8,(y+2)*8, 8,2)
  -- middle right
  map(6,12, (x+24)*8,(y+2)*8, 12,1)
  map(6,12, (x+24)*8,(y+3)*8, 14,1)

  -- low left
  map(6,12, (x-8)*8,(y+4)*8, 12,1)
  map(6,12, (x-10)*8,(y+5)*8, 14,1)
  map(6,12, (x-18)*8,(y+5)*8, 8,1)
  -- low center
  map(6,12, (x+4)*8,(y+4)*8, 13,2)
  map(6,12, (x+14)*8,(y+4)*8, 14,2)
  -- low right
  map(6,12, (x+28)*8,(y+4)*8, 12,1)
  map(6,12, (x+28)*8,(y+5)*8, 14,1)
  map(6,12, (x+42)*8,(y+5)*8, 10,1)
  -- under road
  map(6,12, (x-28)*8,(y+15)*8, 14,1)
  map(6,12, (x-14)*8,(y+15)*8, 14,1)
  map(6,12, x*8,(y+15)*8, 14,1)
  map(6,12, (x+14)*8,(y+15)*8, 14,1)
  map(6,12, (x+28)*8,(y+15)*8, 14,1)
  map(6,12, (x+42)*8,(y+15)*8, 14,1)
end

function draw_road()
  origin_x,origin_y=garden_down.x-20,garden_down.y+10
  -- top (left to right)
  map(6,11, (origin_x-2)*8,origin_y*8, 14,1)
  map(6,11, (origin_x+12)*8,origin_y*8, 14,1)
  map(6,11, (origin_x+26)*8,origin_y*8, 14,1)
  map(6,11, (origin_x+40)*8,origin_y*8, 14,1)
  map(6,11, (origin_x+54)*8,origin_y*8, 14,1)
  -- middle (left to right)
  map(6,10, (origin_x-2)*8,(origin_y+4)*8, 14,1)
  map(6,10, (origin_x+9)*8,(origin_y+4)*8, 14,1)
  map(6,10, (origin_x+24)*8,(origin_y+4)*8, 14,1)
  map(6,10, (origin_x+39)*8,(origin_y+4)*8, 14,1)
  map(6,10, (origin_x+53)*8,(origin_y+4)*8, 14,1)
  -- bottom (left to right)
  map(6,9, (origin_x-2)*8,(origin_y+8)*8, 14,1)
  map(6,9, (origin_x+12)*8,(origin_y+8)*8, 14,1)
  map(6,9, (origin_x+26)*8,(origin_y+8)*8, 14,1)
  map(6,9, (origin_x+40)*8,(origin_y+8)*8, 14,1)
  map(6,9, (origin_x+54)*8,(origin_y+8)*8, 14,1)
end

function draw_entre()
  x,y=lobby_hall.x*8,lobby_hall.y*8
  -- upper left corner
  map(hrlx,rty, x-(2*8),y-(3*8), 3,7)
  -- door to bathroom
  spr(35, x+8,y-16)
  -- floor behind bathroom door
  if bathroom_visited then
    spr(34, x+8,y-(3*8))
  end
  -- upper right corner
  map(hrrx,rty, x+(2*8),y-(3*8), 3,2)
  -- door to kitchen
  spr(36, x+(4*8),y-8)
  -- wall under kitchen door
  spr(32, x+(4*8),y)
  -- inner corner
  map(hrlx,rly-2, x+(4*8),y+8, 4,6)
  -- lower left corner
  map(hrlx,rly-3, x-16,y+(4*8), 4,7)
  -- draw entrence doors
  spr(35, x+(2*8),y+(10*8), 1,1, true)
  spr(35, x+(3*8),y+(10*8))
  -- floor behind entrence doors
  if entre_visited then
    map(gx,gy, x+(2*8),y+(9*8), 2,1)
  end
  -- wall right of entrence
  map(hrlx,rly+2, x+(4*8),y+(9*8), 3,2)
  -- lower right corner
  map(hrrx-3,rly+1, x+(7*8),y+(8*8), 7,3)
  -- "upper" right corner
  map(hrrx-1,rty, x+(9*8),y+(5*8), 5,3)  
  -- stairs up to hall
  map(sux,suy,x,y,2,1)
  -- stairs down to cellar
  x,y=lobby_cellar.x*8,lobby_cellar.y*8
  map(sdx,sdy,x,y,2,1)

  -- todo draw floor
end

function draw_kitchen()
  origin_x,origin_y=(lobby_hall.x+4)*8,(lobby_hall.y-10)*8

  -- upper left corner
  map(hrlx,rty, origin_x,origin_y, 5,7)
  -- upper right corner
  map(hrrx-1,rty, origin_x+(5*8),origin_y, 4,4)
  -- door to garden
  spr(36, origin_x+(8*8),origin_y+(4*8))
  -- lower right corner
  map(hrrx-1,rly-3, origin_x+(5*8),origin_y+(5*8), 4,7)
  -- wall right of dining room door
  map(hrlx+1,rty, origin_x+(3*8),origin_y+(10*8), 2,2)
  -- wall left of dining room door
  map(hrlx+1,rty, origin_x+8,origin_y+(10*8), 1,2)
  -- door to dining room
  spr(35, origin_x+(2*8), origin_y+(11*8))

  -- todo draw floor
end

function draw_dining_room()
  origin_x,origin_y=(lobby_hall.x+4)*8,lobby_hall.y*8

  -- wall left of kitchen door
  map(hrlx+1,rty, origin_x+8,origin_y, 1,2)
  -- door to kitchen
  spr(35, origin_x+(2*8), origin_y+8)
  -- floor behind kitchen door
  if kitchen_visited then
    spr(34, origin_x+(2*8), origin_y)
  end
  -- upper right corner
  map(hrrx-3,rty, origin_x+(3*8),origin_y, 7,5)

  -- todo draw floor
end

function draw_bathroom()
  origin_x,origin_y=(lobby_hall.x-2)*8,(lobby_hall.y-10)*8
  
  -- top left corner
  map(hrlx,rty, origin_x,origin_y, 7,7)

  -- todo draw floor
end

function draw_right_garden()
  -- bottom left wall
  map(grlx+1,rty, (garden_down.x+18)*8,(garden_down.y+2)*8, 3,2)
  -- door to front
  spr(35, (garden_down.x+21)*8,(garden_down.y+3)*8)
  -- right lower corner
  map(grrx-1,rly-3, (garden_down.x+22)*8,(garden_down.y-3)*8, 4,7)
  -- lower wall
  map(grlx,rty, (garden_down.x+25)*8,(garden_down.y-10)*8, 1,7)
  -- middle wall
  map(grlx,rty, (garden_down.x+25)*8,(garden_down.y-17)*8, 1,7)
  -- upper wall
  map(grlx,rty, (garden_down.x+25)*8,(garden_down.y-21)*8, 1,4)
  -- workshed side
  map(hrlx,rty, (garden_down.x+17)*8,(garden_down.y-24)*8, 1,4)
  spr(33, (garden_down.x+17)*8,(garden_down.y-20)*8)
  -- upper right corner
  map(grrx-3,rty, (garden_down.x+20)*8,(garden_down.y-28)*8, 7,7)
  -- upper wall
  map(grlx+1,rty, (garden_down.x+17)*8,(garden_down.y-28)*8, 4,2)
 
  -- todo draw ground
end

function draw_upper_garden()
  -- upper left corner
  map(grlx,rty, (garden_down.x-2)*8,(garden_down.y-28)*8, 4,7)
  -- upper wall (left to right)
  map(grlx+1,rty, (garden_down.x+2)*8,(garden_down.y-28)*8, 5,2)
  map(grlx+1,rty, (garden_down.x+7)*8,(garden_down.y-28)*8, 5,2)
  map(grlx+1,rty, (garden_down.x+12)*8,(garden_down.y-28)*8, 5,2)
  -- left wall (up to down)
  map(grlx,rty, (garden_down.x-2)*8,(garden_down.y-21)*8, 1,8)
  map(grlx,rty, (garden_down.x-2)*8,(garden_down.y-13)*8, 1,8)
  -- upper left shed corner
  map(hrlx,rty, (garden_down.x+13)*8,(garden_down.y-24)*8, 4,3)
  -- lower left shed corner
  map(hrlx,rly+2, (garden_down.x+13)*8,(garden_down.y-21)*8, 2,2)
  -- shed door
  spr(35, (garden_down.x+15)*8,(garden_down.y-20)*8)
  -- wall right of shed door
  map(hrlx,rly+2, (garden_down.x+16)*8,(garden_down.y-21)*8, 1,2)

  -- shed insides
  if shed_visited then
    -- todo draw floor
  end
 
  -- todo draw ground
end

function draw_left_garden()
  x,y=garden_down.x*8,garden_down.y*8
  -- lower left corner
  map(grlx,rly, x-(2*8),y, 5,5)
  -- left wall
  map(grlx,rty+2, x-(2*8),y-(5*8), 2,5)
  -- stairs down to labyrinth
  map(sux,suy,x,y,2,1)
 
  -- todo draw ground
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
  x,y=lobby_hall.x*8,lobby_hall.y*8
  -- upper left corner
  map(hrlx,rty, x-(2*8),y-(3*8), 6,5)
  -- left wall
  map(hrlx,rty+2, x-(2*8),y+16, 5,1)
  -- bedroom door
  spr(35, x+8,y-(2*8))
  -- floor behind bedroom door
  if bedroom_visited then
    spr(34, x+8,y-(3*8))
  else
    rectfill(x+8,y-(3*8), x+16,y-(2*8), 0)
  end
  -- upper right corner
  map(hrrx-1,rty, x+(4*8),y-(3*8), 4,5)
  -- toilet door
  spr(36, x+(7*8),y)
  -- corner under toilet door
  map(hrrx,rly, x+(5*8),y+8, 3,4)
  -- corner of "toilet hall" to "main hall"
  map(hrlx,ruy, x+(3*8),y+(3*8), 2,2)
  -- stairs to lobby
  map(sdx,sdy,x,y,2,1)

  x,y=hall_alcove.x*8,hall_alcove.y*8
  -- lower left corner
  map(hrlx,rly,x-16,y,3,4)
  -- left wall
  map(hrlx,rty+2, x-(2*8),y-(5*8), 5,5)
  -- lower right corner
  map(hrrx,rly,x+8,y,3,4)
  -- guest room door
  spr(36,x+(3*8),y-8) 
  -- wall over guest room door
  map(hrlx,rty, x+(3*8),y-(4*8), 1,3)
  -- stairs to alcove
  map(sux,suy,x,y,2,1)
 
  -- todo draw floor
end

function draw_bedroom()
  origin_x,origin_y=(lobby_hall.x-2)*8,(lobby_hall.y-10)*8
  -- left
  map(hrlx,rty, origin_x,origin_y, 6,7)
  -- middle
  map(hrlx+1,rty, origin_x+(6*8),origin_y, 3,7)
  --right
  map(hrlx+1,rty, origin_x+(9*8),origin_y, 6,7)
  -- lower right wall
  if toilet_visited==false then
    map(hrlx,rly+2, origin_x+(10*8),origin_y+(7*8), 5,2)
  end

  -- todo draw floor
end

function draw_toilet()
  origin_x,origin_y=(lobby_hall.x+8)*8,(lobby_hall.y-3)*8
  -- upper
  map(hrlx+2,rty, origin_x,origin_y, 5,3)
  -- center
  map(hrlx+2,rty+2, origin_x,origin_y+(3*8), 5,1)
  -- lower
  map(hrlx+2,rly, origin_x,origin_y+(4*8), 5,4)
 
  -- todo draw floor
end

function draw_guest_room()
  origin_x,origin_y=(hall_alcove.x+4)*8,(hall_alcove.y-5)*8
  -- upper left
  map(hrlx+1,rty+1, origin_x,origin_y+8, 4,4)
  -- upper right
  map(hrrx-1,rty, origin_x+(5*8),origin_y, 5,5)
  -- lower left
  map(hrlx+1,rly+1, origin_x,origin_y+(6*8), 4,4)
  -- lower right
  map(hrrx-2,rly, origin_x+(4*8),origin_y+(5*8), 6,4)

  -- todo draw floor
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
 
 -- todo: draw floor
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
 
 -- todo: draw floor
 
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
 
 -- todo: draw floor
end