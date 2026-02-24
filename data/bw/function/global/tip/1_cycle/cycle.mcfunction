# 循环提示 文件

scoreboard players set @s tip_cd 0
scoreboard players add @s tip_cycle 1

scoreboard players add @s[scores={tip_cycle=5..}] tip_timer 1
scoreboard players set @s[scores={tip_cycle=5..,tip_timer=..1}] tip_cycle 1
scoreboard players set @s[scores={tip_cycle=5..,tip_timer=2..}] tip_cycle 3

function bw:global/tip/1_cycle/real