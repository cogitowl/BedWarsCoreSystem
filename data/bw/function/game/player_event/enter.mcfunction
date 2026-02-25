# 要求玩家载入状态：gaming

# 离开非游戏队伍
team leave @s[team=lobby]

# 游戏随机事件
execute if score $working mutation = $working mutation run tellraw @s [{"text": " ✦ ","color": "aqua"},{"nbt":"mutation.name","storage": "bw:basic","interpret": true},{"text": "："},{"nbt":"mutation.disc","storage": "bw:basic","interpret": true},"\n"]

# 清理残留

## 重置计分板
execute unless score @s round_id = $ round_id run scoreboard players set @s round_death 0
execute unless score @s round_id = $ round_id run scoreboard players set @s round_combo 0
execute unless score @s round_id = $ round_id run scoreboard players set @s round_bed_break 0
execute unless score @s round_id = $ round_id run scoreboard players set @s round_kill 0

scoreboard players set @s compass_select 0

## 末影箱和物品
clear @s[team=]

item replace entity @s[team=] enderchest.0 with air
item replace entity @s[team=] enderchest.1 with air
item replace entity @s[team=] enderchest.2 with air
item replace entity @s[team=] enderchest.3 with air
item replace entity @s[team=] enderchest.4 with air
item replace entity @s[team=] enderchest.5 with air
item replace entity @s[team=] enderchest.6 with air
item replace entity @s[team=] enderchest.7 with air
item replace entity @s[team=] enderchest.8 with air
item replace entity @s[team=] enderchest.9 with air
item replace entity @s[team=] enderchest.10 with air
item replace entity @s[team=] enderchest.11 with air
item replace entity @s[team=] enderchest.12 with air
item replace entity @s[team=] enderchest.13 with air
item replace entity @s[team=] enderchest.14 with air
item replace entity @s[team=] enderchest.15 with air
item replace entity @s[team=] enderchest.16 with air
item replace entity @s[team=] enderchest.17 with air
item replace entity @s[team=] enderchest.18 with air
item replace entity @s[team=] enderchest.19 with air
item replace entity @s[team=] enderchest.20 with air
item replace entity @s[team=] enderchest.21 with air
item replace entity @s[team=] enderchest.22 with air
item replace entity @s[team=] enderchest.23 with air
item replace entity @s[team=] enderchest.24 with air
item replace entity @s[team=] enderchest.25 with air
item replace entity @s[team=] enderchest.26 with air

# 添加玩家 id
scoreboard players operation @s[team=!spec] player_id = $ player_id
execute if entity @s[team=!spec] run scoreboard players add $ player_id 1

# 给没有队伍的玩家分队
execute if score $team_auto_allocation debug matches 0 as @s[team=,tag=!lose_bed] run function bw:game/player_event/team_join

# 进入旁观
## 在本局已经淘汰
execute as @s[tag=lose_bed] run function bw:game/player_event/spec_join
## 有队伍但是没有床
execute as @s[team=blue] if score $blue_bed team matches 2 run function bw:game/player_event/spec_join
execute as @s[team=green] if score $green_bed team matches 2 run function bw:game/player_event/spec_join
execute as @s[team=red] if score $red_bed team matches 2 run function bw:game/player_event/spec_join
execute as @s[team=yellow] if score $yellow_bed team matches 2 run function bw:game/player_event/spec_join

# 数据控制
gamemode survival @s[team=red]
gamemode survival @s[team=yellow]
gamemode survival @s[team=blue]
gamemode survival @s[team=green]
gamemode spectator @s[team=spec]

function bw:game/bossbar_player

tag @s[team=red] add playing
tag @s[team=yellow] add playing
tag @s[team=blue] add playing
tag @s[team=green] add playing
tag @s[team=spec] add playing

scoreboard players operation @s round_id = $ round_id

# 扣除精力

function bw:global/clock/real_time/get

execute if score $hour real_time matches 4..22 run scoreboard players remove @s energy 20
execute unless score $hour real_time matches 4..22 run scoreboard players remove @s energy 30

tag @a remove out_of_energy
tag @a[scores={energy=..-1}] add out_of_energy

# 解锁合成配方
execute if score $shop_type gamerule matches 1 run recipe give @s *

# 给予初始装备
execute as @s[tag=playing,team=!spec] run function bw:game/default_kit

# 进入地图
function bw:game/map/enter

# 药水控制
effect clear
effect give @s regeneration 3 255 true

# tip 
execute if entity @s[scores={tip_craft_way=..0}] if score $exchange gamerule matches 1 run tag @s add tip_craft_way
function bw:game/map/sub/enter

# 修饰器
execute if score $max_health gamerule matches 1 run attribute @s max_health modifier add maxhealth_one 10 add_value
execute if score $max_health gamerule matches 2 run attribute @s max_health modifier add maxhealth_two 20 add_value

# 刷新本局信息
function bw:game/system_event/update_scoreboard

# 音乐控制
scoreboard players set @s music_next 2

# （地图接口）玩家载入
setblock 0 50 -32 minecraft:redstone_block

# 随机事件
execute if score $working mutation = $working mutation run function bw:game/mutation/trigger/player_enter