# 进入地图

# 排除其他玩家
execute if entity @s[gamemode=!adventure] run return fail
execute if entity @s[team=!lobby] run return fail

# 读取地图数据
data remove storage bw:lobby/map visit.data
data remove storage bw:lobby/map visit.id

execute store result storage bw:lobby/map visit.id int 1 run scoreboard players get @s visit_map
function bw:lobby/map/visit/load_data with storage bw:lobby/map visit

# 进入副地图

execute store result score $cal temp run data get storage bw:lobby/map visit.data.z 1
scoreboard players add $cal temp 1000
execute store result storage bw:lobby/map visit.data.z float 1 run scoreboard players get $cal temp
scoreboard players reset $cal temp


# 传唤
function bw:lobby/map/visit/enter with storage bw:lobby/map visit.data