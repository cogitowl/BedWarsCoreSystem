# 游戏结束文件

# 清除游戏区域和残留物品
kill @e[type=item,tag=!bypass_kill]

function bw:global/clear_entity

# 重置玩家 id
scoreboard players reset * player_id
scoreboard players set $ player_id 0

# 随机事件
execute if score $working mutation = $working mutation run function bw:game/mutation/trigger/game_end
execute store result storage bw:basic mutation.last int 1 run scoreboard players get $working mutation

# 清理残留数据
execute as @a run attribute @s attack_speed base set 4

tag @a remove lose_bed
tag @a remove playing
tag @a remove spec

scoreboard players reset @a respawn_time
scoreboard players reset @a temp
# scoreboard players reset @a round_score
# scoreboard players reset @a round_death
# scoreboard players reset @a round_kill
# scoreboard players reset @a round_combo

scoreboard players reset $size border 
scoreboard players reset $countdown gaming

scoreboard players reset $working mutation
scoreboard players reset $bed_break_check gamerule
scoreboard players reset $active player_count
scoreboard players reset $game_playing player_count
scoreboard players reset $now timing
scoreboard players reset $shrinking border

scoreboard players reset $red_kill team
scoreboard players reset $blue_kill team
scoreboard players reset $green_kill team
scoreboard players reset $yellow_kill team
scoreboard players reset $red_bed team
scoreboard players reset $blue_bed team
scoreboard players reset $green_bed team
scoreboard players reset $yellow_bed team

# 发送地图恢复请求
execute store result storage bw:basic temp.map_id int 1 run scoreboard players get $using map
function bw:global/map/control/request with storage bw:basic temp

# 载入大厅状态
function bw:lobby/setup
forceload add 0 0
