$data modify storage bw:map maps[{"id":$(id)d}].center set from entity @s Pos

# 提示
$tellraw @a[scores={map_editor_focus=$(id)}] [{"text": "当前编辑的地图 中心点已刷新!","color": "yellow","bold": true}]
$tellraw @a[scores={map_editor_focus=$(id)}] [{"text": "中心点数据: "},{"storage":"bw:map","nbt": "maps[{'id':$(id)d}].center"}]
$tellraw @a[scores={map_editor_focus=$(id)}] [{"text":"请点击我打开调试界面","click_event": {"action": "run_command","command": "/function debug"}}]

# 清理中心点工具
$execute as @a[scores={map_editor_focus=$(id)}] run function debug:map_editor/panel/buttom/data_map_center_clear