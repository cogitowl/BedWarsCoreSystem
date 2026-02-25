# CYCLE map copyer

# execute
$execute unless blocks ~ -64 ~$(z1) ~ 64 ~$(z2) ~ -64 ~ all run function bw:global/map/body/execute with storage bw:map clone.cycle
$kill @e[type=!player,y=-64,dy=128,dz=$(z4),dx=-10]
$kill @e[type=!player,y=-64,dy=128,dz=$(z4),dx=10]

# special effect
execute unless score $fast_mode map matches 1 run particle end_rod ~ 20 ~40 0 -10 20 1 200 normal @a
execute unless score $fast_mode map matches 1 run particle end_rod ~ 20 ~40 0 -10 -20 1 200 normal @a
execute unless score $fast_mode map matches 1 run particle end_rod ~ 20 ~120 0 -10 20 1 200 normal @a
execute unless score $fast_mode map matches 1 run particle end_rod ~ 20 ~120 0 -10 -20 1 200 normal @a

execute if score $fast_mode map matches 1 run particle dragon_breath ~ 20 ~40 0 -10 20 1 200 force @a
execute if score $fast_mode map matches 1 run particle dragon_breath ~ 20 ~40 0 -10 -20 1 200 force @a
execute if score $fast_mode map matches 1 run particle dragon_breath ~ 20 ~120 0 -10 20 1 200 force @a
execute if score $fast_mode map matches 1 run particle dragon_breath ~ 20 ~120 0 -10 -20 1 200 force @a

# tip
$execute as @a[y=-64,dy=128,dz=$(z4),dx=-10] if entity @s[scores={tip_map_clone=..0}] run tag @s add tip_map_clone
$execute as @a[y=-64,dy=128,dz=$(z4),dx=10] if entity @s[scores={tip_map_clone=..0}] run tag @s add tip_map_clone


# schedule
execute if score $fast_mode map matches 1 run schedule function bw:global/map/body/commander 1t
execute unless score $fast_mode map matches 1 run schedule function bw:global/map/body/commander 10t