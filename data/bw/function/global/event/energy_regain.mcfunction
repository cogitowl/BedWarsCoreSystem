# 恢复精力值

# cal process & delete exp while offline
scoreboard players operation $cal energy_clock = @s energy_clock

scoreboard players operation $cal_result energy_clock = $ energy_clock
scoreboard players operation $cal_result energy_clock -= $cal energy_clock

execute if score $cal_result energy_clock matches 1000.. run scoreboard players remove @s exp 1
execute if score $cal_result energy_clock matches 1100.. run scoreboard players remove @s exp 2
execute if score $cal_result energy_clock matches 1200.. run scoreboard players remove @s exp 3
execute if score $cal_result energy_clock matches 1300.. run scoreboard players remove @s exp 4
execute if score $cal_result energy_clock matches 1400.. run scoreboard players remove @s exp 5
execute if score $cal_result energy_clock matches 1500.. run scoreboard players remove @s exp 6
execute if score $cal_result energy_clock matches 1600.. run scoreboard players remove @s exp 7
execute if score $cal_result energy_clock matches 1700.. run scoreboard players remove @s exp 8
execute if score $cal_result energy_clock matches 1800.. run scoreboard players remove @s exp 9
execute if score $cal_result energy_clock matches 1900.. run scoreboard players remove @s exp 10
execute if score $cal_result energy_clock matches 2000.. run scoreboard players remove @s exp 11
execute if score $cal_result energy_clock matches 2100.. run scoreboard players remove @s exp 12

scoreboard players operation $cal_result energy_clock *= $regain energy

# if $ clock > 2147483648: regain to maximumt
execute if score $cal_result energy_clock matches -2147483648..-1 run scoreboard players operation $cal_result energy_clock = $limit energy

# result apply
scoreboard players operation @s energy += $cal_result energy_clock

# limit and sync
execute if score @s energy > $limit energy run scoreboard players operation @s energy = $limit energy

scoreboard players operation @s energy_clock = $ energy_clock



# reset
scoreboard players reset $cal_result energy_clock
scoreboard players reset $cal energy_clock