# 取消设定为特殊地图

# 清理数据
scoreboard players reset $map_id map_editor_temp

# nbt
$data remove storage bw:map maps[{"id":$(id)d}].additional.special_map.on

# id
$function debug:map_editor/operation/id/normal {"nbt":"maps[{'id':$(id)d}]","storage":'bw:map'}

# 更新焦点
scoreboard players operation @s map_editor_focus = $map_id map_editor_temp

# 刷新统计
function bw:global/map/data_update_totally

# 清理数据
scoreboard players reset $map_id map_editor_temp

# 界面
function debug