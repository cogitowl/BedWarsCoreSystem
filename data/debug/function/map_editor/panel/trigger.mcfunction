
# 数据操作
execute store result storage debug:map_editor/panel trigger.uuid int 1 run scoreboard players get @s UUID
execute store result storage debug:map_editor/panel trigger.id int 1 run scoreboard players get @s map_editor_focus

function debug:map_editor/panel/trigger_get_name with storage debug:map_editor/panel trigger

function debug:map_editor/panel/trigger_copy_data with storage debug:map_editor/panel trigger

# 传入参数
function debug:map_editor/panel/trigger_start with storage debug:map_editor/panel trigger

# 清理残留
data remove storage debug:map_editor/panel trigger