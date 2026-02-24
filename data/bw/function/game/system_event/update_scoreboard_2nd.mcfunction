# 更新本局信息（右侧计分板） 2nd


# time & round id

scoreboard players reset $config temp
scoreboard players operation $config temp = @s round_info_config
scoreboard players operation $config temp /= $10000 const
scoreboard players operation $config temp %= $10 const

$execute if score $config temp matches 1 run scoreboard players set §7$(time_hour):$(time_min):$(time_sec)｜R$(round_id) round_info 14
execute if score $config temp matches 1 run scoreboard players set §1 round_info 13

# time event

scoreboard players reset $config temp
scoreboard players operation $config temp = @s round_info_config
scoreboard players operation $config temp /= $1000 const
scoreboard players operation $config temp %= $10 const

$execute if score $config temp matches 1 run scoreboard players set $(time_event)：$(time_left_min):$(time_left_sec) round_info 12
execute if score $config temp matches 1 run scoreboard players set §2 round_info 11

# teams

scoreboard players reset $config temp
scoreboard players operation $config temp = @s round_info_config
scoreboard players operation $config temp /= $100 const
scoreboard players operation $config temp %= $10 const

$execute if score $config temp matches 1 run scoreboard players set §a绿队$(green_bed)（$(green_num)）$(player_green) round_info 10
$execute if score $config temp matches 1 run scoreboard players set §9蓝队$(blue_bed)（$(blue_num)）$(player_blue) round_info 9
$execute if score $config temp matches 1 run scoreboard players set §e黄队$(yellow_bed)（$(yellow_num)）$(player_yellow) round_info 8
$execute if score $config temp matches 1 run scoreboard players set §c红队$(red_bed)（$(red_num)）$(player_red) round_info 7
execute if score $config temp matches 1 run scoreboard players set §3 round_info 6

# PVP信息：击杀、最终击杀、破床
# 养成信息：EXP、COIN

scoreboard players reset $config temp
scoreboard players operation $config temp = @s round_info_config
scoreboard players operation $config temp /= $10 const
scoreboard players operation $config temp %= $10 const

$execute if score $config temp matches 1 run scoreboard players set §r击杀：§a$(kill_num) round_info 5
$execute if score $config temp matches 1 run scoreboard players set §r破床：§a$(bed_break_num) round_info 4

$execute if score $config temp matches 1 run scoreboard players set §rEXP：§b$(exp) round_info 3
$execute if score $config temp matches 1 run scoreboard players set §rCOIN：§6$(coin) round_info 2
execute if score $config temp matches 1 run scoreboard players set §4 round_info 1

# server info

$scoreboard players set 汐恒起床V$(version) round_info 0