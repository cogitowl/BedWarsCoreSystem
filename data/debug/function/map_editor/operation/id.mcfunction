# 为地图设定id
$data modify storage bw:map maps[{"id":$(id)d}].id set value $(aim_id)d

# 同步焦点
$scoreboard players set @a[scores={map_editor_focus=$(id)}] map_editor_focus $(aim_id)


function debug