execute store result score @s temp run data get entity @s Pos[1]
execute as @a at @s if entity @s[scores={temp=..-3}] run effect give @s levitation 5 2 false
scoreboard players reset @s temp