execute at @a[team=red,scores={place_iron_golem=1..}] run team join red @e[type=minecraft:iron_golem,tag=iron_golem,team=,sort=nearest,limit=1]
execute at @a[team=blue,scores={place_iron_golem=1..}] run team join blue @e[type=minecraft:iron_golem,tag=iron_golem,team=,sort=nearest,limit=1]
execute at @a[team=yellow,scores={place_iron_golem=1..}] run team join yellow @e[type=minecraft:iron_golem,tag=iron_golem,team=,sort=nearest,limit=1]
execute at @a[team=green,scores={place_iron_golem=1..}] run team join green @e[type=minecraft:iron_golem,tag=iron_golem,team=,sort=nearest,limit=1]
scoreboard players reset @a[scores={place_iron_golem=1..}] place_iron_golem
tag @e[type=minecraft:iron_golem,tag=iron_golem,tag=!target,team=!] add target
execute as @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=!] at @s on target run tag @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=!,sort=nearest,limit=1] remove target
execute as @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=red] at @s run damage @s 0 minecraft:player_attack by @p[team=!red,team=!debug,team=!spec,team=!lobby,gamemode=!creative,gamemode=!spectator,distance=..32]
execute as @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=blue] at @s run damage @s 0 minecraft:player_attack by @p[team=!blue,team=!debug,team=!spec,team=!lobby,gamemode=!creative,gamemode=!spectator,distance=..32]
execute as @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=yellow] at @s run damage @s 0 minecraft:player_attack by @p[team=!yellow,team=!debug,team=!spec,team=!lobby,gamemode=!creative,gamemode=!spectator,distance=..32]
execute as @e[type=minecraft:iron_golem,tag=iron_golem,tag=target,team=green] at @s run damage @s 0 minecraft:player_attack by @p[team=!green,team=!debug,team=!spec,team=!lobby,gamemode=!creative,gamemode=!spectator,distance=..32]