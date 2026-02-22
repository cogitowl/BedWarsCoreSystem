# 获取玩家 uuid 
execute store result storage debug:bug_tracker/feedback uuid int 1 run scoreboard players get @s UUID

# 传入 uuid
function debug:bug_tracker/feedback/panel with storage debug:bug_tracker/feedback