# 昼夜更替（1=启用 2=关闭）
scoreboard players add $daylight_cycle gamerule 1
execute if score $daylight_cycle gamerule matches 3 run scoreboard players set $daylight_cycle gamerule 1