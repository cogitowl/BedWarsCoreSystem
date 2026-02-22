# 每 1 Tick 执行一次

# 追踪火球
execute if score $working mutation matches 4 run function bw:game/mutation/4/tick1

# 爆炸箭矢
execute if score $working mutation matches 6 as @e[type=arrow,nbt={inGround:true}] at @s run function bw:game/mutation/6/tick1