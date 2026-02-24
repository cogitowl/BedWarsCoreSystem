



# 修改召唤点位置
execute store result score $x temp run random value -100..100
scoreboard players operation $x temp += $playing_center_x temp
scoreboard players operation $x temp *= $10 const
scoreboard players operation $x temp += $5 const
execute store result entity @s Pos[0] double 0.1 run scoreboard players get $x temp

execute store result score $z temp run random value -100..100
scoreboard players operation $z temp += $playing_center_z temp
scoreboard players operation $z temp *= $10 const
scoreboard players operation $z temp += $5 const
execute store result entity @s Pos[2] double 0.1 run scoreboard players get $z temp

# 修改效果
data modify entity @s BlockState set value {Name:"minecraft:anvil",Properties:{facing:"north"}}
# tp YaJn @s

# 完成
tag @s add projectile_checked