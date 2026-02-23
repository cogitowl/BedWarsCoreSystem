# 尝试解锁地图

# 去除结尾的 d
execute store result score $target_id map run data get storage bw:map using.id 1
execute store result storage bw:map special_lock int 1 run scoreboard players get $target_id map

# 传入检查函数
function bw:lobby/map/special_lock/check with storage bw:map