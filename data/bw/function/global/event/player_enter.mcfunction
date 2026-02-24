# 玩家载入

# 重置计分
scoreboard players set @s leave_game 0

# 控制计分板
execute unless score @s health = @s health run damage @s 0.000001 minecraft:out_of_world
execute unless score @s energy matches -2147483648..2147483647 run scoreboard players operation @s energy = $limit energy
execute unless score @s energy_clock matches -2147483648..2147483647 run scoreboard players operation @s energy_clock = $ energy_clock

# 清除特殊team
team leave @s[team=spec]

# 同步UUID
execute store result score @s UUID run data get entity @s UUID[0]

# 数据控制
recipe take @s *
attribute @s attack_speed base set 4
attribute @s max_health base set 20

# 生涯数据
scoreboard players operation @s[tag=playing] stat_death += @s round_death
scoreboard players operation @s[tag=playing] stat_kill += @s round_kill
scoreboard players operation @s[tag=playing] stat_bed_break += @s round_bed_break
scoreboard players reset @s round_death
scoreboard players reset @s round_kill
scoreboard players reset @s round_bed_break

# 清除遗留数据

execute unless score @s round_id = $ round_id run tag @s remove spec

tag @s remove total_rank1
tag @s remove total_rank2
tag @s remove total_rank3
tag @s remove total_rankl
tag @s remove lose
tag @s remove win
tag @s remove test
tag @s remove pre-selecte
tag @s remove pre-selected
tag @a remove preselect_player

# 清除音乐
function bw:global/music/stop_all

# 发送维护通知
execute if score $notification maintenance matches 1 run tag @s add scheduler
execute if score $notification maintenance matches 1 run schedule function bw:global/event/debug_notice/scheduler 2s replace

# 设定提示
function bw:global/tip/init_player

# 进入各个状态
execute if score $working gaming matches 0 run function bw:lobby/player_enter
execute if score $working gaming matches 1 run function bw:game/player_event/enter