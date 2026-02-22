tellraw @s [{"text":"\n ❇  ","color":"aqua"},{"text":"维护事项专注菜单"},{"text":" // ","color": "gray"},{"text":"通过控件快速了解、修改当前进行的维护事项\n","color":"white"}]

# 详细信息
$tellraw @s ["     当前专注于 ",{"storage": "debug:bug_tracker/content","nbt":"detail[{'id':$(id)}].type"}," 类维护 // ",{"storage": "debug:bug_tracker/content","nbt":"detail[{'id':$(id)}].name"},{"text":" (","color":"gray"},{"storage": "debug:bug_tracker/content","nbt":"detail[{'id':$(id)}].id","color":"gray"},{"text":")","color":"gray"}]
$tellraw @s ["     描述: ",{"storage": "debug:bug_tracker/content","nbt":"detail[{'id':$(id)}].desc"}]


tellraw @s ""

# 操作
summon marker ~ ~ ~ {CustomName:{"text":"[退出项目]","color":"white"},Tags:["debug1"]}
summon marker ~ ~ ~ {CustomName:{"text":"[删除项目]","color":"white"},Tags:["debug2"]}
$tellraw @s ["     操作  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event":{"action":"run_command","command":"/function debug:bug_tracker/focus/quit {'id':$(id)}"},"hover_event": {"action": "show_text","value": "退出当前正在专注的项目"}}, "  ",\
    {"selector":"@e[type=marker,tag=debug2]","click_event":{"action":"run_command","command":"/function debug:bug_tracker/content/delete {'id':$(id)}"},"hover_event": {"action": "show_text","value": "删除当前正在专注的项目"}}]
kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]