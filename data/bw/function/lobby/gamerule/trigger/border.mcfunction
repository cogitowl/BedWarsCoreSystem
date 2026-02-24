# 边界设定（1=在设定时间后自动缩圈 2=不会自动缩圈）
scoreboard players add $border gamerule 1
execute if score $border gamerule matches 3 run scoreboard players set $border gamerule 1