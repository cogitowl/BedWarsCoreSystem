# 更新状态: 完成放置资源点

# 清理多余道具
function debug:map_editor/operation/resource_clear

# 操纵 NBT 
$data remove storage bw:map maps[{"id":$(id)d}].map_editor.resource.status
$data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.done set value true

# 移除现有数据
$data remove storage bw:map maps[{"id":$(id)d}].spawner

# 数量统计
$execute store result storage bw:map maps[{"id":$(id)d}].spawner.number.copper double 1 if entity @e[type=marker,tag=res,tag=res_copper,tag=map_editor]
$execute store result storage bw:map maps[{"id":$(id)d}].spawner.number.iron double 1 if entity @e[type=marker,tag=res,tag=res_iron,tag=map_editor]
$execute store result storage bw:map maps[{"id":$(id)d}].spawner.number.diamond double 1 if entity @e[type=marker,tag=res,tag=res_diamond,tag=map_editor]

# 记录位置
## 通过偏移量计算游玩位置
$execute as @e[type=marker,tag=res,tag=map_editor] run function debug:map_editor/operation/resource_cal {"id":$(id)d}

## 储存数据
$execute as @e[type=marker,tag=res,tag=res_copper,tag=map_editor] run data modify storage bw:map maps[{"id":$(id)d}].spawner.copper append from entity @s Pos
$execute as @e[type=marker,tag=res,tag=res_iron,tag=map_editor] run data modify storage bw:map maps[{"id":$(id)d}].spawner.iron append from entity @s Pos
$execute as @e[type=marker,tag=res,tag=res_diamond,tag=map_editor] run data modify storage bw:map maps[{"id":$(id)d}].spawner.diamond append from entity @s Pos

# 清理实体
kill @e[type=marker,tag=res,tag=map_editor]

# 弹出菜单
function debug