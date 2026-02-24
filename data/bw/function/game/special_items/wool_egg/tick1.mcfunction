# 每 1 Tick 执行一次

execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}}] at @s if block ~ ~-1 ~ air on origin store result score @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},sort=nearest,limit=1] temp run clear @s #minecraft:wool 1
execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}}] at @s if block ~ ~-1 ~ air on origin store result score @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},sort=nearest,limit=1] temp run clear @s #minecraft:wool 1
execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},scores={temp=1}] at @s if block ~ ~-2 ~ air on origin if entity @s[team=red] run setblock ~ ~-2 ~ minecraft:red_wool
execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},scores={temp=1}] at @s if block ~ ~-2 ~ air on origin if entity @s[team=blue] run setblock ~ ~-2 ~ minecraft:blue_wool
execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},scores={temp=1}] at @s if block ~ ~-2 ~ air on origin if entity @s[team=green] run setblock ~ ~-2 ~ minecraft:green_wool
execute as @e[type=minecraft:egg,nbt=!{Item:{tag:{}}},scores={temp=1}] at @s if block ~ ~-2 ~ air on origin if entity @s[team=!red,team=!blue,team=!green,team=!yellow] run setblock ~ ~-2 ~ minecraft:white_wool