# 读取地图数据
$data modify storage bw:lobby/map visit.data.x set from storage bw:map maps[{"id":$(id)d}].visit.pos[0]
$data modify storage bw:lobby/map visit.data.y set from storage bw:map maps[{"id":$(id)d}].visit.pos[1]
$data modify storage bw:lobby/map visit.data.z set from storage bw:map maps[{"id":$(id)d}].visit.pos[2]

$data modify storage bw:lobby/map visit.data.0 set from storage bw:map maps[{"id":$(id)d}].visit.rotation[0]
$data modify storage bw:lobby/map visit.data.1 set from storage bw:map maps[{"id":$(id)d}].visit.rotation[1]

#tellraw @a {"storage":"bw:lobby/map visit","nbt":"data"}