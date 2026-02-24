# 进入等待复制阶段
scoreboard players set $waiting game_start_mode 1

# 设置玩家数据
gamemode spectator @a[tag=player]

# 通知玩家
title @a[tag=player] title {"text":"| ⚠ |","color":"yellow"}
title @a[tag=player] subtitle {"text":"地图复制进行时｜请稍候...","color":"yellow"}

# 进入地图
execute as @a[tag=player] at @s run function bw:lobby/map/visit/enter

# 进入快速复制模式
scoreboard players set $fast_mode map 1