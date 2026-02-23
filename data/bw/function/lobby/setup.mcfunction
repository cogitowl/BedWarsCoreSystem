# 要求系统载入状态：大厅
scoreboard players set $working gaming 0

# 游戏规则
gamerule spectators_generate_chunks false
gamerule fall_damage false
gamerule natural_health_regeneration true
gamerule advance_time true
gamerule fire_spread_radius_around_player 128

# 世界出生点
setworldspawn 0 50 0 0.0 0.0

# 初始化地图统计数据
function bw:global/map/data_update

# 初始化地图选择
execute store result score $sel map run data get storage bw:map using.id 1
execute unless score $sel map = $sel map run scoreboard players set $sel map 0

# HUB 控制
scoreboard objectives setdisplay below_name
scoreboard objectives setdisplay list
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay sidebar.team.blue
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.gray

scoreboard objectives setdisplay sidebar.team.aqua exp

bossbar set countdown:blue players
bossbar set countdown:green players
bossbar set countdown:yellow players
bossbar set countdown:red players
bossbar set countdown:spec players

# 玩家载入
execute as @a[team=!debug] run function bw:lobby/player_enter

# 载入地图数据
function bw:lobby/map/command_area/unload/trigger
schedule function bw:lobby/map/change/handle 2s replace

# 设定 Bossbar
bossbar set lobby color blue
bossbar set lobby name [{"text":"正在初始化大厅系统..."}]
bossbar set lobby visible true
bossbar set lobby style progress
bossbar set lobby value 2333
bossbar set lobby max 2333