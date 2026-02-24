# 更新本局信息（右侧计分板）
scoreboard players reset * round_info

# 本局信息配置
# 用Bossbar｜用Scoreboard——事件和本局ID｜时间事件｜队伍信息｜PVP和养成信息｜数据包与服务器信息（0-False；1-True）
# 11-11111

# 时间信息、局信息、版本 
function bw:global/clock/real_time/get
data modify storage bw:game info.time_hour set from storage bw:global clock.real_time.char.hour
data modify storage bw:game info.time_min set from storage bw:global clock.real_time.char.min
data modify storage bw:game info.time_sec set from storage bw:global clock.real_time.char.sec

execute store result storage bw:game info.round_id int 1 run scoreboard players get @s round_id

data modify storage bw:game info.version set value "26.2"

# 时间事件
data modify storage bw:game info.time_event set from entity @e[type=text_display,limit=1,tag=event_name] text

scoreboard players operation $time_left temp = $next_event timing
scoreboard players operation $time_left temp -= $now timing

scoreboard players operation $time_left_min temp = $time_left temp
scoreboard players operation $time_left_min temp /= $60 const

scoreboard players operation $time_left_sec temp = $time_left temp
scoreboard players operation $time_left_sec temp %= $60 const

execute store result storage bw:game info.time_left_min int 1 run scoreboard players get $time_left_min temp
execute store result storage bw:game info.time_left_sec int 1 run scoreboard players get $time_left_sec temp

# 更新队伍信息
function bw:game/team_update

## 队伍状态
execute if score $red_bed team matches 2 run data modify storage bw:game info.red_bed set value "§c[✘]"
execute if score $red_bed team matches 1 run data modify storage bw:game info.red_bed set value "§a[✔]"

execute if score $yellow_bed team matches 2 run data modify storage bw:game info.yellow_bed set value "§c[✘]"
execute if score $yellow_bed team matches 1 run data modify storage bw:game info.yellow_bed set value "§a[✔]"

execute if score $green_bed team matches 2 run data modify storage bw:game info.green_bed set value "§c[✘]"
execute if score $green_bed team matches 1 run data modify storage bw:game info.green_bed set value "§a[✔]"

execute if score $blue_bed team matches 2 run data modify storage bw:game info.blue_bed set value "§c[✘]"
execute if score $blue_bed team matches 1 run data modify storage bw:game info.blue_bed set value "§a[✔]"

## 人数

execute store result storage bw:game info.red_num int 1 run scoreboard players get $red_number team
execute store result storage bw:game info.blue_num int 1 run scoreboard players get $blue_number team
execute store result storage bw:game info.yellow_num int 1 run scoreboard players get $yellow_number team
execute store result storage bw:game info.green_num int 1 run scoreboard players get $green_number team

## 玩家所在队伍

execute if entity @s[team=red] run data modify storage bw:game info.player_red set value "§7(你)"
execute unless entity @s[team=red] run data modify storage bw:game info.player_red set value ""

execute if entity @s[team=blue] run data modify storage bw:game info.player_blue set value "§7(你)"
execute unless entity @s[team=blue] run data modify storage bw:game info.player_blue set value ""

execute if entity @s[team=yellow] run data modify storage bw:game info.player_yellow set value "§7(你)"
execute unless entity @s[team=yellow] run data modify storage bw:game info.player_yellow set value ""

execute if entity @s[team=green] run data modify storage bw:game info.player_green set value "§7(你)"
execute unless entity @s[team=green] run data modify storage bw:game info.player_green set value ""

# PVP 信息
execute store result storage bw:game info.kill_num int 1 run scoreboard players get @s round_kill
execute store result storage bw:game info.final_kill_num int 1 run scoreboard players get @s round_kill
execute store result storage bw:game info.bed_break_num int 1 run scoreboard players get @s round_bed_break

# 养成信息
execute store result storage bw:game info.exp int 1 run scoreboard players get @s round_exp
execute store result storage bw:game info.coin int 1 run scoreboard players get @s round_coin

# 传入参数
function bw:game/system_event/update_scoreboard_2nd with storage bw:game info

