# 创建新地图

# 地图数据初始化
function debug:map_editor/operation/id/normal {"nbt":"new_map","storage":"debug:map_editor/command"}

data modify storage debug:map_editor/command new_map.additional.special_map.switch set value false

data modify storage bw:map maps append from storage debug:map_editor/command new_map

# 设定焦点
scoreboard players operation @s map_editor_focus = $map_id map_editor_temp

# 刷新统计数据
function bw:global/map/data_update_totally

# 清理残留
scoreboard players reset $map_id map_editor_temp

# 弹出菜单
function debug