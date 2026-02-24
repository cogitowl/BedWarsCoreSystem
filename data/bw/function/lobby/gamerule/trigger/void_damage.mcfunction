# 虚空伤害（0=原版 1=额外添加伤害 2=立即死亡）
scoreboard players add $void_damage gamerule 1
execute if score $void_damage gamerule matches 3 run scoreboard players set $void_damage gamerule 0