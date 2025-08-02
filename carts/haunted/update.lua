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
 if menu_state==0 and btnp(⬇️) then menu_state=1
 elseif menu_state==1 and btnp(⬆️) then menu_state=0
 elseif menu_state==0 and btnp(🅾️) then state=2 end
end

function update_intro()
 if btn() > 0 then state=3 end
end

function update_game()
 -- start dev map design code
 old_z=player_z
 if btnp(🅾️) then player_z-=1
 elseif btnp(❎) then player_z+=1 end
 if player_z<-2 or player_z>3 then player_z=old_z end
 -- end dev map design code
 
 if btn(⬅️) then player_x-=player_speed
 elseif btn(➡️) then player_x+=player_speed
 elseif btn(⬆️) then player_y-=player_speed
 elseif btn(⬇️) then player_y+=player_speed end
end