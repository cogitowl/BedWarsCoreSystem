# 床自毁

# 破坏床
summon marker 0 0 0 {CustomName:{"text":"系统"},Tags:["bed","temp"]}
execute if score $red_bed team matches 1 as @e[type=marker,tag=bed,tag=temp] at @s run function bw:game/bed/team/red
execute if score $yellow_bed team matches 1 as @e[type=marker,tag=bed,tag=temp] at @s run function bw:game/bed/team/yellow
execute if score $green_bed team matches 1 as @e[type=marker,tag=bed,tag=temp] at @s run function bw:game/bed/team/green
execute if score $blue_bed team matches 1 as @e[type=marker,tag=bed,tag=temp] at @s run function bw:game/bed/team/blue
function bw:game/update_round_info
kill @e[type=marker,tag=temp,tag=bed]

# 刷新 Bossbar 玩家
schedule function bw:game/bossbar_player 25t replace