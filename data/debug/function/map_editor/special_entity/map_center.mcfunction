
# 寻找最近的玩家 并且调用这个玩家的数据
execute as @e if score @s map_editor_focus = @s map_editor_focus as @p store result storage debug:map_editor/special_entity map_center.id double 1 run scoreboard players get @s map_editor_focus

# 传入参数
execute align xz run function debug:map_editor/operation/map_center with storage debug:map_editor/special_entity map_center

# 过河拆桥
kill @s