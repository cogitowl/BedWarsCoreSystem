# 触发投票

# 管理员正在强开游戏
execute if score $force_start temp matches 1 run return run data modify storage bw:lobby/vote last_message set value {"text":"管理员正在启动游戏"}


# 维护模式
execute if score $disable_player_vote maintenance matches 1 run return run data modify storage bw:lobby/vote last_message set value {"text":"正在维护中, 禁用投票系统"}


# 没有解锁地图
execute as @e[type=marker,tag=map,tag=special_map] if score @s map = $sel map if data entity @s data.map.Lock run data modify storage bw:lobby/vote last_message set value {"text":"没有解锁地图"}
execute as @e[type=marker,tag=map,tag=special_map] if score @s map = $sel map if data entity @s data.map.Lock as @p at @s run return run function lib:sounds/error

# 玩家不足
execute store result score $total_count player_count if entity @a[team=!debug,scores={afk_time=..179}]
execute if score $total_count player_count < $team_member gamerule run return run data modify storage bw:lobby/vote last_message set value {"text":"玩家数量不足"}


# 打断投票
execute if score $voting vote matches 1..2 run return run function bw:lobby/vote/cancel

# 开始投票
function bw:lobby/vote/setup

# 更新 Bossbar
bossbar set lobby name [{"storage":"bw:lang","nbt":"lobby.map.choice.now","interpret": true}," | 投票: ",{"storage":"bw:lobby/vote","nbt": "last_message","interpret": true}]

# 收尾
scoreboard players reset $voting temp
scoreboard players reset $map_copy temp