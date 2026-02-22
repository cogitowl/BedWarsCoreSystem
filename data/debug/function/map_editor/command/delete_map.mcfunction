# 删除当前正在编辑的地图
# 传入地图id

# 移除地图数据
$data modify storage debug:map_editor/command rubbish append from storage bw:map maps[{"id":$(id)d}]
$data remove storage bw:map maps[{"id":$(id)d}]

# 退出编辑模式
$function debug:map_editor/command/quit_editor with storage debug:map_editor/panel data.$(uuid)

# 刷新统计数据
function bw:global/map/data_update_totally

# 弹出菜单
function debug