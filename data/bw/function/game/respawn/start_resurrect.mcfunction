# 开始复活

# 设定死亡标题的显示时间
title @s times 5t 3s 5t

# 发送死亡提示


execute store result score $random temp run random value 1..6


execute if score $random temp matches 1 run title @s title "失误"
execute if score $random temp matches 2 run title @s title "死亡"
execute if score $random temp matches 3 run title @s title "错误"
execute if score $random temp matches 4 run title @s title "死亡"
execute if score $random temp matches 5 run title @s title "还差一点"
execute if score $random temp matches 6 run title @s title "本没问题"

scoreboard players reset $random temp

# 显示凶手（如果有的话）（出现多个则不显示）
execute store result score $killer_number temp if entity @a[tag=killer,tag=playing]
execute if score $killer_number temp matches 1 run title @s subtitle {"storage":"bw:lang","nbt":"game.respawn.start.subtitle","interpret": true}

scoreboard players reset $killer_number

# 设定复活中标题的显示时间
title @s times 5t 5t 5t

# 同步死亡时间
scoreboard players operation @s respawn_time = $ respawn_time
scoreboard players add @s respawn_time 1
execute if score $respawn_wait gamerule matches 2 run scoreboard players set @s respawn_time 1