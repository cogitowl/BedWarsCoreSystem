# 每 20 分钟执行一次
schedule function bw:global/clock/20min 1d replace

# 恢复体力值
execute unless score $ energy_clock = $ energy_clock run scoreboard players set $ energy_clock -2147483648
execute if score $ energy_clock matches 2147483600.. run say energy_clock 即将达到 2147483648
scoreboard players add $ energy_clock 1
execute as @a[team=!debug] at @s run function bw:global/event/energy_regain