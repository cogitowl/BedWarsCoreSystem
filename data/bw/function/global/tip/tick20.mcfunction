# 每 20 Tick 执行一次

# 冷却处理
scoreboard players add @a[scores={tip_cd=-1..}] tip_cd 1

# 模式执行

## 循环提示
execute as @a if score @s tip_cd matches 120.. run function bw:global/tip/1_cycle/cycle

## 即时提示
execute as @a if score @s tip_cd matches 3.. run function bw:global/tip/2_instant/_call

## 延迟提示
execute as @a if score @s tip_cd matches 60.. run function bw:global/tip/3_delay/_call