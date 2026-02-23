# 强加载原始地图与游玩区域 需要去 D
#! 这里直接copy两份 后面优化再单独设函数

## 强加载原始地图
execute store result score $using_x map run data get storage bw:map using.center[0]
execute store result score $using_y map run data get storage bw:map using.center[1]
execute store result score $using_z map run data get storage bw:map using.center[2]

execute store result storage bw:map using.generate_entity.x int 1 run scoreboard players get $using_x map
execute store result storage bw:map using.generate_entity.y int 1 run scoreboard players get $using_y map
execute store result storage bw:map using.generate_entity.z int 1 run scoreboard players get $using_z map
data modify storage bw:map using.generate_entity.distance set from storage bw:map using.border.max

function bw:global/map/playing_area/forceload_2nd with storage bw:map using.generate_entity

## 强加载游玩区域
scoreboard players add $using_z map 1000
execute store result storage bw:map using.generate_entity.y int 1 run scoreboard players get $using_y map

function bw:global/map/playing_area/forceload_2nd with storage bw:map using.generate_entity

# 清除无用数据
data remove storage bw:map using.generate_entity
scoreboard players reset $using_x map
scoreboard players reset $using_z map