

# 发送地图恢复请求
execute store result storage bw:basic temp.map_id int 1 run scoreboard players get $using map
function bw:global/map/control/request with storage bw:basic temp

# 载入大厅状态
function bw:lobby/setup
forceload add 0 0
