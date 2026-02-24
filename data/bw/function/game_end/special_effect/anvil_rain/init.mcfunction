# 铁砧雨 初始化


# 储存必要数据

execute store result score $playing_center_x temp run data get entity @e[type=marker,tag=playing_center,limit=1] Pos[0] 1
execute store result score $playing_center_z temp run data get entity @e[type=marker,tag=playing_center,limit=1] Pos[2] 1

# 生成召唤中心点
kill @e[type=marker,tag=summon_center]
summon minecraft:marker ~ ~ ~ {Tags:["summon_center"]}

data modify entity @e[type=marker,tag=summon_center,limit=1] Pos[0] set from entity @e[type=marker,tag=playing_center,limit=1] Pos[0]
data modify entity @e[type=marker,tag=summon_center,limit=1] Pos[2] set from entity @e[type=marker,tag=playing_center,limit=1] Pos[2]

execute store result score $y temp run data get entity @e[type=marker,tag=playing_center,limit=1] Pos[1] 1
scoreboard players add $y temp 50
execute store result entity @e[type=marker,tag=summon_center,limit=1] Pos[1] double 1 run scoreboard players get $y temp

scoreboard players reset $y temp

