# CYCLE map copyer

# execute
$execute unless blocks ~ -64 ~$(z1) ~ 64 ~$(z2) ~ -64 ~ all run function bw:global/map/body/execute with storage bw:map clone.cycle
$kill @e[y=-64,dz=$(z4),dy=128,type=!player]

particle end_rod ~ 20 ~40 0 -10 20 1 100 normal @a
particle end_rod ~ 20 ~40 0 -10 -20 1 100 normal @a
particle end_rod ~ 20 ~120 0 -10 20 1 100 normal @a
particle end_rod ~ 20 ~120 0 -10 -20 1 100 normal @a

# schedule
execute if score $fast_mode map matches 1 run schedule function bw:global/map/body/commander 1t
execute unless score $fast_mode map matches 1 run schedule function bw:global/map/body/commander 10t