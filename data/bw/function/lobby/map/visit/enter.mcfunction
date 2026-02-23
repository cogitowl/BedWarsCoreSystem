# 进入地图

# 格式化数据

data modify storage bw:map visit.x set from storage bw:map using.center[0]
data modify storage bw:map visit.z set from storage bw:map using.center[2]

# 随机传送
function bw:lobby/map/visit/enter_2nd with storage bw:map visit

# 清理
data remove storage bw:map visit