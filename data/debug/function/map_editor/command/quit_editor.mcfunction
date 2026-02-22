# 退出编辑模式


# 数据控制
scoreboard players reset @s map_editor_focus

# 解锁地图
$execute unless entity @e[scores={map_editor_focus=$(id)}] run function debug:map_editor/operation/unlock with storage debug:map_editor/panel data.$(uuid)

# 申请复制
$function bw:global/map/control/request {"map_id":$(id)}

# 统计数据
function bw:global/map/data_update_totally

# 重弹界面
function debug