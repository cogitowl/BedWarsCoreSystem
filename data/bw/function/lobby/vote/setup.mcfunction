# 投票来确认地图

# 重置残留历史
scoreboard players reset * vote

# 同步地图选择
scoreboard players operation $using map = $sel map

# 随机地图
execute if score $using map matches 0 run function bw:lobby/map/choice/random with storage bw:basic map

# 加载地图中心点
function bw:global/map/playing_area/generate_entity

# 快速模式
execute if score #sys_working map = $using map run scoreboard players set $fast_mode temp 1
execute if score #sys_working map = $using map run say [地图复制系统] 当前投票中的地图正在复制中，系统正在加速复制，造成卡顿属于正常现象。

# 载入投票状态
scoreboard players set $voting vote 1
scoreboard players set $countdown_max vote 60

# 同步倒计时
scoreboard players operation $countdown vote = $countdown_max vote 

# 投票计分板
scoreboard players enable @a[team=!debug,scores={afk_time=..179}] vote 
execute store result bossbar lobby max run scoreboard players get $countdown_max vote
execute store result bossbar lobby value run scoreboard players get $countdown_max vote
bossbar set lobby players @a

# 更新 Bossbar
data modify storage bw:lobby/vote last_message set value {"text":"正在等待投票..."}
bossbar set lobby name [{"storage":"bw:lang","nbt":"lobby.map.choice.now","interpret": true}," | 投票: ",{"storage":"bw:lobby/vote","nbt": "last_message","interpret": true}]