# 玩家反馈菜单

# 只允许在大厅状态下使用
execute if score $working gaming matches 1 run return run tellraw @s "漏洞反馈器只能在游戏结束后使用."

# 初始化数据
$execute unless data storage debug:bug_tracker/feedback player.$(uuid).name run data modify storage debug:bug_tracker/feedback player.$(uuid).name set value "___暂未填写___"
$execute unless data storage debug:bug_tracker/feedback player.$(uuid).desc run data modify storage debug:bug_tracker/feedback player.$(uuid).desc set value "___暂未填写___"
$data modify storage debug:bug_tracker/feedback player.$(uuid).uuid set value "$(uuid)"

# 给予必要道具
clear @s written_book[custom_data={"bwtag":["bug_tracker","feedback"]}]
clear @s writable_book[custom_data={"bwtag":["bug_tracker","feedback"]}]
give @s minecraft:writable_book[writable_book_content={pages:['请点击“署名”按钮并根据聊天框中提示完成进一步操作']},custom_data={"bwtag":["bug_tracker","feedback"]}] 1


# 主界面
# name: -356132
# desc: -356131
# type_bug: -356130
# type_suggestions: -356129
# type_support: -356128

execute if score @s bug_tracker_temp matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[漏洞]","color":"white"},Tags:["debug1"]}
execute unless score @s bug_tracker_temp matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[漏洞]","color":"gray"},Tags:["debug1"]}
execute if score @s bug_tracker_temp matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[建议]","color":"white"},Tags:["debug2"]}
execute unless score @s bug_tracker_temp matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[建议]","color":"gray"},Tags:["debug2"]}
execute if score @s bug_tracker_temp matches 2 run summon marker ~ ~ ~ {CustomName:{"text":"[支援]","color":"white"},Tags:["debug3"]}
execute unless score @s bug_tracker_temp matches 2 run summon marker ~ ~ ~ {CustomName:{"text":"[支援]","color":"gray"},Tags:["debug3"]}

tellraw @s [{"text":"\n ✈  ","color":"aqua"},{"text":"起床战争服务器 漏洞提交菜单"}]
tellraw @s {"text":"     请按照提示操作, 完成对应内容的填写. ","color":"gray"}
tellraw @s ""
tellraw @s "      ✏ 填写空行须知 >>"
tellraw @s "         1. 系统已经给您书与笔, 请署名为期望的内容."
tellraw @s "         2. 手持已署名的书点击空行右侧的“填写”按钮, 即可将署名填写到空内."
tellraw @s ""
tellraw @s "      ♨ 填写其他内容须知 >>"
tellraw @s "         1. 面对单选, 用鼠标单击即可."
tellraw @s "         2. 如果已完成填写, 请点击”发送“按钮, 这就大功告成."
tellraw @s ""
tellraw @s "      ✍ 填写信息 >> "
$tellraw @s ["         名称: ",{"storage":"debug:bug_tracker/feedback","nbt":"player.$(uuid).name"},"  ",{"text":"[填入署名]","click_event": {"action": "run_command","command": "/trigger about set -356132"}}]
$tellraw @s ["         介绍: ",{"storage":"debug:bug_tracker/feedback","nbt":"player.$(uuid).desc"},"  ",{"text":"[填入署名]","click_event": {"action": "run_command","command": "/trigger about set -356131"}}]
tellraw @s ["         类型 >> ",\
    {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "run_command","command": "/trigger about set -356130"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event": {"action": "run_command","command": "/trigger about set -356129"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "run_command","command": "/trigger about set -356128"}}]
tellraw @s ""
tellraw @s ["      ",{"text":"[发送]","click_event": {"action": "run_command","command": "/trigger about set -356127"}},"  ", \
    {"text":"[重置]","click_event": {"action": "run_command","command": "/trigger about set -356126"}},"  " ]

kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]