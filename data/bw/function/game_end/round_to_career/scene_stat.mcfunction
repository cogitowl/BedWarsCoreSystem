scoreboard players set $wait_time game_end_title_a 4

# 找到 kill death 的最大值，作为播放音效的参考值
execute as @a run scoreboard players operation @s game_end_title_c < @s round_kill
execute as @a run scoreboard players operation @s game_end_title_c < @s round_death
execute as @a unless score @s game_end_title_b = @s game_end_title_b run scoreboard players operation @s game_end_title_b = @s game_end_title_c

# 增加 生涯数据
execute as @a if score @s round_kill matches 1.. run scoreboard players add @s stat_kill 1
execute as @a if score @s round_kill matches 1.. run scoreboard players remove @s round_kill 1

execute as @a if score @s round_death matches 1.. run scoreboard players add @s stat_death 1
execute as @a if score @s round_death matches 1.. run scoreboard players remove @s round_death 1

execute as @a if score @s round_bed_break matches 1.. run scoreboard players add @s stat_bed_break 1
execute as @a if score @s round_bed_break matches 1.. run scoreboard players remove @s round_bed_break 1

# 展现动画

scoreboard players remove @a[scores={game_end_title_b=1..}] game_end_title_b 1

execute as @a if score @s game_end_title_b matches 0.. run playsound entity.experience_orb.pickup ui @s ~ ~ ~ 1 1 1 

# 🗡💀⛏ | stat | round
title @a[tag=playing,scores={game_end_title_b=0..}] title {"text":"- 🗡 💀 ⛏ -",color:gold}
execute as @a[tag=playing,scores={game_end_title_b=0..}] run title @s subtitle ["本局 ",{"score":{name:"@s",objective:"round_kill"}},"/",{"score":{name:"@s",objective:"round_death"}},"/",{"score":{name:"@s",objective:"round_bed_break"}}," --> ",{"score":{name:"@s",objective:"stat_kill"}},"/",{"score":{name:"@s",objective:"stat_death"}},"/",{"score":{name:"@s",objective:"stat_bed_break"}}," 生涯"]

# loop
execute as @a[scores={round_death=1..}] run schedule function bw:game_end/round_to_career/scene_stat 10t replace 
execute as @a[scores={round_kill=1..}] run schedule function bw:game_end/round_to_career/scene_stat 10t replace 
execute as @a[scores={round_bed_break=1..}] run schedule function bw:game_end/round_to_career/scene_stat 10t replace 