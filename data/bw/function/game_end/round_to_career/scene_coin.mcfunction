scoreboard players set $wait_time game_end_title_a 4

# 增加 生涯货币
execute as @a if score @s round_coin matches 1.. run scoreboard players add @s coin 10
execute as @a if score @s round_coin matches 1.. run scoreboard players remove @s round_coin 10

# 展现动画
execute as @a if score @s round_coin matches 0.. run playsound entity.experience_orb.pickup ui @s ~ ~ ~ 1 1 1 

title @a[tag=playing,scores={round_coin=0..}] title {"text":"- COIN -",color:gold}
execute as @a[tag=playing,scores={round_coin=0..}] run title @s subtitle ["本局 ",{"score":{name:"@s",objective:"round_coin"}}," --> ",{"score":{name:"@s",objective:"coin"}}," 生涯"]

# loop
execute as @a[scores={round_coin=10..}] run schedule function bw:game_end/round_to_career/scene_coin 2t replace 