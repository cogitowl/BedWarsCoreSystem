# 游戏结束文件


# （地图接口）游戏结束
setblock 4 50 -32 minecraft:redstone_block


# HUB 控制
scoreboard objectives setdisplay below_name
scoreboard objectives setdisplay list
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay sidebar.team.blue
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.gray
bossbar set countdown:blue players
bossbar set countdown:green players
bossbar set countdown:yellow players
bossbar set countdown:red players
bossbar set countdown:spec players

# 获得胜利的玩家
tag @a remove win

function bw:game/team_update
execute if score $blue_number team matches 1 run tag @a[team=blue] add win
execute if score $green_number team matches 1 run tag @a[team=green] add win
execute if score $yellow_number team matches 1 run tag @a[team=yellow] add win
execute if score $red_number team matches 1 run tag @a[team=red] add win

execute unless entity @a[tag=win] run scoreboard players set $no_winner temp 1

# 计算排名
tag @a remove total_rank1
tag @a remove total_rank2
tag @a remove total_rank3
tag @a remove total_rankl

## 1
function bw:game_end/get_max_score
execute as @a if score @s round_exp = $score_max temp run tag @s add total_rank1
tag @a[tag=total_rank1] add max_uncounted
## 2
function bw:game_end/get_max_score

execute as @a[tag=!max_uncounted] if score @s round_exp = $score_max temp run tag @s add total_rank2
tag @a[tag=total_rank2] add max_uncounted
## 3
function bw:game_end/get_max_score
execute as @a[tag=!max_uncounted] if score @s round_exp = $score_max temp run tag @s add total_rank3
tag @a[tag=max_uncounted] remove max_uncounted
## 最低分
scoreboard players set $score_min temp 2147483647
scoreboard players operation $score_min temp < @a[tag=playing] round_exp
execute as @a if score @s round_exp = $score_min temp run tag @s add total_rankl
## 没有名次
tag @a[tag=playing,tag=!total_rank1,tag=!total_rank2,tag=!total_rank3] add total_rankl

# 本局 K/D 计算
execute as @a run scoreboard players operation @s round_kd = @s round_kill
scoreboard players operation @a round_kd *= $1000 const
execute as @a run scoreboard players operation @s round_kd /= @s round_death

# 本局平均表现分
execute as @a[tag=playing] run scoreboard players operation $average_score temp += @s round_exp
execute store result score $playing_count temp if entity @a[tag=playing]
scoreboard players operation $average_score temp /= $playing_count temp

# 显示排名
tellraw @a ""
tellraw @a {"storage":"bw:lang","nbt":"game.end.settlement.title","interpret": true}
tellraw @a ""
tellraw @a {"storage":"bw:lang","nbt":"game.end.settlement.rank1","interpret": true}
execute if entity @a[tag=total_rank2] run tellraw @a {"storage":"bw:lang","nbt":"game.end.settlement.rank2","interpret": true}
execute if entity @a[tag=total_rank3] run tellraw @a {"storage":"bw:lang","nbt":"game.end.settlement.rank3","interpret": true}
tellraw @a ""

# 个人结算内容
execute as @a[tag=playing,scores={round_kill=0}] run tellraw @s {"storage":"bw:lang","nbt":"game.end.settlement.kill.none","interpret": true}
execute as @a[tag=playing,scores={round_kill=1..}] run tellraw @s {"storage":"bw:lang","nbt":"game.end.settlement.kill.count","interpret": true}
# execute as @a[tag=playing,scores={round_death=0}] run tellraw @s [" ",{"text": "好家伙，你小子§60死§f！"}]
execute as @a[tag=playing] run tellraw @s {"storage":"bw:lang","nbt":"game.end.settlement.death","interpret": true}
execute as @a[tag=playing] run tellraw @s {"storage":"bw:lang","nbt":"game.end.settlement.KD","interpret": true}
execute unless score $no_winner temp matches 1 run tellraw @a[tag=playing,tag=win] {"storage":"bw:lang","nbt":"game.end.settlement.win.own","interpret": true}
execute unless score $no_winner temp matches 1 run tellraw @a[tag=playing,tag=!win] {"storage":"bw:lang","nbt":"game.end.settlement.win.lose","interpret": true}
execute if score $no_winner temp matches 1 run tellraw @a[tag=playing] {"storage":"bw:lang","nbt":"game.end.settlement.win.nope","interpret": true}
tellraw @a[tag=playing] ""

# 奖励结束 
tellraw @a[tag=playing] ""
execute as @a[tag=!afk,team=!debug] at @s run function lib:sounds/theend

scoreboard players reset @a temp
scoreboard players reset $playing_count
scoreboard players reset $average_score

