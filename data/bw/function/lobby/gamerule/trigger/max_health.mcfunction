# 最大生命值（0=20,1=25,2=30）
scoreboard players add $max_health gamerule 1
execute if score $max_health gamerule matches 3 run scoreboard players set $max_health gamerule 0