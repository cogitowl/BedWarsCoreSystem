# 进入地图

# 格式化数据 进入游玩区域

data modify storage bw:map visit.x set from storage bw:map using.center[0]

execute store result score $z temp run data get storage bw:map using.center[2]
scoreboard players add $z temp 1000
execute store result storage bw:map visit.z double 1 run scoreboard players get $z temp
scoreboard players reset $z temp

# 随机传送
function bw:lobby/map/visit/enter_2nd with storage bw:map visit

# 清理
data remove storage bw:map visit