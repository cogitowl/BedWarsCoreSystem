# 床

# 粒子效果
particle dust{color:[1,0,0],scale:1} ~0.7 ~ ~1 0 0 0 0 1 force @a

# 获取数据
$execute store result score $center_x map_editor_temp run data get storage bw:map maps[{"id":$(id)d}].center[0]
$execute store result score $center_y map_editor_temp run data get storage bw:map maps[{"id":$(id)d}].center[1]
$execute store result score $center_z map_editor_temp run data get storage bw:map maps[{"id":$(id)d}].center[2]

# 修改数据: 坐标归正、朝向
$data modify storage bw:map maps[{"id":$(id)d}].team.$(team).bed.rotation set from entity @p Rotation

execute store result score $bed_x map_editor_temp run data get entity @s Pos[0]
#execute store result score $bed_y map_editor_temp run data get entity @s Pos[1]
execute store result score $bed_z map_editor_temp run data get entity @s Pos[2]

scoreboard players operation $bed_x map_editor_temp -= $center_x map_editor_temp
#scoreboard players operation $bed_y map_editor_temp -= $center_y map_editor_temp
scoreboard players operation $bed_z map_editor_temp -= $center_z map_editor_temp

scoreboard players operation $bed_x map_editor_temp *= $10 const
scoreboard players operation $bed_z map_editor_temp *= $10 const

scoreboard players operation $bed_x map_editor_temp += $5 const
scoreboard players operation $bed_z map_editor_temp += $5 const

execute store result entity @s Pos[0] double 0.1 run scoreboard players get $bed_x map_editor_temp
#execute store result entity @s Pos[1] double 1 run scoreboard players get $bed_y map_editor_temp
execute store result entity @s Pos[2] double 0.1 run scoreboard players get $bed_z map_editor_temp

$data modify storage bw:map maps[{"id":$(id)d}].team.$(team).bed.pos set from entity @s Pos

# 发送通知
$title @p actionbar [{"text": "已更新数据 ","bold": false},{"text": ">> ","bold": true,"color": "aqua"},{"text": "data.map.team.$(team).bed","bold": false,"color": "white"},{"text": " 设定为 ","bold": false},{"nbt":"maps[{'id':$(id)d}].team.$(team).bed","storage":"bw:map","bold": false,"color": "white"}]

# 清理残留
scoreboard players reset $bed_x map_editor_temp
scoreboard players reset $bed_y map_editor_temp
scoreboard players reset $bed_z map_editor_temp
scoreboard players reset $center_x map_editor_temp
scoreboard players reset $center_y map_editor_temp
scoreboard players reset $center_z map_editor_temp
kill @e[type=marker,tag=bed,tag=map_editor]