# 传唤玩家到地图指令区域


# 召唤实体
summon marker 0.0 0.0 0.0 {"Tags":["map_editor","temp","map_editor_commandarea"]}

# 修改实体数据
$data modify entity @e[type=marker,limit=1,tag=map_editor_commandarea] Pos set from storage bw:map maps[{"id":$(id)d}].center
data modify entity @e[type=marker,limit=1,tag=map_editor_commandarea] Pos[1] set value 80
data modify entity @e[type=marker,limit=1,tag=map_editor_commandarea] Pos[2] set value 24

# 传送玩家到实体
tp @s @e[type=marker,limit=1,sort=nearest,tag=map_editor_commandarea]

# 清理
kill @e[type=marker,limit=1,sort=nearest,tag=map_editor_commandarea]