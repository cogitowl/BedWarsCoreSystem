# 队伍数量
scoreboard players add $team_number gamerule 1
execute if score $team_number gamerule matches 5 run scoreboard players set $team_number gamerule 2

# 发送提示文本
title @a actionbar [{"storage":"bw:lang","nbt":"lobby.gamerule.change","interpret": true},{"storage":"bw:lang","nbt":"lobby.gamerule.team_number.name"}," ",{"block":"-2 51 20","nbt":"front_text.messages[2]","interpret": true,"bold": true}]