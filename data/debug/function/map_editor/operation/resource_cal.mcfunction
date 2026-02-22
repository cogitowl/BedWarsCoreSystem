# 保存资源点数据

# 获取必要信息

$execute store result score $center_x map_editor_temp run data get storage bw:map maps[{"id":$(id)d}].center[0]
$execute store result score $center_z map_editor_temp run data get storage bw:map maps[{"id":$(id)d}].center[2]

execute store result score $entity_x map_editor_temp run data get entity @s Pos[0]
execute store result score $entity_z map_editor_temp run data get entity @s Pos[2]

# 通过偏移量计算游玩区域位置
scoreboard players operation $entity_x map_editor_temp -= $center_x map_editor_temp
scoreboard players operation $entity_z map_editor_temp -= $center_z map_editor_temp

# 矫正 xz 轴
scoreboard players operation $entity_x map_editor_temp *= $10 const
scoreboard players operation $entity_z map_editor_temp *= $10 const

scoreboard players operation $entity_x map_editor_temp += $5 const
scoreboard players operation $entity_z map_editor_temp += $5 const

# 保存资源点数据
execute store result entity @s Pos[0] double 0.1 run scoreboard players get $entity_x map_editor_temp
execute store result entity @s Pos[2] double 0.1 run scoreboard players get $entity_z map_editor_temp

tellraw @a [{"entity": "@s","nbt": "Pos"}]

# 清除暂时数据
scoreboard players reset $entity_x map_editor_temp
scoreboard players reset $entity_z map_editor_temp
scoreboard players reset $center_x map_editor_temp
scoreboard players reset $center_z map_editor_temp