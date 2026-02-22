# 地图指令区域 按钮

# 没有中心点则拒绝执行


$execute unless data storage bw:map maps[{"id":$(id)d}].center run tellraw @s [{"text":"目前没有放置地图中心点！","color":red}]
$execute unless data storage bw:map maps[{"id":$(id)d}].center run return fail

# 已有指令区域则传送


$execute if data storage bw:map maps[{"id":$(id)d}].command_area_name run return run function debug:map_editor/panel/buttom/stru_command_area_tp {"id":$(id)}

# 初始化指令区域

say command area init!

## 召唤实体
summon marker 0.0 0.0 0.0 {"Tags":["map_editor","temp","map_editor_commandarea"]}

## 修改实体数据
$data modify entity @e[type=marker,limit=1,tag=map_editor_commandarea] Pos set from storage bw:map maps[{"id":$(id)d}].center

## 矫正放置位置
$execute as @e[type=marker,tag=map_editor_commandarea,limit=1,sort=nearest] at @s positioned ~ 65 ~24 run function debug:map_editor/panel/buttom/stru_command_area_init {"id":$(id)}

# 清理
kill @e[type=marker,sort=nearest,tag=map_editor_commandarea]

