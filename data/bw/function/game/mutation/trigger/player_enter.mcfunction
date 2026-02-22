# 玩家载入事件

execute if score $working mutation matches 4 run give @s[tag=playing,team=!spec] magma_cream[custom_data={track_fireball:true},custom_name={"text":"真 - 追踪火球"}]

execute if score $working mutation matches 5 run attribute @s attack_speed base set 100