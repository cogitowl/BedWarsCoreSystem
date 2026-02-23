# 生成游玩区域中心点
data modify entity @s Pos set from storage bw:map using.center

tag @s add playing_center
scoreboard players operation @s map = $using map