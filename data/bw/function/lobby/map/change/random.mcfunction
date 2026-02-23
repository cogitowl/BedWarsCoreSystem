# 随机选择地图


# 随机地图
$execute store result score $map_random temp run random value 1..$(max)

# 如果重复则重新随机
$execute if score $map_random temp matches $(last) run function bw:lobby/map/change/random
execute store result storage bw:basic map.last int 1 run scoreboard players get $map_random temp