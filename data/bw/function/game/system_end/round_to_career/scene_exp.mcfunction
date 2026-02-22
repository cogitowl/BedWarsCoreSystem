scoreboard players set $wait_time game_end_title_a 4

# 增加 生涯经验点（使用原版方法）
execute as @a if score @s round_exp matches 1.. run experience add @s 1 points

execute as @a if score @s round_exp matches 1.. store result score @s exp run experience query @s levels
execute as @a if score @s round_exp matches 1.. store result score @s exp_point run experience query @s points

execute as @a if score @s round_exp matches 1.. run scoreboard players remove @s round_exp 1

# 展现动画
execute as @a if score @s round_exp matches 0.. run playsound entity.experience_orb.pickup ui @s ~ ~ ~ 1 1 1 

title @a[tag=playing,scores={round_exp=0..}] title {"text":"- EXP -",color:aqua}
execute as @a[tag=playing,scores={round_exp=0..}] run title @s subtitle ["本局 ",{"score":{name:"@s",objective:"round_exp"}},"点"," --> ",{"score":{name:"@s",objective:"exp"}},"级",{"score":{name:"@s",objective:"exp_point"}},"点 生涯"]

# loop
execute as @a[scores={round_exp=1..}] run schedule function bw:game/system_end/round_to_career/scene_exp 2t replace 