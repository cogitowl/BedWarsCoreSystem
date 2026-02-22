# 打印 “维护事项编辑菜单”

# 获取用户专注项目 id
execute store result storage debug:bug_tracker/management trigger.id int 1 run scoreboard players get @s bug_tracker_focus

# 传入参数
function debug:bug_tracker/management/panel with storage debug:bug_tracker/management trigger