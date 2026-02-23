# 更换旁观地图

# 设定参观地图
scoreboard players add @s visit_map 1
execute if score @s visit_map >= $max map run scoreboard players operation @s visit_map = $min map
scoreboard players set @s[scores={visit_map=0}] visit_map 1

function bw:lobby/map/visit/enter_handle