# 每 20 Tick 执行一次

# 冷却处理
scoreboard players add @a[scores={tip_cd=0..}] tip_cd 1

# 执行
execute as @a if score @s tip_cd matches 20 run function bw:global/tip/cycle
give @s honey_bottle[unbreakable={}] 1